#!/usr/bin/env bash

set -Eumo pipefail

SELF_DIR="$(cd -P -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)"
DATA_DIR="$SELF_DIR/data"

mkdir -p "$DATA_DIR/ntfy/etc/ntfy" \
         "$DATA_DIR/ntfy/var/cache/ntfy" \
         "$DATA_DIR/ntfy/var/lib/ntfy"
