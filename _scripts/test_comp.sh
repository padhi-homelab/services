#!/usr/bin/env bash

set -Eumo pipefail

SELF_DIR="$(cd -P -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)"
cd "$SELF_DIR/.."

TEST_COMP_TMP_PATH=/tmp/__test_comp_intermediate_storage_dir__

rm -rf "$TEST_COMP_TMP_PATH"
mkdir -p "$TEST_COMP_TMP_PATH"

source <( grep -P "^EXIT_CODE_[A-Z_]+=.+" ./comp )

# __test_comp <description> <arguments> <input> <validaty_check> <error_msg> <debug?>
function __test_comp () {
  local DEBUG="${6:-}"

  echo "[>] Test '$1': "

  local io_path_prefix="$TEST_COMP_TMP_PATH/$1"
  local err_path="$io_path_prefix.err"
  local out_path="$io_path_prefix.out"

  if [ -n "$DEBUG" ]; then
    echo "cmd: ./comp $2"
    echo "in: $3"
  fi
  echo "$3" | ./comp $2 >"$out_path" 2>"$err_path"
  local exit_code=$?
  if [ -n "$DEBUG" ]; then
    echo "\$err_path contents:"
    cat "$err_path"
    echo "\$out_path contents:"
    cat "$out_path"
    echo "exit_code: $exit_code"
    echo -e "condition:\n    $4"
  fi

  eval -- $4 \
    && echo "[+] SUCCESS!" \
    || echo "[-] FAILURE [$5]"
  echo
}

DEBUG_ALL="${DEBUG:-}"

__test_comp \
  "Usage on invocation without args" \
  "" \
  "" \
  $'[ $exit_code -eq $EXIT_CODE_USAGE_ERROR ]' \
  "Expected EXIT_CODE_USAGE_ERROR" \
  "$DEBUG_ALL"

__test_comp \
  "Error on status of non-existent composition" \
  "status unknown_comp" \
  "" \
  $'[ $exit_code -eq $EXIT_CODE_COMPOSITION_NOT_FOUND ]
      &&
    grep -sq "is not a base directory" "$err_path"' \
  "Expected EXIT_CODE_COMPOSITION_NOT_FOUND and helpful error message" \
  "$DEBUG_ALL"

__test_comp \
  "Confirmation before deleting data (deny)" \
  "clean tang" \
  "n" \
  $'[ $exit_code -eq 0 ] 
      &&
    grep -sq "Remove \'tang/data\' (y/N)?" "$out_path"
      &&
    grep -vsq "removed \'.env\'" "$out_path"' \
  "Expected EXIT_CODE = 0, confirmation prompt, and data preserved" \
  "$DEBUG_ALL"

__test_comp \
  "Confirmation before deleting data (allow)" \
  "clean tang" \
  "y" \
  $'[ $exit_code -eq 0 ] 
      &&
    grep -sq "Remove \'tang/data\' (y/N)?" "$out_path"
      &&
    grep -sq "removed \'.env\'" "$out_path"' \
  "Expected EXIT_CODE = 0, confirmation prompt, and data deleted" \
  "$DEBUG_ALL"
