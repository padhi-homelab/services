#!/usr/bin/env bash

set -Eumo pipefail

SELF_DIR="$(cd -P -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)"

DOCKER_COMPOSE_CMD="docker compose"

EXIT_CODE_USAGE_ERROR=-1
EXIT_CODE_COMPOSE_NOT_FOUND=-2
EXIT_CODE_SERVICE_NOT_FOUND=-3

EXIT_CODE_PRE_HOOK_SCRIPT_ERROR=1
EXIT_CODE_SERVICE_SIMPLE_VERB_FAILURE=2
EXIT_CODE_POST_HOOK_SCRIPT_ERROR=3

IGNORE_FAILURES="no"
NO_HOOK_SCRIPTS="no"
NO_LABELS="no"
NO_OVERRIDE="no"
NO_PORTS="no"

# # # #
#
# HELPER FUNCTIONS
#
# # # #

do_clean_verb () {
  rm -rfv data .env
}

do_down_verb () {
  $DOCKER_COMPOSE_CMD down
}

do_env_gen () {
  rm -rf .env
  if [ -f "../env.default.sh" ]; then
    ../env.default.sh > .env
  fi
  if [ -f "env.sh" ]; then
    ./env.sh >> .env
  fi
}

do_post_hooks () {
  if [ -f "docker-compose.$SIMPLE_VERB.post_hook.sh" ]; then
    ./docker-compose.$SIMPLE_VERB.post_hook.sh
    if [ $? -ne 0 ] && [ "$IGNORE_FAILURES" != "yes" ]; then
      exit $EXIT_CODE_POST_HOOK_SCRIPT_ERROR
    fi
  fi
}

do_pre_hooks () {
  if [ -f "docker-compose.$SIMPLE_VERB.pre_hook.sh" ]; then
    ./docker-compose.$SIMPLE_VERB.pre_hook.sh
    if [ $? -ne 0 ] && [ "$IGNORE_FAILURES" != "yes" ]; then
      exit $EXIT_CODE_PRE_HOOK_SCRIPT_ERROR
    fi
  fi
}

do_up_verb () {
  if does_use_traefik_proxy; then
    ../_scripts/create-proxy-network.sh
  fi

  COMPOSE_FILES=" -f docker-compose.yml "

  if [ "$NO_LABELS" != "yes" ] && [ -f "docker-compose.labels.yml" ]; then
    COMPOSE_FILES=" $COMPOSE_FILES -f docker-compose.labels.yml "
  fi
  if [ "$NO_PORTS" != "yes" ] && [ -f "docker-compose.ports.yml" ]; then
    COMPOSE_FILES=" $COMPOSE_FILES -f docker-compose.ports.yml "
  fi

  if [ "$NO_OVERRIDE" != "yes" ] && [ -f "docker-compose.override.yml" ]; then
    COMPOSE_FILES=" $COMPOSE_FILES -f docker-compose.override.yml "
  fi

  $DOCKER_COMPOSE_CMD $COMPOSE_FILES up -d
}

does_use_traefik_proxy () {
  grep -qE 'traefik\.enable[=:]\s*true' docker-compose*.y*ml &>/dev/null
}

usage () {
  if [ $# -gt 0 ]; then echo -e "\nERROR: $1" >&2 ; fi
  services="$(\ls -Cdw100000 */ | sed 's:[[:space:]]_[^[:space:]]*/::g; s:\/::g; s:[[:space:]]\+: :g' | fmt -64 | column -t)"
  echo -e "
Usage: $0 <verb>[,<verb>,...] [flags] <svc_dir> [<svc_dir> ...]

Verbs:
  clean                     Delete '<svc_dir>/data'
  down                      Stop a service
  up                        Start a service

Flags:
  [--ignore-failures, -i]   Ignore failing services and continue
  [--no-hook-scripts, -s]   Ignore all pre and post hook scripts
  [--no-labels, -l]         Ignore 'docker-compose.labels.yml' files
  [--no-override, -o]       Ignore 'docker-compose.override.yml' files
  [--no-ports, -p]          Ignore 'docker-compose.ports.yml' files

Services:" >&2
  while IFS= read -r line ; do
    echo "  $line"
  done <<< "$services" >&2
  exit $EXIT_CODE_USAGE_ERROR
}

# # # #
#
# OPTIONS PARSING
#
# # # #

[ $# -gt 0 ] || usage

VERBS="$1"
VERBS="${VERBS//,/ }"

for VERB in $VERBS; do
  [ "$VERB" = "clean" ] || \
  [ "$VERB" = "down" ] || \
  [ "$VERB" = "up" ] || \
    usage "Unknown verb: $VERB"
done
shift

for opt in "$@"; do
  shift
  case "$opt" in
    "--ignore-failures")    set -- "$@" "-i" ;;
    "--no-hook-scripts")    set -- "$@" "-s" ;;
    "--no-labels")          set -- "$@" "-l" ;;
    "--no-override")        set -- "$@" "-o" ;;
    "--no-ports")           set -- "$@" "-p" ;;

    "--")                   set -- "$@" "--" ;;
    "--"*)                  usage "Unrecognized option: $opt." ;;
    *)                      set -- "$@" "$opt"
  esac
done

OPTIND=1
while getopts ':ilops' OPTION ; do
  case "$OPTION" in
    "i" ) IGNORE_FAILURES="yes" ;;
    "l" ) NO_LABELS="yes"
          [ "$VERB" = "up" ] || \
            echo "[!] '-l/--no-labels is redundant with '$VERB'."
          ;;
    "o" ) NO_OVERRIDE="yes"
          [ "$VERB" = "up" ] || \
            echo "[!] '-o/--no-override is redundant with '$VERB'."
          ;;
    "p" ) NO_PORTS="yes"
          [ "$VERB" = "up" ] || \
            echo "[!] '-p/--no-ports is redundant with '$VERB'."
          ;;
    "s" ) NO_HOOK_SCRIPTS="yes" ;;

      * ) usage "Unrecognized option: -$OPTARG." ;;
  esac
done
shift $(($OPTIND -1))

# # # #
#
# DOCKER COMPOSE
#
# # # #

echo -n 'Looking for `docker compose` ... ' >&2
if ! $DOCKER_COMPOSE_CMD &> /dev/null; then
  echo 'NOT FOUND!' >&2
  echo -n 'Looking for `docker-compose` ... ' >&2
  if ! command -v docker-compose &> /dev/null; then
    echo 'NOT FOUND!' >&2
    exit $EXIT_CODE_COMPOSE_NOT_FOUND
  else
    echo 'FOUND' >&2
    DOCKER_COMPOSE_CMD="docker-compose"
  fi
else
  echo 'FOUND' >&2
fi

# # # #
#
# VERB HANDLING
#
# # # #

SERVICES=("$@")
perform () {
  local SIMPLE_VERB=$1
  for svc in "${SERVICES[@]}"; do
    svc="${svc%/}"
    echo -e "\n[+] Executing '$SIMPLE_VERB' on $svc ..."
    if ! { [ "$svc" = "$(basename "$svc")" ] && [ -d "$SELF_DIR/$svc" ]; }; then
      echo "[X] ERROR: '$svc' is not a base directory at '$SELF_DIR'!" >&2
      if [ "$IGNORE_FAILURES" = "yes" ]; then
        continue
      else
        exit $EXIT_CODE_SERVICE_NOT_FOUND
      fi
    fi
    cd "$SELF_DIR/$svc"

    [ "$NO_HOOK_SCRIPTS" = "yes" ] || do_pre_hooks

    [ "$SIMPLE_VERB" = "clean" ] || do_env_gen

    if [ "$SIMPLE_VERB" = "clean" ]; then
      do_clean_verb
    elif [ "$SIMPLE_VERB" = "up" ]; then
      do_up_verb
    elif [ "$SIMPLE_VERB" = "down" ]; then
      do_down_verb
    fi

    if [ $? -ne 0 ] && [ "$IGNORE_FAILURES" != "yes" ]; then
      exit $EXIT_CODE_SERVICE_SIMPLE_VERB_FAILURE
    fi

    [ "$NO_HOOK_SCRIPTS" = "yes" ] || do_post_hooks
  done
}

printf '%.0s-' {1..80}
for VERB in $VERBS; do
  perform $VERB
  printf '%.0s-' {1..80}
done
echo
