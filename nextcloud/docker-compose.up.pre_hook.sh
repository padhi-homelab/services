#!/usr/bin/env bash

set -Eumo pipefail

SELF_DIR="$(cd -P -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)"

mkdir -p $SELF_DIR/data/redis/data \
         $SELF_DIR/data/nextcloud/data \
         $SELF_DIR/data/nextcloud/var/www/html \
         $SELF_DIR/data/nextcloud/usr/local/etc/php/conf.d

# FIXME: Workaround from https://github.com/nextcloud/docker/issues/763#issuecomment-1007447212
touch $SELF_DIR/data/nextcloud/usr/local/etc/php/conf.d/redis-session.ini

# FIXME: Workaround from https://github.com/nextcloud/docker/issues/1494#issuecomment-1213540687 
mkdir -p $SELF_DIR/data/nextcloud/etc/apache2/conf-enabled
touch $SELF_DIR/data/nextcloud/etc/apache2/conf-enabled/remoteip.conf
