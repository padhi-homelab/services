#!/usr/bin/env bash

set -Eumo pipefail

SELF_DIR="$(cd -P -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)"

LIB_DIR="$SELF_DIR/.lib"
SCRIPTS_DIR="$SELF_DIR/_scripts"

DOCKER_COMPOSE_CMD="docker compose"
YQ_CMD="yq"

EXIT_CODE_USAGE_ERROR=-1
EXIT_CODE_DEP_INSTALL_FAILURE=-2
EXIT_CODE_COMPOSITION_NOT_FOUND=-3

EXIT_CODE_GEN_ERROR=1
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

__append_env_from () {
  if [ -f "$1" ] ; then
    if ! ( set -a && source .env && "$1" ) >> .env ; then
      local script_file="${1/#./$comp}"
      echo "'${script_file#$SELF_DIR/}' FAILED!" ; return 1
    fi
  fi
}

__CALL_SELF__ () {
  local cur_dir="$(pwd)"
  cd "$SELF_DIR"
  SERVICE_INTERNAL_CALL=1 bash "$0" "$@"
  local exit_code=$?
  cd "$cur_dir"
  return $exit_code
}

__create_external_networks () {
  local EXTERNAL_NETWORKS=( )
  for yml in "$@" ; do
    for ext_net in $($YQ_CMD -M '.networks | with_entries(select(.value.external == true)) | keys | .[]' $yml) ; do
      # NOTE: `echo ... | xargs` to get rid of quotes around network name,
      # possible during extraction via `yq`.
      EXTERNAL_NETWORKS+=( $(echo $ext_net | xargs) )
    done
  done

  for ext_net in $(printf "%s\n" "${EXTERNAL_NETWORKS[@]}" | sort -u) ; do
    "$SCRIPTS_DIR/create-network.sh" $ext_net || return 1
  done
}

__error () {
  echo "[X] ERROR:" $1 >&2
}

__gen_env () {
  [ ! -f .env ] || [ "$FLAG_REGENERATE" = "yes" ] || return 0
  rm -rf .env

  echo -n "[*] Generating '.env': "
  cp "$SELF_DIR/static.global.env" .env
  [ ! -f "$SELF_DIR/static.global.override.env" ] || \
    cat "$SELF_DIR/static.global.override.env" >> .env

  __append_env_from "$SELF_DIR/dynamic.global.env.sh" || return 1
  __append_env_from "$SELF_DIR/dynamic.global.override.env.sh" || return 1

  __append_env_from "./dynamic.env.sh" || return 1
  __append_env_from "./dynamic.override.env.sh" || return 1

  echo OK
}

__gen_templates () {
  find ./extra -name '*.template.*' 2>/dev/null | grep -q . || return 0
  echo "[*] Checking templated files ..."

  find ./extra -name '*.template.*' -print0 | \
    while IFS= read -r -d '' template_file ; do
      local generated_file="./generated${template_file#./extra}"
      mkdir -p "$(dirname "$generated_file")"
      generated_file="${generated_file/.template/}"
      if [ ! -f "$generated_file" ] || [ "$FLAG_REGENERATE" = "yes" ] ; then
        "$SCRIPTS_DIR/generate-and-verify.sh" "$template_file" "$generated_file" \
          || return 1
      fi
    done
}

__run_hooks () {
  ls docker-compose.$1.$2_hook*.sh &> /dev/null || return 0
  echo "[*] Running '$2' hooks for '$1' ..."

  if ! ( set -a && source .env && "./docker-compose.$1.$2_hook.sh" ) ; then
    __error "HOOK 'docker-compose.$1.$2_hook.sh' FAILED!" ; return 1
  fi

  find . -maxdepth 1 -type f -name "docker-compose.$1.$2_hook.override*.sh" -print0 | \
    while IFS= read -r -d '' hook_file ; do
      if ! ( set -a && source .env && "$hook_file" ) ; then
        __error "HOOK '${hook_file#./}' FAILED!" ; return 1
      fi
    done
}

__sep_line () {
  [ -n "$SERVICE_INTERNAL_CALL" ] || printf '%.0s-' {1..80}
}

__verify_dependencies () {
  [ -f depends.on ] || return 0
  echo "[*] Checking dependencies ..."

  for dep_comp_dir in $(cat depends.on) ; do
    if ! __CALL_SELF__ check "$dep_comp_dir" ; then
      __CALL_SELF__ down,up $dep_comp_dir || return 1
    fi
  done
}

__verify_volumes () {
  local MOUNTED_VOLUMES=( )
  for yml in "$@" ; do
    for vol in $($YQ_CMD -M '.services.[] | with_entries(select(.key == "volumes")) | .[] | .[] as $v | $v' $yml) ; do
      case $vol in
        ./* | /* ) MOUNTED_VOLUMES+=( $vol ) ;;
               * ) ;;
      esac
    done
  done

  for vol in $(printf "%s\n" "${MOUNTED_VOLUMES[@]}" | sort -u) ; do
    local vol="$(echo "$vol" | cut -d: -f1)"
    if ! [ -e $vol ] ; then
      __error "VOLUME PATH '${vol/#./$comp}' NOT FOUND!" ; return 1
    fi
  done
}

# # # #
#
# TOP-LEVEL FUNCTIONS
#
# # # #

do_check () {
  if [ -f depends.on ] ; then
    for dep_comp_dir in $(cat depends.on) ; do
      __CALL_SELF__ check "$dep_comp_dir" || return 1
    done
  fi

  for svc in $("$YQ_CMD" -M '.services | keys | .[]' docker-compose.yml) ; do
    if $DOCKER_COMPOSE_CMD ps $svc 2> /dev/null | grep -q healthy ; then
      continue
    fi
    __error "'$svc' is not healthy."
    [ "$FLAG_IGNORE_FAILURES" = "yes" ] || return 1
  done
}

do_clean () {
  rm -rfv data generated .env
}

do_down () {
  $DOCKER_COMPOSE_CMD down
}

do_up () {
  local COMPOSE_FILES=( "docker-compose.yml" )

  if [ "$FLAG_ATTACH_DEVICES" = "yes" ] && [ -f "docker-compose.devices.yml" ] ; then
    COMPOSE_FILES+=( "docker-compose.devices.yml" )
  fi
  if [ "$FLAG_NO_LABELS" != "yes" ] && [ -f "docker-compose.labels.yml" ] ; then
    COMPOSE_FILES+=( "docker-compose.labels.yml" )
  fi
  if [ "$FLAG_NO_PORTS" != "yes" ] && [ -f "docker-compose.ports.yml" ] ; then
    COMPOSE_FILES+=( "docker-compose.ports.yml" )
  fi

  if [ "$FLAG_NO_OVERRIDE" != "yes" ] && [ -f "docker-compose.override.yml" ] ; then
    COMPOSE_FILES+=( "docker-compose.override.yml")
  fi

  __create_external_networks "${COMPOSE_FILES[@]}" || return 1
  __verify_volumes "${COMPOSE_FILES[@]}" || return 1

  $DOCKER_COMPOSE_CMD ${COMPOSE_FILES[@]/#/-f } up -d
}

usage () {
  if [ $# -gt 0 ] ; then echo -e "\nERROR: $1" >&2 ; fi
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

for VERB in $VERBS ; do
  [ "$VERB" = "check" ] || \
  [ "$VERB" = "clean" ] || \
  [ "$VERB" = "down" ] || \
  [ "$VERB" = "up" ] || \
    usage "Unknown verb: $VERB"
done
shift

for opt in "$@" ; do
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

if [ $# -le 0 ] ; then
  __error "No <comp_dir>' provided!"
  exit $EXIT_CODE_COMPOSITION_NOT_FOUND
fi

# # # #
#
# INSTALL DEPS
#
# # # #

if ! $DOCKER_COMPOSE_CMD &> /dev/null ; then
  if ! command -v docker-compose &> /dev/null ; then
    if ! [ -x "$LIB_DIR/compose" ] ; then
      if ! "$SCRIPTS_DIR/install-compose.sh" "$LIB_DIR/compose" ; then
        __error 'Failed to locate `docker compose`!'
        exit $EXIT_CODE_DEP_INSTALL_FAILURE
      fi
    else
      DOCKER_COMPOSE_CMD="$LIB_DIR/compose"
    fi
  else
    DOCKER_COMPOSE_CMD="docker-compose"
  fi
fi

if ! $YQ_CMD &> /dev/null ; then
  if ! [ -x "$LIB_DIR/yq" ] ; then
    if ! "$SCRIPTS_DIR/install-yq.sh" "$LIB_DIR/yq" ; then
      __error 'Failed to locate `yq`!'
      exit $EXIT_CODE_DEP_INSTALL_FAILURE
    fi
  else
    YQ_CMD="$LIB_DIR/yq"
  fi
fi

# # # #
#
# VERB HANDLING
#
# # # #

COMPOSITIONS=( "$@" )
perform () {
  local SIMPLE_VERB=$1
  for comp in "${COMPOSITIONS[@]}" ; do
    comp="${comp%/}"
    echo -e "\n[+] Executing '$SIMPLE_VERB' on '$comp' ... "
    if ! { [ "$comp" = "$(basename "$comp")" ] && [ -d "$SELF_DIR/$comp" ]; } ; then
      __error "'$comp' is not a base directory at '$SELF_DIR'!"
      [ "$FLAG_IGNORE_FAILURES" = "yes" ] || exit $EXIT_CODE_COMPOSITION_NOT_FOUND
      continue
    fi
    if ! [ -f "$SELF_DIR/$comp/docker-compose.yml" ] ; then
      __error "No 'docker-compose.yml' found under '$comp'!"
      [ "$FLAG_IGNORE_FAILURES" = "yes" ] || exit $EXIT_CODE_COMPOSITION_NOT_FOUND
      continue
    fi

    cd "$SELF_DIR/$comp"

    [ "$SIMPLE_VERB" != "up" ] || __verify_dependencies \
      || [ "$FLAG_IGNORE_FAILURES" = "yes" ] || exit $EXIT_CODE_SIMPLE_VERB_FAILURE

    [ "$SIMPLE_VERB" = "clean" ] || __gen_env \
      || [ "$FLAG_IGNORE_FAILURES" = "yes" ] || exit $EXIT_CODE_GEN_ERROR

    [ "$SIMPLE_VERB" != "up" ] || __gen_templates \
      || [ "$FLAG_IGNORE_FAILURES" = "yes" ] || exit $EXIT_CODE_GEN_ERROR

    [ "$FLAG_NO_HOOK_SCRIPTS" = "yes" ] || __run_hooks $SIMPLE_VERB pre \
      || [ "$FLAG_IGNORE_FAILURES" = "yes" ] || exit $EXIT_CODE_PRE_HOOK_SCRIPT_ERROR

    local verb_exit=0
    do_${SIMPLE_VERB} ; verb_exit=$?

    if [ "$SIMPLE_VERB" = "check" ] && [ $verb_exit -eq 0 ] ; then
      echo "[>] '$comp' is healthy!"
    fi

    if [ $verb_exit -ne 0 ] && [ "$FLAG_IGNORE_FAILURES" != "yes" ] ; then
      exit $EXIT_CODE_SIMPLE_VERB_FAILURE
    fi

    [ "$FLAG_NO_HOOK_SCRIPTS" = "yes" ] || __run_hooks $SIMPLE_VERB post \
      || [ "$FLAG_IGNORE_FAILURES" = "yes" ] || exit $EXIT_CODE_POST_HOOK_SCRIPT_ERROR
  done
}

__sep_line
for VERB in $VERBS ; do
  perform $VERB
  __sep_line
done
echo
