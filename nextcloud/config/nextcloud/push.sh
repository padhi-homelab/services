#!/bin/sh

set -eu

NOTIFY_PUSH=/var/www/html/custom_apps/notify_push/bin/$(uname -m)/notify_push

if ! [ -f $NOTIFY_PUSH ]; then
  exec tail -f /dev/null
else
  exec $NOTIFY_PUSH --port 80 /var/www/html/config/config.php
fi
