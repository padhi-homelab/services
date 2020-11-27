#!/usr/bin/env bash

set -Eumo pipefail

SELF_DIR="$(cd -P -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)"

mkdir -p $SELF_DIR/data/caddy/config \
         $SELF_DIR/data/caddy/data \
         $SELF_DIR/data/qbittorrent/config \
         $SELF_DIR/data/qbittorrent/data

cat << EOF > "$SELF_DIR/.env"
TZ=$(timedatectl | awk '/Time zone:/ {print $3}')
USER_ID=$(id -u)
EOF
