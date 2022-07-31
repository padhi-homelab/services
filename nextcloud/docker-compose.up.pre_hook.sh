#!/usr/bin/env bash

set -Eumo pipefail

SELF_DIR="$(cd -P -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)"

rm -rf "$SELF_DIR/.env"
cp "$SELF_DIR/.env.global" .env 2> /dev/null

mkdir -p $SELF_DIR/data/caddy/config \
         $SELF_DIR/data/caddy/data \
         $SELF_DIR/data/mariadb/var/lib/mysql \
         $SELF_DIR/data/redis/redis \
         $SELF_DIR/data/nextcloud/data \
         $SELF_DIR/data/nextcloud/var/www/html \
         $SELF_DIR/data/nextcloud/usr/local/etc/php/conf.d
         
touch $SELF_DIR/data/nextcloud/usr/local/etc/php/conf.d/redis-session.ini

cat << EOF > "$SELF_DIR/.env"
TZ=$(timedatectl | awk '/Time zone:/ {print $3}')
USER_ID=$(id -u)
EOF
