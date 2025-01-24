#!/usr/bin/env bash

set -Eumo pipefail

SELF_DIR="$(cd -P -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)"
DATA_DIR="$SELF_DIR/data"

mkdir -p "$DATA_DIR/fulltextsearch/usr/share/elasticsearch/data" \
         "$DATA_DIR/mariadb/var/lib/mysql" \
         "$DATA_DIR/valkey/data" \
         "$DATA_DIR/nextcloud/crontabs" \
         "$DATA_DIR/nextcloud/data" \
         "$DATA_DIR/nextcloud/var/www/html" \
         "$DATA_DIR/nextcloud/usr/local/etc/php/conf.d"

# FIXME: Workaround from https://github.com/nextcloud/docker/issues/763#issuecomment-1007447212
touch "$DATA_DIR/nextcloud/usr/local/etc/php/conf.d/redis-session.ini"

# FIXME: Workaround from https://github.com/nextcloud/docker/issues/1494#issuecomment-1213540687 
mkdir -p "$DATA_DIR/nextcloud/etc/apache2/conf-enabled"
touch "$DATA_DIR/nextcloud/etc/apache2/conf-enabled/remoteip.conf"
