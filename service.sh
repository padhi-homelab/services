#!/usr/bin/env bash

set -Eumo pipefail

SELF_DIR="$(cd -P -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)"

DOCKER_COMPOSE_CMD="docker compose"

EXIT_CODE_USAGE_ERROR=-1
EXIT_CODE_COMPOSE_NOT_FOUND=-2
EXIT_CODE_SERVICE_NOT_FOUND=-3

EXIT_CODE_PRE_HOOK_SCRIPT_ERROR=1
EXIT_CODE_SERVICE_VERB_FAILURE=2
EXIT_CODE_POST_HOOK_SCRIPT_ERROR=3

usage () {
  if [ $# -gt 0 ]; then echo -e "\nERROR: $1" >&2 ; fi
  services=$(\ls -Cd */)
  services=$(echo $services | sed 's/\///g')
  echo -en "
Usage: $0 <verb>[,<verb>,...] [flags] <svc_dir> [<svc_dir> ...]

Verbs:
  clean                     Delete \`<svc_dir>/data\`
  down                      Stop a service
  up                        Start a service

Flags:
  [--ignore-failures, -i]   Ignore failing services and continue
  [--no-hook-scripts, -s]   Ignore all pre and post hook scripts
  [--no-override, -o]       Ignore docker-compose.override.yml file

Services:
  $services
" >&2 ; exit $EXIT_CODE_USAGE_ERROR
}

[ $# -gt 0 ] || usage

VERBS="$1"
VERBS="${VERBS//,/ }"

for VERB in $VERBS; do
  [ "$VERB" == "clean" ] || \
  [ "$VERB" == "down" ] || \
  [ "$VERB" == "up" ] || \
    usage "Unknown verb: $VERB"
done
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
            echo "[!] '-$OPTARG' is ignored with '$VERB' verb."
          ;;
    "s" ) NO_HOOK_SCRIPTS="yes" ;;

      * ) usage "Unrecognized option: -$OPTARG." ;;
  esac
done
shift $(($OPTIND -1))

if ! $DOCKER_COMPOSE_CMD &> /dev/null; then
  echo '`docker compose` could not be found' >&2
  if ! command -v docker-compose &> /dev/null; then
    echo '`docker-compose` could not be found' >&2
    exit $EXIT_CODE_COMPOSE_NOT_FOUND
  else
    DOCKER_COMPOSE_CMD="docker-compose"
  fi
fi

SERVICES=("$@")
perform () {
  local SIMPLE_VERB=$1
  for svc in "${SERVICES[@]}"; do
    echo -e "\n[+] Executing '$SIMPLE_VERB' on $svc ..."
    if ! [ -d "$SELF_DIR/$svc" ]; then
      echo "[X] ERROR: "$SELF_DIR/$svc" is not a directory!" >&2
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
        $DOCKER_COMPOSE_CMD -f docker-compose.yml up -d
      else
        $DOCKER_COMPOSE_CMD up -d
      fi
    elif [ "$SIMPLE_VERB" == "down" ]; then
      $DOCKER_COMPOSE_CMD down
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

printf '%.0s-' {1..80}
for VERB in $VERBS; do
  perform $VERB
  printf '%.0s-' {1..80}
done
echo
