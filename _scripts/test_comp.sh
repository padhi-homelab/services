#!/usr/bin/env bash
#shellcheck disable=SC2086,SC2154 source=/dev/null

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

# SETUP <test description> <comp arguments> <stdin content>
function SETUP () {
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
  [ -z "$DEBUG" ] || echo "CHECK: $1"

  if eval -- $1 ; then
    echo "    ${_fg_green_}+${_normal_} $2: ${_fg_green_}SUCCESS${_normal_}"
  else
    echo "    ${_fg_red_}${_bold_}-${_normal_} $2: ${_fg_red_}${_bold_}FAILURE${_normal_}"
    FINAL_EXIT_CODE=1
    [ -z "${3:-}" ] || FINAL
  fi
}

function _WAIT () {
  echo ; echo "${_fg_white_}${_bg_black_}${_bold_} W ${_normal_} Waiting ${_fg_magenta_}$1${_normal_} for $2"
  sleep "$1"
}

function _INIT () {
  echo ; echo -n "${_fg_white_}${_bg_black_}${_bold_} I ${_normal_} Initializing ${_fg_magenta_}$1${_normal_} -> "
  TARGET_COMP="test__$1__"
  rm -rf "$TARGET_COMP"
  cp -r "$1" "$TARGET_COMP"
  TARGET_COMP_DISPLAY="${_fg_blue_}$TARGET_COMP${_normal_}"
  ( cd "$TARGET_COMP" && rm -rf .env data generated ./*override* )
  echo "$TARGET_COMP_DISPLAY"
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
CHECK $'grep -sq "<verb>\[,<verb>,\.\.\.\] \[flags\] <comp_dir> \[<comp_dir> \.\.\.\]" "$COMP_ERR_PATH"' \
      "Usage information on stderr"
CHECK $'[ $COMP_EXIT_CODE -eq $EXIT_CODE_USAGE_ERROR ]' \
      "EXIT_CODE_USAGE_ERROR"

SETUP "status of non-existent composition" \
      "status unknown_comp" \
      ""
CHECK $'grep -sq "Executing status on unknown_comp" "$COMP_OUT_PATH"' \
      "Info message at beginning of execution"
CHECK $'grep -sq "is not a base directory" "$COMP_ERR_PATH"' \
      "Helpful error message on stderr"
CHECK $'[ $COMP_EXIT_CODE -eq $EXIT_CODE_COMPOSITION_NOT_FOUND ]'\
      "EXIT_CODE_COMPOSITION_NOT_FOUND"

_INIT tang

SETUP "stopping $TARGET_COMP_DISPLAY while its not running" \
      "down $TARGET_COMP" \
      ""
CHECK $'grep -sq "Executing down on $TARGET_COMP" "$COMP_OUT_PATH"' \
      "Info message at beginning of execution"
CHECK $'[ $COMP_EXIT_CODE -eq 0 ]' \
      "EXIT_CODE = 0" \
      exit_on_failure

SETUP "that status reports $TARGET_COMP_DISPLAY is unhealthy" \
      "status -P $TARGET_COMP" \
      ""
CHECK $'grep -sq "Executing status on $TARGET_COMP" "$COMP_OUT_PATH"' \
      "Info message at beginning of execution"
CHECK $'grep -sq "Unhealthy service:" "$COMP_ERR_PATH"' \
      "Error message about unhealthy service on stderr"
CHECK $'[ $COMP_EXIT_CODE -eq $EXIT_CODE_SIMPLE_VERB_FAILURE ]' \
      "EXIT_CODE_SIMPLE_VERB_FAILURE" \
      exit_on_failure

SETUP "starting $TARGET_COMP_DISPLAY without prerequisites" \
      "up -P $TARGET_COMP" \
      "n"
CHECK $'grep -sq "Executing up on $TARGET_COMP" "$COMP_OUT_PATH"' \
      "Info message at beginning of execution"
CHECK $'[ $COMP_EXIT_CODE -eq 0 ]' \
      "EXIT_CODE = 0" \
      exit_on_failure

SETUP "cleaning $TARGET_COMP_DISPLAY before stopping" \
      "clean $TARGET_COMP" \
      ""
CHECK $'grep -sq "Executing clean on $TARGET_COMP" "$COMP_OUT_PATH"' \
      "Info message at beginning of execution"
CHECK $'grep -sq "Cannot clean while $TARGET_COMP is running" "$COMP_ERR_PATH"' \
      "Error message about running composition on stderr" \
      exit_on_failure
CHECK $'[ $COMP_EXIT_CODE -eq $EXIT_CODE_SIMPLE_VERB_FAILURE ]' \
      "EXIT_CODE_SIMPLE_VERB_FAILURE" \
      exit_on_failure

_WAIT 30s "$TARGET_COMP_DISPLAY to start up and emit health status"

SETUP "that status reports $TARGET_COMP_DISPLAY is healthy" \
      "status -P $TARGET_COMP" \
      ""
CHECK $'grep -sq "Executing status on $TARGET_COMP" "$COMP_OUT_PATH"' \
      "Info message at beginning of execution"
CHECK $'grep -sq "$TARGET_COMP is healthy" "$COMP_OUT_PATH"' \
      "Info message about healthy composition"
CHECK $'[ $COMP_EXIT_CODE -eq 0 ]' \
      "EXIT_CODE = 0" \
      exit_on_failure

SETUP "stopping $TARGET_COMP_DISPLAY while its running" \
      "down $TARGET_COMP" \
      ""
CHECK $'grep -sq "Executing down on $TARGET_COMP" "$COMP_OUT_PATH"' \
      "Info message at beginning of execution"
CHECK $'[ $COMP_EXIT_CODE -eq 0 ]' \
      "EXIT_CODE = 0" \
      exit_on_failure

SETUP "cleaning, but deny deleting data" \
      "clean $TARGET_COMP" \
      "n"
CHECK $'grep -sq "Executing clean on $TARGET_COMP" "$COMP_OUT_PATH"' \
      "Info message at beginning of execution"
CHECK $'grep -sq "Remove \'$TARGET_COMP/data\' (y/N)?" "$COMP_OUT_PATH"' \
      "Confirmation prompt before deletion"
CHECK $'[ -d $TARGET_COMP/data ]' \
      "Data is not deleted" \
      exit_on_failure
CHECK $'[ $COMP_EXIT_CODE -eq 0 ]' \
      "EXIT_CODE = 0" \
      exit_on_failure

SETUP "cleaning, and allow deleting data" \
      "clean $TARGET_COMP" \
      "y"
CHECK $'grep -sq "Executing clean on $TARGET_COMP" "$COMP_OUT_PATH"' \
      "Info message at beginning of execution"
CHECK $'grep -sq "Remove \'$TARGET_COMP/data\' (y/N)?" "$COMP_OUT_PATH"' \
      "Confirmation prompt before deletion"
CHECK $'! [ -d $TARGET_COMP/data ]' \
      "Data is deleted" \
      exit_on_failure
CHECK $'[ $COMP_EXIT_CODE -eq 0 ]' \
      "EXIT_CODE = 0" \
      exit_on_failure

FINAL
