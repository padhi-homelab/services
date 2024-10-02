#!/usr/bin/env bash
#shellcheck disable=SC2059,SC2086,SC2154 source=/dev/null

set -Eumo pipefail

SELF_DIR="$(cd -P -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)"
cd "$SELF_DIR/.."
rm -rf .lib

DEBUG="${DEBUG:-}"

source _scripts/colors.sh
source <( grep -P "^EXIT_CODE_[A-Z_]+=.+" ./comp )

FINAL_EXIT_CODE=0

TEST_COMP_TMP_PATH=/tmp/__test_comp_intermediate_storage_dir__
rm -rf "$TEST_COMP_TMP_PATH"
mkdir -p "$TEST_COMP_TMP_PATH"

SKIPPING_THIS=

# SETUP <test description> <comp arguments> <stdin content>
function SETUP () {
  [ -z "$SKIPPING_THIS" ] || return
  echo ; echo "${_fg_white_}${_bg_black_}${_bold_} T ${_normal_} Test $1: "

  local io_path_prefix="$TEST_COMP_TMP_PATH/$1"
  COMP_ERR_PATH="$io_path_prefix.err"
  COMP_OUT_PATH="$io_path_prefix.out"

  if [ -n "$DEBUG" ]; then
    echo "COMMAND: ./comp $2"
    echo "INPUT: $3"
  fi
  
  DISABLE_COLORS=1 ./comp $2 >"$COMP_OUT_PATH" 2>"$COMP_ERR_PATH" <<<"$3"
  COMP_EXIT_CODE=$?
  if [ -n "$DEBUG" ]; then
    echo "\$COMP_ERR_PATH contents:"
    cat "$COMP_ERR_PATH"
    echo "\$COMP_OUT_PATH contents:"
    cat "$COMP_OUT_PATH"
    echo "COMP_EXIT_CODE: $COMP_EXIT_CODE"
  fi
}

# CHECK <condition> <description> <exit immediately?>
function CHECK {
  [ -z "$SKIPPING_THIS" ] || return
  [ -z "$DEBUG" ] || echo "CHECK: $1"

  if eval -- $1 ; then
    echo "    ${_fg_green_}+${_normal_} $2: ${_fg_green_}SUCCESS${_normal_}"
  else
    echo "    ${_fg_red_}${_bold_}-${_normal_} $2: ${_fg_red_}${_bold_}FAILURE${_normal_}"
    FINAL_EXIT_CODE=1
    [ -z "${3:-}" ] || FINAL
  fi
}

# _WAIT <duration> <description>
function _WAIT () {
  [ -z "$SKIPPING_THIS" ] || return
  echo ; echo "${_fg_white_}${_bg_black_}${_bold_} W ${_normal_} Waiting ${_fg_magenta_}$1${_normal_} for $2"
  sleep "$1"
}

COMP_COUNTER=1
# _INIT <comp_dir>
function _INIT () {
  [ -z "$SKIPPING_THIS" ] || return
  local TARGET_COMP_VAR="TARGET_COMP_$COMP_COUNTER"
  local TARGET_COMP_DISPLAY_VAR="TARGET_COMP_${COMP_COUNTER}_DISPLAY"
  echo ; echo -n "${_fg_white_}${_bg_black_}${_bold_} I ${_normal_} Initializing ${_fg_magenta_}$1${_normal_} -> "
  printf -v "$TARGET_COMP_VAR" "test__${COMP_COUNTER}__$1__"
  rm -rf "${!TARGET_COMP_VAR}"
  cp -r "$1" "${!TARGET_COMP_VAR}"
  printf -v "$TARGET_COMP_DISPLAY_VAR" "${_fg_blue_}${!TARGET_COMP_VAR}${_normal_}"
  ( cd "${!TARGET_COMP_VAR}" && rm -rf .env data generated ./*override* )
  echo "${!TARGET_COMP_DISPLAY_VAR}"
  (( COMP_COUNTER++ ))
}

function FINAL () {
  echo ; printf '%.0s-' {1..100} ; echo ; echo
  if [ "$FINAL_EXIT_CODE" -eq 0 ] ; then
    echo "${_fg_white_}${_bg_black_}${_bold_} S ${_normal_} All checks ${_fg_green_}SUCCESSFUL${_normal_}."
  else
    echo "${_fg_white_}${_bg_black_}${_bold_} F ${_normal_} Some checks ${_fg_red_}${_bold_}FAILED${_normal_}!"
  fi
  exit $FINAL_EXIT_CODE
}

SETUP "invocation without args" \
      "" \
      ""
CHECK $'grep -qs "<verb>\[,<verb>,\.\.\.\] \[flags\] <comp_dir> \[<comp_dir> \.\.\.\]" "$COMP_ERR_PATH"' \
      "Usage information on stderr"
CHECK $'[ $COMP_EXIT_CODE -eq $EXIT_CODE_USAGE_ERROR ]' \
      "EXIT_CODE_USAGE_ERROR"

SETUP "status of non-existent composition" \
      "status unknown_comp" \
      ""
CHECK $'grep -qs "Executing status on unknown_comp" "$COMP_OUT_PATH"' \
      "Info at beginning of execution"
CHECK $'grep -qs "is not a base directory" "$COMP_ERR_PATH"' \
      "Helpful message on stderr"
CHECK $'[ $COMP_EXIT_CODE -eq $EXIT_CODE_COMPOSITION_NOT_FOUND ]'\
      "EXIT_CODE_COMPOSITION_NOT_FOUND"

_INIT tang

SETUP "stopping $TARGET_COMP_1_DISPLAY while its not running" \
      "down $TARGET_COMP_1" \
      ""
CHECK $'grep -qs "Executing down on $TARGET_COMP_1" "$COMP_OUT_PATH"' \
      "Info at beginning of execution"
CHECK $'[ $COMP_EXIT_CODE -eq 0 ]' \
      "EXIT_CODE = 0" \
      exit_on_failure

SETUP "that status reports $TARGET_COMP_1_DISPLAY is unhealthy" \
      "status -P $TARGET_COMP_1" \
      ""
CHECK $'grep -qs "Executing status on $TARGET_COMP_1" "$COMP_OUT_PATH"' \
      "Info at beginning of execution"
CHECK $'grep -qs "Unhealthy service:" "$COMP_ERR_PATH"' \
      "Error about unhealthy service on stderr"
CHECK $'[ $COMP_EXIT_CODE -eq $EXIT_CODE_SIMPLE_VERB_FAILURE ]' \
      "EXIT_CODE_SIMPLE_VERB_FAILURE" \
      exit_on_failure

SETUP "starting $TARGET_COMP_1_DISPLAY without prerequisites" \
      "up -P $TARGET_COMP_1" \
      ""
CHECK $'grep -qs "Executing up on $TARGET_COMP_1" "$COMP_OUT_PATH"' \
      "Info at beginning of execution"
CHECK $'[ $COMP_EXIT_CODE -eq 0 ]' \
      "EXIT_CODE = 0" \
      exit_on_failure

SETUP "cleaning $TARGET_COMP_1_DISPLAY before stopping" \
      "clean $TARGET_COMP_1" \
      ""
CHECK $'grep -qs "Executing clean on $TARGET_COMP_1" "$COMP_OUT_PATH"' \
      "Info at beginning of execution"
CHECK $'grep -qs "Cannot clean while $TARGET_COMP_1 is running" "$COMP_ERR_PATH"' \
      "Error about running composition on stderr" \
      exit_on_failure
CHECK $'[ $COMP_EXIT_CODE -eq $EXIT_CODE_SIMPLE_VERB_FAILURE ]' \
      "EXIT_CODE_SIMPLE_VERB_FAILURE" \
      exit_on_failure

_WAIT 30s "$TARGET_COMP_1_DISPLAY to start up and emit health status"

SETUP "that status reports $TARGET_COMP_1_DISPLAY is healthy" \
      "status -P $TARGET_COMP_1" \
      ""
CHECK $'grep -qs "Executing status on $TARGET_COMP_1" "$COMP_OUT_PATH"' \
      "Info at beginning of execution"
CHECK $'grep -qs "$TARGET_COMP_1 is healthy" "$COMP_OUT_PATH"' \
      "Info about healthy composition"
CHECK $'[ $COMP_EXIT_CODE -eq 0 ]' \
      "EXIT_CODE = 0" \
      exit_on_failure

SETUP "stopping $TARGET_COMP_1_DISPLAY while its running" \
      "down $TARGET_COMP_1" \
      ""
CHECK $'grep -qs "Executing down on $TARGET_COMP_1" "$COMP_OUT_PATH"' \
      "Info at beginning of execution"
CHECK $'[ $COMP_EXIT_CODE -eq 0 ]' \
      "EXIT_CODE = 0" \
      exit_on_failure

SETUP "cleaning, but deny deleting data" \
      "clean $TARGET_COMP_1" \
      "n"
CHECK $'grep -qs "Executing clean on $TARGET_COMP_1" "$COMP_OUT_PATH"' \
      "Info at beginning of execution"
CHECK $'grep -qs "Remove \'$TARGET_COMP_1/data\' (y/N)?" "$COMP_OUT_PATH"' \
      "Confirmation prompt before deletion"
CHECK $'[ -d $TARGET_COMP_1/data ]' \
      "Data is not deleted" \
      exit_on_failure
CHECK $'[ $COMP_EXIT_CODE -eq 0 ]' \
      "EXIT_CODE = 0" \
      exit_on_failure

SETUP "cleaning, and allow deleting data" \
      "clean $TARGET_COMP_1" \
      "y"
CHECK $'grep -qs "Executing clean on $TARGET_COMP_1" "$COMP_OUT_PATH"' \
      "Info at beginning of execution"
CHECK $'grep -qs "Remove \'$TARGET_COMP_1/data\' (y/N)?" "$COMP_OUT_PATH"' \
      "Confirmation prompt before deletion"
CHECK $'! [ -d $TARGET_COMP_1/data ]' \
      "Data is deleted" \
      exit_on_failure
CHECK $'[ $COMP_EXIT_CODE -eq 0 ]' \
      "EXIT_CODE = 0" \
      exit_on_failure

_INIT tiny_httpd

echo "DEVICES=no" > $TARGET_COMP_1/options.override.conf

SETUP "starting $TARGET_COMP_1_DISPLAY & $TARGET_COMP_2_DISPLAY with different options" \
      "up -P $TARGET_COMP_1 $TARGET_COMP_2" \
      ""
CHECK $'grep -lPqsz "Executing up on $TARGET_COMP_1.*\\n.*Disabled options: DEVICES \(conf\)" "$COMP_OUT_PATH"' \
      "Info with disabled options at beginning of $TARGET_COMP_1_DISPLAY execution"
CHECK $'grep -lPqsvz "Executing up on $TARGET_COMP_2.*\\n.*Disabled options: DEVICES \(conf\)" "$COMP_OUT_PATH"' \
      "Info without disabled options at beginning of $TARGET_COMP_2_DISPLAY execution"
CHECK $'[ $COMP_EXIT_CODE -eq 0 ]' \
      "EXIT_CODE = 0" \
      exit_on_failure

FINAL
