#!/usr/bin/env bash

set -Eumo pipefail

SELF_DIR="$(cd -P -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)"
DATA_DIR="$SELF_DIR/data"

mkdir -p "$DATA_DIR/frigate/config" \
         "$DATA_DIR/frigate/media/frigate"

if ! [ -f "$DATA_DIR/frigate/config/config.yml" ]; then
  cp "$SELF_DIR/extra/frigate/config/config.default.yml" \
     "$DATA_DIR/frigate/config/config.yml"
fi
