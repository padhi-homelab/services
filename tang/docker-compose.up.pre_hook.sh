#!/usr/bin/env bash

set -Eumo pipefail

SELF_DIR="$(cd -P -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)"

mkdir -p $SELF_DIR/data/tang/db

cat << EOF > "$SELF_DIR/.env"
USER_ID=$(id -u)
EOF