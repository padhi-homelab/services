#!/usr/bin/env bash

set -Eumo pipefail

SELF_DIR="$(cd -P -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)"
DATA_DIR="$SELF_DIR/data"

mkdir -p $DATA_DIR/gogs/data

if ! [ -f "$DATA_DIR/gogs/data/gogs/conf/app.ini" ]; then
  mkdir -p "$DATA_DIR/gogs/data/gogs/conf/"
  cp "$SELF_DIR/generated/gogs/data/gogs/conf/app.ini" \
     "$DATA_DIR/gogs/data/gogs/conf/app.ini"
fi
