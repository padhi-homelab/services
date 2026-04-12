#!/usr/bin/env bash

set -Eumo pipefail

SELF_DIR="$(cd -P -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)"
DATA_DIR="$SELF_DIR/data"

mkdir -p "$DATA_DIR/hortusfox/var/www/html/app/logs" \
         "$DATA_DIR/hortusfox/var/www/html/app/migrations" \
         "$DATA_DIR/hortusfox/var/www/html/public/backup" \
         "$DATA_DIR/hortusfox/var/www/html/public/img" \
         "$DATA_DIR/hortusfox/var/www/html/public/themes" \
         "$DATA_DIR/mariadb/var/lib/mysql"
