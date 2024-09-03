#!/usr/bin/env bash

set -Eumo pipefail

SELF_DIR="$(cd -P -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)"

LIB_DIR="$SELF_DIR/.lib"
SCRIPTS_DIR="$SELF_DIR/_scripts"
PREREQS_FILENAME="pre.reqs"

DOCKER_CMD="docker"
DOCKER_COMPOSE_CMD="$DOCKER_CMD compose"
YQ_CMD="yq"

EXIT_CODE_USAGE_ERROR=-1
EXIT_CODE_DEP_INSTALL_FAILURE=-2
EXIT_CODE_COMPOSITION_NOT_FOUND=-3

EXIT_CODE_GEN_ERROR=1
EXIT_CODE_PRE_HOOK_SCRIPT_ERROR=2
EXIT_CODE_SIMPLE_VERB_FAILURE=3
EXIT_CODE_POST_HOOK_SCRIPT_ERROR=4

FLAG_SKIP_REGENERATE=""
FLAG_SKIP_PREREQS=""
FLAG_FAIL_ON_ERROR=""
FLAG_SKIP_OVERRIDES=""

OPTION_DEVICES=""
OPTION_HOOKS=""
OPTION_LABELS=""
OPTION_LOGGING=""
OPTION_PORTS=""

ARG_DEVICES="auto"
ARG_HOOKS="auto"
ARG_LABELS="auto"
ARG_LOGGING="auto"
ARG_PORTS="auto"

: "${COMPOSITIONS_INTERNAL_CALL:=}"

# # # # # # # # # # # # # # # # # # #     HELPER ROUTINES     # # # # # # # # # # # # # # # # # # #

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
  COMPOSITIONS_INTERNAL_CALL=1 bash "$0" "$@"
  local exit_code=$?
  cd "$cur_dir"
  return $exit_code
}

__create_external_networks () {
  local EXTERNAL_NETWORKS=( )
  for yml in "$@" ; do
    for ext_net in $($YQ_CMD -M '.networks | with_entries(select(.value.external == true)) | keys | .[]' $yml) ; do
      # NOTE: `echo ... | xargs` to get rid of quotes around network name during extraction via `yq`.
      EXTERNAL_NETWORKS+=( $(echo $ext_net | xargs) )
    done
  done

  for ext_net in $(printf "%s\n" "${EXTERNAL_NETWORKS[@]}" | sort -u) ; do
    "$SCRIPTS_DIR/create-network.sh" $ext_net || return 1
  done
}

__do_prereqs () {
  [ "$FLAG_SKIP_PREREQS" != "yes" ] || return 0

  [ -f "$PREREQS_FILENAME" ] || return 0

  local verb="$1"
  local ensure_running="${2:-no}"
  for prereq_comp_dir in $(cat "$PREREQS_FILENAME") ; do
    if [ "$verb" = "status" ] ; then
      if ! __CALL_SELF__ status -F "$prereq_comp_dir" ; then
        [ "$ensure_running" = "yes" ] || return 1
        __CALL_SELF__ down,up -F "$prereq_comp_dir" || return 1
      fi
    else
      __CALL_SELF__ $verb -F "$prereq_comp_dir" || return 1
    fi
  done
}

__error () {
  echo "[X] ERROR:" $1 >&2
}

__gen_env () {
  [ ! -f .env ] || [ "$FLAG_SKIP_REGENERATE" != "yes" ] || return 0
  rm -rf .env

  echo -n "[*] Generating '.env': "
  cp "$SELF_DIR/static.global.env" .env || return 1
  if [ "$FLAG_SKIP_OVERRIDES" != "yes" ] && [ -f "$SELF_DIR/static.global.override.env" ] ; then
    cat "$SELF_DIR/static.global.override.env" >> .env || return 1
  fi

  __append_env_from "$SELF_DIR/dynamic.global.env.sh" || return 1
  [ "$FLAG_SKIP_OVERRIDES" = "yes" ] || \
    __append_env_from "$SELF_DIR/dynamic.global.override.env.sh" || return 1

  [ ! -f "./static.env" ] || cat "./static.env" >> .env || return 1
  [ "$FLAG_SKIP_OVERRIDES" = "yes" ] || \
    [ ! -f "./static.override.env" ] || cat "./static.override.env" >> .env || return 1

  __append_env_from "./dynamic.env.sh" || return 1
  [ "$FLAG_SKIP_OVERRIDES" = "yes" ] || \
    __append_env_from "./dynamic.override.env.sh" || return 1

  echo OK
}

__gen_templates () {
  find ./extra -name '*.template.*' 2>/dev/null | grep -q . || return 0
  echo "[*] Verifying templated files ..."

  find ./extra -name '*.template.*' -print0 | \
    while IFS= read -r -d '' template_file ; do
      local generated_file="./generated${template_file#./extra}"
      mkdir -p "$(dirname "$generated_file")"
      generated_file="${generated_file/.template/}"
      if [ ! -f "$generated_file" ] || [ "$FLAG_SKIP_REGENERATE" != "yes" ] ; then
        "$SCRIPTS_DIR/generate-and-verify.sh" "$template_file" "$generated_file" \
          || return 1
      fi
    done
}

__read_option () {
  local OPTION="OPTION_$1"

  local ARG="ARG_$1"
  case "${!ARG}" in
       yes ) printf -v "$OPTION" "%s" "yes"
             return 0 ;;
        no ) printf -v "$OPTION" "%s" "no"
             echo -n "$opt_line_head: $1 (arg) "
             opt_line_head=''
             return 0 ;;
  esac

  if [ "$FLAG_SKIP_OVERRIDES" != "yes" ]; then
    local OVERRIDE_COMP_OPTION="$(cat options.override.conf 2>/dev/null | grep $1 | cut -d= -f2)"
    if ! [ -z "$OVERRIDE_COMP_OPTION" ] ; then
      printf -v "$OPTION" "%s" "$OVERRIDE_COMP_OPTION"
      if [ "$OVERRIDE_COMP_OPTION" != "yes" ]; then
        echo -n "$opt_line_head: $1 (conf) "
        opt_line_head=''
      fi
      return 0
    fi
  fi
  
  printf -v "$OPTION" "%s" "yes"
}

__run_hooks () {
  ls docker-compose.$1.$2_hook*.sh &> /dev/null || return 0
  echo "[*] Running '$2' hooks for '$1' ..."

  if ! ( set -a && source .env && "./docker-compose.$1.$2_hook.sh" ) ; then
    __error "HOOK 'docker-compose.$1.$2_hook.sh' FAILED!" ; return 1
  fi

  if [ "$FLAG_SKIP_OVERRIDES" != "yes" ] ; then
    find . -maxdepth 1 -type f -name "docker-compose.$1.$2_hook.override*.sh" -print0 | \
      while IFS= read -r -d '' hook_file ; do
        if ! ( set -a && source .env && "$hook_file" ) ; then
          __error "HOOK '${hook_file#./}' FAILED!" ; return 1
        fi
      done
  fi
}

__verify_volumes () {
  local mounted_volumes=( )
  for yml in "$@" ; do
    for vol in $($YQ_CMD -M '.services.[] | with_entries(select(.key == "volumes")) | .[] | .[] as $v | $v' $yml) ; do
      case $vol in
        ./* | /* ) mounted_volumes+=( $vol ) ;;
               * ) ;;
      esac
    done
  done

  for vol in $(printf "%s\n" "${mounted_volumes[@]}" | sort -u) ; do
    local vol="$(echo "$vol" | cut -d: -f1)"
    if ! [ -e "$vol" ] ; then
      __error "VOLUME PATH '${vol/#./$comp}' NOT FOUND!" ; return 1
    fi
  done
}

# # # # # # # # # # # # # # # # # # #     TOP-LEVEL VERBS     # # # # # # # # # # # # # # # # # # #

do_validate () {
  __do_prereqs validate || return 1

  echo -n '[v] Validating service:'
  for svc in $("$YQ_CMD" -M '.services | keys | .[]' docker-compose.yml) ; do
    local attrs=( $("$YQ_CMD" -M ".services.\"$svc\" | keys | .[]" docker-compose.yml) )
    echo -n " $svc"
    for bad_attr in devices labels logging ports ; do
      if printf '%s\0' "${attrs[@]}" | grep -Fxqz -- $bad_attr; then
        echo ; __error "'$bad_attr' for '$svc' should be in docker_compose.$bad_attr.yml."
        return 1
      fi
    done
  done
  echo
}

do_clean () {
  do_down || return 1
  rm -rfv data generated .env
}

do_down () {
  $DOCKER_COMPOSE_CMD down
}

do_overrides () {
  local any_override=''
  for ofile in $(find .. -maxdepth 1 -type f -iname '*override*') ; do
    any_override='YES'
    echo -n '[G] ' ; realpath -s --relative-to="$(pwd)/.." $ofile
  done
  [ -z "$any_override" ] && echo '[>] No global override files.'

  any_override=''
  for ofile in $(find . -maxdepth 1 -type f -iname '*override*') ; do
    any_override='YES'
    echo -n '[L] ' ; realpath -s --relative-to="$(pwd)/.." $ofile
  done
  [ -z "$any_override" ] && echo '[>] No local override files.'
}

do_pull () {
  $DOCKER_COMPOSE_CMD pull
}

do_status () {
  __do_prereqs status || return 1

  echo -n '[s] Querying service:'
  for svc in $("$YQ_CMD" -M '.services | keys | .[]' docker-compose.yml) ; do
    echo -n " $svc"
    if ! ( $DOCKER_COMPOSE_CMD ps $svc 2> /dev/null | grep -q healthy ) ; then
      echo ; __error "'$svc' is not healthy."
      return 1
    fi
  done
  echo
}

do_up () {
  local COMPOSE_FILES=( "docker-compose.yml" )

  for fragment in DEVICES LABELS LOGGING PORTS ; do
    local OPTION="OPTION_${fragment}"
    if [ "${!OPTION}" != "yes" ] ; then continue ; fi

    if [ -f "docker-compose.${fragment,,}.yml" ] ; then
      COMPOSE_FILES+=( "docker-compose.${fragment,,}.yml" )
    fi
    if [ "$FLAG_SKIP_OVERRIDES" != "yes" ] && [ -f "docker-compose.${fragment,,}.override.yml" ] ; then
      COMPOSE_FILES+=( "docker-compose.${fragment,,}.override.yml" )
    fi
  done

  if [ "$FLAG_SKIP_OVERRIDES" != "yes" ] && [ -f "docker-compose.override.yml" ] ; then
    COMPOSE_FILES+=( "docker-compose.override.yml")
  fi

  __create_external_networks "${COMPOSE_FILES[@]}" || return 1
  __verify_volumes "${COMPOSE_FILES[@]}" || return 1

  $DOCKER_COMPOSE_CMD ${COMPOSE_FILES[@]/#/-f } up -d
}

# # # # # # # # # # # # # # # # # # #     OPTIONS PARSING     # # # # # # # # # # # # # # # # # # #

usage () {
  if [ $# -gt 0 ] ; then echo -e "\nERROR: $1" >&2 ; fi
  num_comps="$(\ls -1 */docker-compose.yml | wc -l)"
  compositions="$(\ls -Cdw100000 */docker-compose.yml | sed 's:\/[^[:space:]]*::g; s:[[:space:]]\+: :g' | fmt -56 | column -t)"
  echo -e "
Usage:
  $0 <verb>[,<verb>,...] [flags] <comp_dir> [<comp_dir> ...]

Verbs: (short forms within [])
  [c]lean        Delete '<comp_dir>/data'
  [d]own         Stop a composition
  [o]verrides    List all override files in a composition
  [p]ull         Pull all images for a composition
  [s]tatus       Display health / status of a composition
  [u]p           Start a composition
  [v]alidate     Validate a composition

Flags:
  [-P | --skip-prereqs]      Ignore verifying/starting prerequisite compositions
  [-F | --fail-on-error]     Fail on the first verb failures
  [-O | --skip-overrides]    Ignore overrides in scripts, environments, flags etc.
  [-R | --skip-regenerate]   Use existing '.env' and 'generated/'

Options:              { yes | no }
  [-d | --devices]    Attach devices listed in 'docker-compose.devices.yml'
  [-g | --logging]    Configure logging as specified in 'docker-compose.logging.yml'
  [-h | --hooks]      Run pre and post hook 'docker-compose.*.yml' scripts
  [-l | --labels]     Use labels specified in 'docker-compose.labels.yml'
  [-p | --ports]      Expose ports listed in 'docker-compose.ports.yml'

 <omitted> = Configure the option unless overridden in options.override.conf:
             use 'docker-compose.*.{sh,yml}' unless overriden in options.override.conf.
        no = Never configure the option (and use docker default instead):
             ignores 'docker-compose.*.{sh,yml}' files.
       yes = Always configure the option as specified:
             ignores options*.conf and uses all 'docker-compose.*.{sh,yml}' files.

Compositions Found ($num_comps):" >&2
  while IFS= read -r line ; do
    echo "  $line"
  done <<< "$compositions" >&2
  exit $EXIT_CODE_USAGE_ERROR
}

[ $# -gt 0 ] || usage

VERBS="$1"
VERBS="${VERBS//,/ }"

expand_verbs () {
  local expanded=""
  while read -n1 char; do
    case "$char" in
      "c" | "C")  expanded="$expanded clean" ;;
      "d" | "D")  expanded="$expanded down" ;;
      "o" | "O")  expanded="$expanded overrides" ;;
      "p" | "P")  expanded="$expanded pull" ;;
      "s" | "S")  expanded="$expanded status" ;;
      "u" | "U")  expanded="$expanded up" ;;
      "v" | "V")  expanded="$expanded validate" ;;
              *)  return 1
    esac
  done < <(echo -n "$1")
  VERBS="$expanded"
}

for VERB in $VERBS ; do
  [ "$VERB" = "clean" ] || \
  [ "$VERB" = "down" ] || \
  [ "$VERB" = "overrides" ] || \
  [ "$VERB" = "pull" ] || \
  [ "$VERB" = "status" ] || \
  [ "$VERB" = "up" ] || \
  [ "$VERB" = "validate" ] || \
    expand_verbs "$VERBS" || \
    usage "Unknown verb: $VERB"
done
shift

for opt in "$@" ; do
  shift
  case "$opt" in
    "--fail-on-error")   set -- "$@" "-F" ;;
    "--skip-prereqs")    set -- "$@" "-P" ;;
    "--skip-overrides")  set -- "$@" "-O" ;;
    "--skip-regenerate") set -- "$@" "-R" ;;

    "--devices")         set -- "$@" "-d" ;;
    "--hooks")           set -- "$@" "-h" ;;
    "--labels")          set -- "$@" "-l" ;;
    "--logging")         set -- "$@" "-g" ;;
    "--ports")           set -- "$@" "-p" ;;

    "--")                set -- "$@" "--" ;;
    "--"*)               usage "Unrecognized option: $opt." ;;
    *)                   set -- "$@" "$opt"
  esac
done

validate_optarg () {
  case "$1" in
    yes | no ) return 0 ;;
  esac
  usage "Unknown option argument: '$1'"
}

OPTIND=1
while getopts ':FOPRd:g:h:l:p:' OPTION ; do
  case "$OPTION" in
    "F" ) FLAG_FAIL_ON_ERROR="yes" ;;
    "O" ) FLAG_SKIP_OVERRIDES="yes" ;;
    "P" ) FLAG_SKIP_PREREQS="yes" ;;
    "R" ) FLAG_SKIP_REGENERATE="yes" ;;

    "d" ) validate_optarg "$OPTARG" && ARG_DEVICES="$OPTARG" ;;
    "g" ) validate_optarg "$OPTARG" && ARG_LOGGING="$OPTARG" ;;
    "h" ) validate_optarg "$OPTARG" && ARG_HOOKS="$OPTARG" ;;
    "l" ) validate_optarg "$OPTARG" && ARG_LABELS="$OPTARG" ;;
    "p" ) validate_optarg "$OPTARG" && ARG_PORTS="$OPTARG" ;;

      * ) usage "Unrecognized option: -$OPTARG." ;;
  esac
done
shift $(($OPTIND -1))

if [ $# -le 0 ] ; then
  __error "No <comp_dir>' provided!"
  exit $EXIT_CODE_COMPOSITION_NOT_FOUND
fi

# # # # # # # # # # # # # # # # # # #       DEPENDENCIES      # # # # # # # # # # # # # # # # # # #

# FIXME: Improve `podman` support and make it default.

if ! $DOCKER_CMD version &> /dev/null ; then
  if ! podman version &> /dev/null ; then
    __error 'Failed to locate: `docker` or `podman`!'
    exit $EXIT_CODE_DEP_INSTALL_FAILURE
  else
    DOCKER_CMD="podman"
    DOCKER_COMPOSE_CMD="$DOCKER_CMD compose"
  fi
fi

if ! $DOCKER_COMPOSE_CMD version &> /dev/null ; then
  if ! command -v $DOCKER_CMD-compose &> /dev/null ; then
    if ! [ -x "$LIB_DIR/compose" ] ; then
      if ! "$SCRIPTS_DIR/install-compose.sh" "$LIB_DIR/compose" ; then
        __error 'Failed to locate: `'"$DOCKER_COMPOSE_CMD"'` or `'"$DOCKER_CMD"'-compose`!'
        exit $EXIT_CODE_DEP_INSTALL_FAILURE
      fi
    else
      DOCKER_COMPOSE_CMD="$LIB_DIR/compose"
    fi
  else
    DOCKER_COMPOSE_CMD="$DOCKER_CMD-compose"
  fi
fi

if ! $YQ_CMD &> /dev/null ; then
  if ! [ -x "$LIB_DIR/yq" ] ; then
    if ! "$SCRIPTS_DIR/install-yq.sh" "$LIB_DIR/yq" ; then
      __error 'Failed to locate: `yq`!'
      exit $EXIT_CODE_DEP_INSTALL_FAILURE
    fi
  else
    YQ_CMD="$LIB_DIR/yq"
  fi
fi

# # # # # # # # # # # # # # # # # # #      MAIN FUNCTION      # # # # # # # # # # # # # # # # # # #

COMPOSITIONS=( "$@" )
perform () {
  local SIMPLE_VERB="$1"
  for comp in "${COMPOSITIONS[@]}" ; do
    comp="${comp%/}"
    echo -ne "\n[+] Executing '$SIMPLE_VERB' on "
    [ -z "$COMPOSITIONS_INTERNAL_CALL" ] || printf 'pre-req '
    echo "'$comp' ... "
    if ! { [ "$comp" = "$(basename "$comp")" ] && [ -d "$SELF_DIR/$comp" ]; } ; then
      __error "'$comp' is not a base directory at '$SELF_DIR'!"
      [ "$FLAG_FAIL_ON_ERROR" != "yes" ] || exit $EXIT_CODE_COMPOSITION_NOT_FOUND
      continue
    fi
    if ! [ -f "$SELF_DIR/$comp/docker-compose.yml" ] ; then
      __error "No 'docker-compose.yml' found under '$comp'!"
      [ "$FLAG_FAIL_ON_ERROR" != "yes" ] || exit $EXIT_CODE_COMPOSITION_NOT_FOUND
      continue
    fi

    cd "$SELF_DIR/$comp"

    opt_line_head='[o] Disabled options'
    for opt in DEVICES HOOKS LABELS LOGGING PORTS ; do
      __read_option $opt
    done
    [ -n "$opt_line_head" ] || echo

    [ "$SIMPLE_VERB" = "clean" ] || __gen_env \
      || [ "$FLAG_FAIL_ON_ERROR" != "yes" ] || exit $EXIT_CODE_GEN_ERROR

    [ "$SIMPLE_VERB" != "overrides" ] || __do_prereqs overrides \
      || [ "$FLAG_FAIL_ON_ERROR" != "yes" ] || exit $EXIT_CODE_SIMPLE_VERB_FAILURE

    [ "$SIMPLE_VERB" != "pull" ] || __do_prereqs pull \
      || [ "$FLAG_FAIL_ON_ERROR" != "yes" ] || exit $EXIT_CODE_SIMPLE_VERB_FAILURE

    [ "$SIMPLE_VERB" != "up" ] || __do_prereqs status "yes" \
      || [ "$FLAG_FAIL_ON_ERROR" != "yes" ] || exit $EXIT_CODE_SIMPLE_VERB_FAILURE

    [ "$SIMPLE_VERB" != "up" ] || __gen_templates \
      || [ "$FLAG_FAIL_ON_ERROR" != "yes" ] || exit $EXIT_CODE_GEN_ERROR

    [ "$OPTION_HOOKS" != "yes" ] || __run_hooks $SIMPLE_VERB pre \
      || [ "$FLAG_FAIL_ON_ERROR" != "yes" ] || exit $EXIT_CODE_PRE_HOOK_SCRIPT_ERROR

    local verb_exit=0
    do_${SIMPLE_VERB} ; verb_exit=$?

    if [ "$SIMPLE_VERB" = "validate" ] && [ $verb_exit -eq 0 ] ; then
      echo "[>] '$comp' is valid!"
    fi

    if [ "$SIMPLE_VERB" = "status" ] && [ $verb_exit -eq 0 ] ; then
      echo "[>] '$comp' is healthy!"
    fi

    if [ $verb_exit -ne 0 ] && [ "$FLAG_FAIL_ON_ERROR" = "yes" ] ; then
      exit $EXIT_CODE_SIMPLE_VERB_FAILURE
    fi

    [ "$OPTION_HOOKS" != "yes" ] || __run_hooks $SIMPLE_VERB post \
      || [ "$FLAG_FAIL_ON_ERROR" != "yes" ] || exit $EXIT_CODE_POST_HOOK_SCRIPT_ERROR
  done
}

print_sepator_line () {
  [ -n "$COMPOSITIONS_INTERNAL_CALL" ] || printf '%.0s-' {1..80}
}

print_sepator_line
for VERB in $VERBS ; do
  perform $VERB
  print_sepator_line
done
echo
