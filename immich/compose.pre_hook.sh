#!/usr/bin/env bash

set -Eumo pipefail

SELF_DIR="$(cd -P -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)"
DATA_DIR="$SELF_DIR/data"

mkdir -p "$DATA_DIR/immich/data" \
         "$DATA_DIR/ml/cache" \
         "$DATA_DIR/db/var/lib/postgresql" \
         "$DATA_DIR/valkey/data"
