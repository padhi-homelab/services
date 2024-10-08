#!/usr/bin/env bash

set -Eumo pipefail

SELF_DIR="$(cd -P -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)"
DATA_DIR="$SELF_DIR/data"

if ! [ -f "$DATA_DIR/gitea/etc/gitea/app.ini" ]; then
  mkdir -p "$DATA_DIR/gitea/etc/gitea/"
  cp "$SELF_DIR/generated/gitea/etc/gitea/app.ini" \
     "$DATA_DIR/gitea/etc/gitea/app.ini"
fi
