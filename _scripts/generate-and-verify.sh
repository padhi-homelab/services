#!/usr/bin/env bash

set -Eumo pipefail

SOURCE_FILE="$1"
TARGET_FILE="$2"

ENV_VARS="$(cut -d= -f1 .env | awk '{print "$" $0}')"

echo -n "[~] Generating '$TARGET_FILE': "

if [ -e "$TARGET_FILE" ] && [ ! -f "$TARGET_FILE" ]; then
  echo "CANNOT OVERWRITE!"
  exit 1
fi

env -i $(paste .env) \
    envsubst "$ENV_VARS"\
        < "$SOURCE_FILE" \
        > "$TARGET_FILE"

SRC_VARS=$(envsubst -v "$(cat "$SOURCE_FILE")" | paste -sd '|')

if grep -qE "$SRC_VARS" "$TARGET_FILE"; then
  echo FAILED
  rm "$TARGET_FILE"
  exit 1
fi

echo VERIFIED
