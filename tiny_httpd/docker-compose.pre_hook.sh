#!/usr/bin/env bash

set -Eumo pipefail

SELF_DIR="$(cd -P -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)"
DATA_DIR="$SELF_DIR/data"

mkdir -p "$DATA_DIR/http/www"

[ -f "$DATA_DIR/http/www/index.html" ] || touch "$DATA_DIR/http/www/index.html"
