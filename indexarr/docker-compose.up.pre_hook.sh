#!/usr/bin/env bash

set -Eumo pipefail

SELF_DIR="$(cd -P -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)"

rm -rf "$SELF_DIR/.env"
cp "$SELF_DIR/.env.global" .env 2> /dev/null

mkdir -p $SELF_DIR/data/caddy/config \
         $SELF_DIR/data/caddy/data \
         $SELF_DIR/data/jackett/config

if ! [ -f "$SELF_DIR/data/jackett/config/ServerConfig.json" ]; then
  cp "$SELF_DIR/extra/jackett/config/ServerConfig.json" \
     "$SELF_DIR/data/jackett/config/ServerConfig.json"
fi

cat << EOF > "$SELF_DIR/.env"
TZ=$(timedatectl | awk '/Time zone:/ {print $3}')
USER_ID=$(id -u)
EOF
