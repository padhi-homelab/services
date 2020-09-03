#!/usr/bin/env bash

set -Eumo pipefail

SELF_DIR="$(cd -P -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)"

USER_ID=$(id -u)

cat << EOF > "$SELF_DIR/.env"
USER_ID=$USER_ID
EOF