#!/usr/bin/env bash

set -Eumo pipefail

SELF_DIR="$(cd -P -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)"
DATA_DIR="$SELF_DIR/data"

mkdir -p "$DATA_DIR/mariadb/var/lib/mysql" \
         "$DATA_DIR/redis/data" \
         "$DATA_DIR/nextcloud/crontabs" \
         "$DATA_DIR/nextcloud/data" \
         "$DATA_DIR/nextcloud/var/www/html" \
         "$DATA_DIR/nextcloud/usr/local/etc/php/conf.d"
