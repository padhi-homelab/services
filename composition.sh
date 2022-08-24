#!/usr/bin/env bash

set -Eumo pipefail

SELF_DIR="$(cd -P -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)"

DOCKER_COMPOSE_CMD="docker compose"
YQ_CMD="yq"

EXIT_CODE_USAGE_ERROR=-1
EXIT_CODE_DEP_INSTALL_FAILURE=-2
EXIT_CODE_COMPOSITION_NOT_FOUND=-3

EXIT_CODE_ENV_ERROR=1
EXIT_CODE_PRE_HOOK_SCRIPT_ERROR=2
EXIT_CODE_SIMPLE_VERB_FAILURE=3
EXIT_CODE_POST_HOOK_SCRIPT_ERROR=4

FLAG_IGNORE_FAILURES="no"
FLAG_ATTACH_DEVICES="no"
FLAG_NO_HOOK_SCRIPTS="no"
FLAG_NO_LABELS="no"
FLAG_NO_OVERRIDE="no"
FLAG_NO_PORTS="no"
FLAG_REGENERATE="no"

: "${SERVICE_INTERNAL_CALL:=}"

# # # #
#
# HELPER FUNCTIONS
#
# # # #

do_check_verb () {
  if [ -f depends.on ]; then
    for dep_comp_dir in $(cat depends.on) ; do
      do_self_composition check "$dep_comp_dir" || return 1
    done
  fi

  for svc in $("$YQ_CMD" -M '.services | keys | .[]' docker-compose.yml); do
    if $DOCKER_COMPOSE_CMD ps $svc 2> /dev/null | grep -q healthy ; then
      continue
    fi
    print_error "'$svc' is not healthy."
    [ "$FLAG_IGNORE_FAILURES" = "yes" ] || return 1
  done
}

do_clean_verb () {
  rm -rfv data generated .env
}

do_down_verb () {
  $DOCKER_COMPOSE_CMD down
}

do_env_gen () {
  [ ! -f .env ] || [ "$FLAG_REGENERATE" = "yes" ] || return
  rm -rf .env

  echo "[*] Generating '.env'"
  [ ! -f "$SELF_DIR/server.env" ] || cp "$SELF_DIR/server.env" .env

  [ ! -f "$SELF_DIR/env.default.sh" ] || "$SELF_DIR/env.default.sh" >> .env || \
    [ "$FLAG_IGNORE_FAILURES" = "yes" ] || exit $EXIT_CODE_ENV_ERROR
  [ ! -f "env.sh" ] || ./env.sh >> .env || \
    [ "$FLAG_IGNORE_FAILURES" = "yes" ] || exit $EXIT_CODE_ENV_ERROR
}

do_post_hooks () {
  ls docker-compose.$SIMPLE_VERB.post_hook*.sh &> /dev/null || return
  echo "[*] Running 'post' hooks for '$SIMPLE_VERB'"

  ./docker-compose.$SIMPLE_VERB.post_hook.sh || \
    [ "$FLAG_IGNORE_FAILURES" = "yes" ] || exit $EXIT_CODE_POST_HOOK_SCRIPT_ERROR

  find . -maxdepth 1 -name "docker-compose.$SIMPLE_VERB.post_hook.user*.sh" -print0 | \
    while IFS= read -r -d '' hook_file ; do
      "$hook_file" || [ "$FLAG_IGNORE_FAILURES" = "yes" ] || exit $EXIT_CODE_POST_HOOK_SCRIPT_ERROR
    done
}

do_pre_hooks () {
  ls docker-compose.$SIMPLE_VERB.pre_hook*.sh &> /dev/null || return
  echo "[*] Running 'pre' hooks for '$SIMPLE_VERB'"

  ./docker-compose.$SIMPLE_VERB.pre_hook.sh || \
    [ "$FLAG_IGNORE_FAILURES" = "yes" ] || exit $EXIT_CODE_PRE_HOOK_SCRIPT_ERROR

  find . -maxdepth 1 -name "docker-compose.$SIMPLE_VERB.pre_hook.user*.sh" -print0 | \
    while IFS= read -r -d '' hook_file ; do
      "$hook_file" || [ "$FLAG_IGNORE_FAILURES" = "yes" ] || exit $EXIT_CODE_PRE_HOOK_SCRIPT_ERROR
    done
}

do_run_depends () {
  [ -f depends.on ] || return
  echo "[*] Checking dependencies ..."

  for dep_comp_dir in $(cat depends.on) ; do
    if ! do_self_composition check "$dep_comp_dir"; then
      do_self_composition down,up $dep_comp_dir
    fi
  done
}

do_self_composition () {
  local cur_dir="$(pwd)"
  cd "$SELF_DIR"
  SERVICE_INTERNAL_CALL=1 bash "$0" "$@"
  local exit_code=$?
  cd "$cur_dir"
  return $exit_code
}

do_template_gen () {
  find ./config -name '*.template.*' 2>/dev/null | grep -q . || return
  echo "[*] Checking templated config files "

  find ./config -name '*.template.*' -print0 | \
    while IFS= read -r -d '' template_file ; do
      generated_file="./generated${template_file#./config}"
      mkdir -p "$(dirname "$generated_file")"
      generated_file="${generated_file/.template/}"
      if [ ! -f "$generated_file" ] || [ "$FLAG_REGENERATE" = "yes" ]; then
        "$SELF_DIR/_scripts/generate-and-verify.sh" \
          "$template_file" \
          "$generated_file"
      fi
    done
}

do_up_verb () {
  for ext_net in $($YQ_CMD -M '.networks | with_entries(select(.value.external = true)) | keys | .[]' docker-compose.yml); do
    "$SELF_DIR/_scripts/create-network.sh" $ext_net
  done

  COMPOSE_FILES=" -f docker-compose.yml "

  if [ "$FLAG_ATTACH_DEVICES" = "yes" ] && [ -f "docker-compose.devices.yml" ]; then
    COMPOSE_FILES=" $COMPOSE_FILES -f docker-compose.devices.yml "
  fi
  if [ "$FLAG_NO_LABELS" != "yes" ] && [ -f "docker-compose.labels.yml" ]; then
    COMPOSE_FILES=" $COMPOSE_FILES -f docker-compose.labels.yml "
  fi
  if [ "$FLAG_NO_PORTS" != "yes" ] && [ -f "docker-compose.ports.yml" ]; then
    COMPOSE_FILES=" $COMPOSE_FILES -f docker-compose.ports.yml "
  fi

  if [ "$FLAG_NO_OVERRIDE" != "yes" ] && [ -f "docker-compose.override.yml" ]; then
    COMPOSE_FILES=" $COMPOSE_FILES -f docker-compose.override.yml "
  fi

  $DOCKER_COMPOSE_CMD $COMPOSE_FILES up -d
}

print_error () {
  echo "[X] ERROR: " $1 >&2
}

print_sep () {
  [ -n "$SERVICE_INTERNAL_CALL" ] || printf '%.0s-' {1..80}
}

usage () {
  if [ $# -gt 0 ]; then echo -e "\nERROR: $1" >&2 ; fi
  compositions="$(\ls -Cdw100000 */ | sed 's:[[:space:]]_[^[:space:]]*/::g; s:\/::g; s:[[:space:]]\+: :g' | fmt -48 | column -t)"
  echo -e "
Usage:
  $0 <verb>[,<verb>,...] [flags] <comp_dir> [<comp_dir> ...]

Verbs:
  check                     Check health of a composition
  clean                     Delete '<comp_dir>/data'
  down                      Stop a composition
  up                        Start a composition

Flags:
  [--ignore-failures, -i]   Ignore verb failures and continue
  [--no-devices, -d]        Ignore 'docker-compose.devices.yml' files
  [--no-hook-scripts, -s]   Ignore all pre and post hook scripts
  [--no-labels, -l]         Ignore 'docker-compose.labels.yml' files
  [--no-override, -o]       Ignore 'docker-compose.override.yml' files
  [--no-ports, -p]          Ignore 'docker-compose.ports.yml' files
  [--regenerate, -r]        Force generate '.env' and 'generated/'

Compositions:" >&2
  while IFS= read -r line ; do
    echo "  $line"
  done <<< "$compositions" >&2
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
  [ "$VERB" = "check" ] || \
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
    "--attach-devices")     set -- "$@" "-d" ;;
    "--no-hook-scripts")    set -- "$@" "-s" ;;
    "--no-labels")          set -- "$@" "-l" ;;
    "--no-override")        set -- "$@" "-o" ;;
    "--no-ports")           set -- "$@" "-p" ;;
    "--regenerate")         set -- "$@" "-r" ;;

    "--")                   set -- "$@" "--" ;;
    "--"*)                  usage "Unrecognized option: $opt." ;;
    *)                      set -- "$@" "$opt"
  esac
done

OPTIND=1
while getopts ':idloprs' OPTION ; do
  case "$OPTION" in
    "i" ) FLAG_IGNORE_FAILURES="yes" ;;
    "d" ) FLAG_ATTACH_DEVICES="yes"
          [ "$VERB" = "up" ] || \
            echo "[!] '-d/--attach-devices is redundant with '$VERB'."
          ;;
    "l" ) FLAG_NO_LABELS="yes"
          [ "$VERB" = "up" ] || \
            echo "[!] '-l/--no-labels is redundant with '$VERB'."
          ;;
    "o" ) FLAG_NO_OVERRIDE="yes"
          [ "$VERB" = "up" ] || \
            echo "[!] '-o/--no-override is redundant with '$VERB'."
          ;;
    "p" ) FLAG_NO_PORTS="yes"
          [ "$VERB" = "up" ] || \
            echo "[!] '-p/--no-ports is redundant with '$VERB'."
          ;;
    "r" ) FLAG_REGENERATE="yes" ;;
    "s" ) FLAG_NO_HOOK_SCRIPTS="yes" ;;

      * ) usage "Unrecognized option: -$OPTARG." ;;
  esac
done
shift $(($OPTIND -1))

[ $# -gt 0 ] || exit 0

# # # #
#
# INSTALL DEPS
#
# # # #

if ! $DOCKER_COMPOSE_CMD &> /dev/null; then
  if ! command -v docker-compose &> /dev/null; then
    if ! [ -x "$SELF_DIR/.lib/compose" ]; then
      if ! "$SELF_DIR/_scripts/install-compose.sh" "$SELF_DIR/.lib/compose"; then
        print_error 'Failed to locate `docker compose`!'
        exit $EXIT_CODE_DEP_INSTALL_FAILURE
      fi
    else
      DOCKER_COMPOSE_CMD="$SELF_DIR/.lib/compose"
    fi
  else
    DOCKER_COMPOSE_CMD="docker-compose"
  fi
fi

if ! $YQ_CMD &> /dev/null; then
  if ! [ -x "$SELF_DIR/.lib/yq" ]; then
    if ! "$SELF_DIR/_scripts/install-yq.sh" "$SELF_DIR/.lib/yq"; then
      print_error 'Failed to locate `yq`!'
      exit $EXIT_CODE_DEP_INSTALL_FAILURE
    fi
  else
    YQ_CMD="$SELF_DIR/.lib/yq"
  fi
fi

# # # #
#
# VERB HANDLING
#
# # # #

COMPOSITIONS=("$@")
perform () {
  local SIMPLE_VERB=$1
  for comp in "${COMPOSITIONS[@]}"; do
    comp="${comp%/}"
    echo -e "\n[+] Executing '$SIMPLE_VERB' on '$comp' ... "
    if ! { [ "$comp" = "$(basename "$comp")" ] && [ -d "$SELF_DIR/$comp" ]; }; then
      print_error "'$comp' is not a base directory at '$SELF_DIR'!"
      [ "$FLAG_IGNORE_FAILURES" = "yes" ] || exit $EXIT_CODE_COMPOSITION_NOT_FOUND
      continue
    fi
    if ! [ -f "$SELF_DIR/$comp/docker-compose.yml" ]; then
      print_error "No 'docker-compose.yml' found under '$comp'!"
      [ "$FLAG_IGNORE_FAILURES" = "yes" ] || exit $EXIT_CODE_COMPOSITION_NOT_FOUND
      continue
    fi

    cd "$SELF_DIR/$comp"

    [ "$SIMPLE_VERB" != "up" ] || do_run_depends

    [ "$SIMPLE_VERB" = "clean" ] || do_env_gen

    [ "$SIMPLE_VERB" != "up" ] || do_template_gen

    [ "$FLAG_NO_HOOK_SCRIPTS" = "yes" ] || do_pre_hooks

    local verb_exit=0
    if [ "$SIMPLE_VERB" = "check" ]; then
      do_check_verb ; verb_exit=$?
      if [ $verb_exit -eq 0 ]; then
        echo "[>] '$comp' is healthy!"
      fi
    elif [ "$SIMPLE_VERB" = "clean" ]; then
      do_clean_verb ; verb_exit=$?
    elif [ "$SIMPLE_VERB" = "up" ]; then
      do_up_verb ; verb_exit=$?
    elif [ "$SIMPLE_VERB" = "down" ]; then
      do_down_verb ; verb_exit=$?
    fi

    if [ $verb_exit -ne 0 ] && [ "$FLAG_IGNORE_FAILURES" != "yes" ]; then
      exit $EXIT_CODE_SIMPLE_VERB_FAILURE
    fi

    [ "$FLAG_NO_HOOK_SCRIPTS" = "yes" ] || do_post_hooks
  done
}

print_sep
for VERB in $VERBS; do
  perform $VERB
  print_sep
done
echo
