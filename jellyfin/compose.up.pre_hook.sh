#!/usr/bin/env bash

set -Eumo pipefail

SELF_DIR="$(cd -P -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)"
DATA_DIR="$SELF_DIR/data"

mkdir -p "$DATA_DIR/jellyfin/config/config"
if ! [ -f "$DATA_DIR/jellyfin/config/config/network.xml" ]; then
  cp "$SELF_DIR/generated/jellyfin/config/config/network.xml" \
     "$DATA_DIR/jellyfin/config/config/network.xml"
fi
