#!/usr/bin/env bash

set -Eumo pipefail

SELF_DIR="$(cd -P -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)"

mkdir -p $SELF_DIR/data/caddy/config \
         $SELF_DIR/data/caddy/data \
         $SELF_DIR/data/mariadb/var/lib/mysql \
         $SELF_DIR/data/nextcloud/var/www/html

cat << EOF > "$SELF_DIR/.env"
TZ=$(timedatectl | awk '/Time zone:/ {print $3}')
USER_ID=$(id -u)
EOF