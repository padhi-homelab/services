#!/usr/bin/bash

set -e

PUID=${PUID:-1000}
PGID=${PGID:-1000}

groupmod -o -g "$PGID" www-data
usermod -o -u "$PUID" www-data

# NOTE: Remove apache's root-owned symlinks for logs,
rm -f /var/log/apache2/*.log
# NOTE: and replace with named FIFOs instead.
mkfifo /var/log/apache2/error.log \
       /var/log/apache2/access.log \
       /var/log/apache2/other_vhosts_access.log
cat <> /var/log/apache2/error.log >&2 &
cat <> /var/log/apache2/access.log >&1 &
cat <> /var/log/apache2/other_vhosts_access.log >&1 &

chown -R www-data:www-data /var/www/html \
                           /var/lock/apache2 \
                           /var/log/apache2 \
                           /var/run/apache2

grep -q "Listen 8080" /etc/apache2/ports.conf || \
  sed -i 's/Listen 80/Listen 8080/g' /etc/apache2/ports.conf

grep -q ":8080" /etc/apache2/sites-available/000-default.conf || \
  sed -i 's/:80/:8080/g' /etc/apache2/sites-available/000-default.conf

exec "docker-entrypoint.sh" \
     setpriv --reuid www-data \
             --regid www-data \
             --init-groups \
             "$@"
