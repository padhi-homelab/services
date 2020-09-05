#!/usr/bin/env bash

set -Eumo pipefail

SELF_DIR="$(cd -P -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)"

cat << EOF > "$SELF_DIR/.env"
HOST_NAME=$(hostname)
EOF