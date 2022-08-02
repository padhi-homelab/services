#!/usr/bin/env bash

set -Eumo pipefail

SELF_DIR="$(cd -P -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)"

mkdir -p "$SELF_DIR/data/mongo/data/db" \
         "$SELF_DIR/data/unifi/usr/lib/unifi/cert" \
         "$SELF_DIR/data/unifi/usr/lib/unifi/data" \
         "$SELF_DIR/data/unifi/usr/lib/unifi/logs"
