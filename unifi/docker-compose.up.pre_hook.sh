#!/usr/bin/env bash

set -Eumo pipefail

SELF_DIR="$(cd -P -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)"

rm -rf "$SELF_DIR/.env"
cp "$SELF_DIR/.env.global" .env 2> /dev/null

mkdir -p "$SELF_DIR/data/mongo/data/db" \
         "$SELF_DIR/data/unifi/usr/lib/unifi/cert" \
         "$SELF_DIR/data/unifi/usr/lib/unifi/data" \
         "$SELF_DIR/data/unifi/usr/lib/unifi/logs"

cat << EOF >> "$SELF_DIR/.env"
GROUP_ID=$(id -g)
TZ=$(timedatectl | awk '/Time zone:/ {print $3}')
USER_ID=$(id -u)
EOF