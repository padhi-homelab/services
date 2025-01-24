#!/usr/bin/env bash

set -Eumo pipefail

SELF_DIR="$(cd -P -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)"
DATA_DIR="$SELF_DIR/data"

if ! [ -f "$DATA_DIR/jackett/config/ServerConfig.json" ]; then
  cp "$SELF_DIR/generated/jackett/config/ServerConfig.json" \
     "$DATA_DIR/jackett/config/ServerConfig.json"
fi
