#!/usr/bin/env bash

set -Eumo pipefail

SELF_DIR="$(cd -P -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)"

mkdir -p $SELF_DIR/data/caddy/config \
         $SELF_DIR/data/caddy/data \
         $SELF_DIR/data/navidrome/data \
         $SELF_DIR/data/navidrome/music
