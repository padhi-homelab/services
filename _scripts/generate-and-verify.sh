#!/usr/bin/env bash

# shellcheck disable=SC2154 source=/dev/null

set -Eumo pipefail

SELF_DIR="$(cd -P -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)"
source "$SELF_DIR/colors.sh"

SOURCE_FILE="$1"
TARGET_FILE="$2"

ENV_VARS="$(cut -d= -f1 .env | awk '{print "$" $0}')"

echo -n "[*] $TARGET_FILE: "

if [ -e "$TARGET_FILE" ] && [ ! -f "$TARGET_FILE" ] ; then
  echo "CANNOT OVERWRITE!"
  exit 1
fi

env -i - $(paste .env) \
    envsubst "$ENV_VARS"\
        < "$SOURCE_FILE" \
        > "$TARGET_FILE" \
  || exit 1

SRC_VARS=$(envsubst -v "$(cat "$SOURCE_FILE")" | paste -sd '|')

if grep -qE "$SRC_VARS" "$TARGET_FILE" ; then
  LINE="$(grep -E "$SRC_VARS" "$TARGET_FILE")"
  LEFTOVER_VAR="$(envsubst -v "$LINE" | paste -sd '|')"
  echo "${_fg_red_}${_bold_}\`$LEFTOVER_VAR\` NOT DEFINED!${_normal_}"
  rm "$TARGET_FILE"
  exit 1
fi

echo "${_fg_green_}VERIFIED${_normal_}"
