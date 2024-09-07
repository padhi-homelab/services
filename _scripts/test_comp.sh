#!/usr/bin/env bash

set -Eumo pipefail

SELF_DIR="$(cd -P -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)"
cd "$SELF_DIR/.."

TEST_COMP_TMP_PATH=/tmp/__test_comp_intermediate_storage_dir__

rm -rf "$TEST_COMP_TMP_PATH"
mkdir -p "$TEST_COMP_TMP_PATH"

source <( grep -P "^EXIT_CODE_[A-Z_]+=.+" ./comp )

function __test_comp () {
  echo "[>] Test '$1': "

  local io_path_prefix="$TEST_COMP_TMP_PATH/$1"
  local err_path="$io_path_prefix.err"
  local out_path="$io_path_prefix.out"

  ./comp $2 >"$out_path" 2>"$err_path"
  local ret=$?

  eval "$3" \
    && echo "[+] SUCCESS!" \
    || echo "[-] FAILURE [$4]"
  echo
}

__test_comp \
  "Run without args" \
  "" \
  '[ $ret -eq $EXIT_CODE_USAGE_ERROR ]' \
  "Expected EXIT_CODE_USAGE_ERROR"

__test_comp \
  "Run on non-existent composition" \
  "status unknown_comp" \
  '[ $ret -eq $EXIT_CODE_COMPOSITION_NOT_FOUND ] && grep -sq "is not a base directory" "$err_path"' \
  "Expected EXIT_CODE_COMPOSITION_NOT_FOUND and helpful error message"
