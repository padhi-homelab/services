#!/usr/bin/env bash

set -Eumo pipefail

SELF_DIR="$(cd -P -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)"
DATA_DIR="$SELF_DIR/data"

mkdir -p "$DATA_DIR/zigbee2mqtt/app/data"
if ! [ -f "$DATA_DIR/zigbee2mqtt/app/data/configuration.yaml" ]; then
  cp "$SELF_DIR/generated/zigbee2mqtt/app/data/configuration.yaml" \
     "$DATA_DIR/zigbee2mqtt/app/data/configuration.yaml"
fi
