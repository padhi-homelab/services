#!/usr/bin/env bash

set -Eumo pipefail

SELF_DIR="$(cd -P -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)"

EXIT_CODE_USAGE_ERROR=-1
EXIT_CODE_COMPOSE_NOT_FOUND=-2
EXIT_CODE_SERVICE_NOT_FOUND=-3

EXIT_CODE_PRE_HOOK_SCRIPT_ERROR=1
EXIT_CODE_SERVICE_VERB_FAILURE=2
EXIT_CODE_POST_HOOK_SCRIPT_ERROR=3

usage() {
  if [ $# -gt 0 ]; then echo -e "\nERROR: $1" >&2 ; fi
  echo -en "
Usage: $0 <verb> [flags] <svc_dir_name> [<svc_dir_name> ...]

Verbs:
  clean                     Delete \`service/data\`
  down                      Stop a service
  restart                   Restart a service
  up                        Start a service

Flags:
  [--ignore-failures, -i]   Ignore failing services and continue
  [--no-hook-scripts, -s]   Ignore all pre and post hook scripts
  [--no-override, -o]       Ignore docker-compose.override.yml file

Services:
  `\\ls -Cd */ | sed 's/\///g'`
" >&2 ; exit $EXIT_CODE_USAGE_ERROR
}

[ $# -gt 0 ] || usage

VERB="$1"
[ "$VERB" == "clean" ] || \
[ "$VERB" == "down" ] || \
[ "$VERB" == "up" ] || \
[ "$VERB" == "restart" ] || \
  usage "Unknown verb: $VERB"
shift

IGNORE_FAILURES="no"
NO_OVERRIDE="no"
NO_HOOK_SCRIPTS="no"

for opt in "$@"; do
  shift
  case "$opt" in
    "--ignore-failures")    set -- "$@" "-i" ;;
    "--no-override")        set -- "$@" "-o" ;;
    "--no-hook-scripts")    set -- "$@" "-s" ;;

    "--")                   set -- "$@" "--" ;;
    "--"*)                  usage "Unrecognized option: $opt." ;;
    *)                      set -- "$@" "$opt"
  esac
done

OPTIND=1
while getopts ':ios' OPTION ; do
  case "$OPTION" in
    "i" ) IGNORE_FAILURES="yes" ;;
    "o" ) NO_OVERRIDE="yes"
          [ "$VERB" == "up" ] || \
          [ "$VERB" == "restart" ] || \
            echo "[!] '-$OPTARG' is ignored with '$VERB' verb."
          ;;
    "s" ) NO_HOOK_SCRIPTS="yes" ;;

      * ) usage "Unrecognized option: -$OPTARG." ;;
  esac
done
shift $(($OPTIND -1))

if ! command -v docker-compose &> /dev/null; then
    echo '`docker-compose` could not be found' >&2
    exit $EXIT_CODE_COMPOSE_NOT_FOUND
fi

SERVICES="$@"
do_simple_verb() {
  local SIMPLE_VERB=$1
  for svc in "$SERVICES"; do
    echo -e "\n[+] Executing '$SIMPLE_VERB' on $svc ..."
    if ! [ -d "$SELF_DIR/$svc" ]; then
      echo "[X] ERROR: "$SELF_DIR/$svc" does not exist!" >&2
      if [ "$IGNORE_FAILURES" == "yes" ]; then
        continue
      else
        exit $EXIT_CODE_SERVICE_NOT_FOUND
      fi
    fi
    cd "$SELF_DIR/$svc"

    if [ "$NO_HOOK_SCRIPTS" != "yes" ]; then
      if [ -f "docker-compose.$SIMPLE_VERB.pre_hook.sh" ]; then
        ./docker-compose.$SIMPLE_VERB.pre_hook.sh
        if [ $? -ne 0 ] && [ "$IGNORE_FAILURES" != "yes" ]; then
          exit $EXIT_CODE_PRE_HOOK_SCRIPT_ERROR
        fi
      fi
    fi

    if [ "$SIMPLE_VERB" == "up" ]; then
      if [ "$NO_OVERRIDE" == "yes" ]; then
        docker-compose -f docker-compose.yml up -d
      else
        docker-compose up -d
      fi
    elif [ "$SIMPLE_VERB" == "down" ]; then
      docker-compose down
    else
      rm -rf data
    fi
    if [ $? -ne 0 ] && [ "$IGNORE_FAILURES" != "yes" ]; then
      exit $EXIT_CODE_SERVICE_SIMPLE_VERB_FAILURE
    fi

    if [ "$NO_HOOK_SCRIPTS" != "yes" ]; then
      if [ -f "docker-compose.$SIMPLE_VERB.post_hook.sh" ]; then
        ./docker-compose.$SIMPLE_VERB.post_hook.sh
        if [ $? -ne 0 ] && [ "$IGNORE_FAILURES" != "yes" ]; then
          exit $EXIT_CODE_POST_HOOK_SCRIPT_ERROR
        fi
      fi
    fi
  done
}

if [ "$VERB" == "restart" ]; then
  do_simple_verb down
  do_simple_verb up
else
  do_simple_verb $VERB
fi
