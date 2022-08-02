#!/usr/bin/env bash

set -Eumo pipefail

SELF_DIR="$(cd -P -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)"

mkdir -p $SELF_DIR/data/caddy/config \
         $SELF_DIR/data/caddy/data \
         $SELF_DIR/data/jackett/config

if ! [ -f "$SELF_DIR/data/jackett/config/ServerConfig.json" ]; then
  cp "$SELF_DIR/extra/jackett/config/ServerConfig.json" \
     "$SELF_DIR/data/jackett/config/ServerConfig.json"
fi
