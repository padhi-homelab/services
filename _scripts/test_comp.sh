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
  echo -e "\n${_fg_white_}${_bg_black_}${_bold_}[#]${_normal_} Test $1: "

  local io_path_prefix="$TEST_COMP_TMP_PATH/$1"
  COMP_ERR_PATH="$io_path_prefix.err"
  COMP_OUT_PATH="$io_path_prefix.out"

  if [ -n "$DEBUG" ]; then
    echo "COMMAND: ./comp $2"
    echo "INPUT: $3"
  fi
  
  echo "$3" | ./comp $2 >"$COMP_OUT_PATH" 2>"$COMP_ERR_PATH"
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

./comp status tang &> /dev/null

SETUP "invocation without args" \
      "" \
      ""
CHECK $'[ $COMP_EXIT_CODE -eq $EXIT_CODE_USAGE_ERROR ]' \
      "Expected EXIT_CODE_USAGE_ERROR"

SETUP "status of non-existent composition" \
      "status unknown_comp" \
      ""
CHECK $'[ $COMP_EXIT_CODE -eq $EXIT_CODE_COMPOSITION_NOT_FOUND ]'\
      "Expected EXIT_CODE_COMPOSITION_NOT_FOUND"
CHECK $'grep -sq "is not a base directory" "$COMP_ERR_PATH"' \
      "Expected a helpful error message"

SETUP "deny deleting data" \
      "clean tang" \
      "n"
CHECK $'[ $COMP_EXIT_CODE -eq 0 ]' \
      "Expected EXIT_CODE = 0"
CHECK $'grep -sq "Remove \'tang/data\' (y/N)?" "$COMP_OUT_PATH"' \
      "Expected confirmation prompt before deletion"
CHECK $'[ -f tang/.env ]' \
      "Expected data is not deleted"

SETUP "allow deleting data" \
      "clean tang" \
      "y"
CHECK $'[ $COMP_EXIT_CODE -eq 0 ]' \
      "Expected EXIT_CODE = 0"
CHECK $'grep -sq "Remove \'tang/data\' (y/N)?" "$COMP_OUT_PATH"' \
      "Expected confirmation prompt before deletion"
CHECK $'! [ -f tang/.env ]' \
      "Expected data is deleted"

exit "$FINAL_EXIT_CODE"
