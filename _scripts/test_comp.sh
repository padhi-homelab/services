#!/usr/bin/env bash
#shellcheck disable=SC2086,SC2154 source=/dev/null

set -Eumo pipefail

SELF_DIR="$(cd -P -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)"
cd "$SELF_DIR/.."

DEBUG="${DEBUG:-}"

source _scripts/colors.sh
source <( grep -P "^EXIT_CODE_[A-Z_]+=.+" ./comp )

FINAL_EXIT_CODE=0

TEST_COMP_TMP_PATH=/tmp/__test_comp_intermediate_storage_dir__
rm -rf "$TEST_COMP_TMP_PATH"
mkdir -p "$TEST_COMP_TMP_PATH"

# SETUP <test description> <comp arguments> <stdin content>
function SETUP () {
  echo -e "\n${_fg_white_}${_bg_black_}${_bold_} T ${_normal_} Test $1: "

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

function CHECK {
  [ -z "$DEBUG" ] || echo "CHECK: $1"

  if eval -- $1 ; then
    echo "    ${_fg_green_}+${_normal_} $2: ${_fg_green_}SUCCESS${_normal_}"
  else
    echo "    ${_fg_red_}${_bold_}-${_normal_} $2: ${_fg_red_}${_bold_}FAILURE${_normal_}"
    FINAL_EXIT_CODE=1
  fi
}

SETUP "invocation without args" \
      "" \
      ""
CHECK $'[ $COMP_EXIT_CODE -eq $EXIT_CODE_USAGE_ERROR ]' \
      "Expected EXIT_CODE_USAGE_ERROR"

SETUP "status of non-existent composition" \
      "status unknown_comp" \
      ""
CHECK $'grep -sq "Executing status on unknown_comp" "$COMP_OUT_PATH"' \
      "Expected info message at beginning of execution"
CHECK $'[ $COMP_EXIT_CODE -eq $EXIT_CODE_COMPOSITION_NOT_FOUND ]'\
      "Expected EXIT_CODE_COMPOSITION_NOT_FOUND"
CHECK $'grep -sq "is not a base directory" "$COMP_ERR_PATH"' \
      "Expected a helpful error message"

SETUP "that 'tang' is not running" \
      "status -P tang" \
      ""
CHECK $'grep -sq "Executing status on tang" "$COMP_OUT_PATH"' \
      "Expected info message at beginning of execution"
CHECK $'grep -sq "Unhealthy service: tang" "$COMP_ERR_PATH"' \
      "Expected error message for unhealthy service"
CHECK $'[ $COMP_EXIT_CODE -eq $EXIT_CODE_SIMPLE_VERB_FAILURE ]' \
      "Expected EXIT_CODE_SIMPLE_VERB_FAILURE"

SETUP "starting 'tang' service without prerequisites" \
      "up -P tang" \
      "n"
CHECK $'grep -sq "Executing up on tang" "$COMP_OUT_PATH"' \
      "Expected info message at beginning of execution"
CHECK $'[ $COMP_EXIT_CODE -eq 0 ]' \
      "Expected EXIT_CODE = 0"

SETUP "cleaning 'tang' service before stopping" \
      "clean tang" \
      ""
CHECK $'grep -sq "Executing clean on tang" "$COMP_OUT_PATH"' \
      "Expected info message at beginning of execution"
CHECK $'grep -sq "Cannot clean while tang is running" "$COMP_ERR_PATH"' \
      "Expected error message for running composition"
CHECK $'[ $COMP_EXIT_CODE -eq $EXIT_CODE_SIMPLE_VERB_FAILURE ]' \
      "Expected EXIT_CODE_SIMPLE_VERB_FAILURE"

# Wait for tang to start and record health status
sleep 15s

SETUP "that 'tang' is still running" \
      "status -P tang" \
      ""
CHECK $'grep -sq "Executing status on tang" "$COMP_OUT_PATH"' \
      "Expected info message at beginning of execution"
CHECK $'grep -sq "tang is healthy" "$COMP_OUT_PATH"' \
      "Expected info message for healthy composition"
CHECK $'[ $COMP_EXIT_CODE -eq 0 ]' \
      "Expected EXIT_CODE = 0"

SETUP "stopping 'tang' service" \
      "down tang" \
      ""
CHECK $'grep -sq "Executing down on tang" "$COMP_OUT_PATH"' \
      "Expected info message at beginning of execution"
CHECK $'[ $COMP_EXIT_CODE -eq 0 ]' \
      "Expected EXIT_CODE = 0"

SETUP "cleaning, but deny deleting data" \
      "clean tang" \
      "n"
CHECK $'grep -sq "Executing clean on tang" "$COMP_OUT_PATH"' \
      "Expected info message at beginning of execution"
CHECK $'[ $COMP_EXIT_CODE -eq 0 ]' \
      "Expected EXIT_CODE = 0"
CHECK $'grep -sq "Remove \'tang/data\' (y/N)?" "$COMP_OUT_PATH"' \
      "Expected confirmation prompt before deletion"
CHECK $'[ -d tang/data ]' \
      "Expected data is not deleted"

SETUP "cleaning, and allow deleting data" \
      "clean tang" \
      "y"
CHECK $'grep -sq "Executing clean on tang" "$COMP_OUT_PATH"' \
      "Expected info message at beginning of execution"
CHECK $'[ $COMP_EXIT_CODE -eq 0 ]' \
      "Expected EXIT_CODE = 0"
CHECK $'grep -sq "Remove \'tang/data\' (y/N)?" "$COMP_OUT_PATH"' \
      "Expected confirmation prompt before deletion"
CHECK $'! [ -d tang/data ]' \
      "Expected data is deleted"

exit "$FINAL_EXIT_CODE"
