#!/usr/bin/env bash

set -Eumo pipefail

find /profiles -maxdepth 1 -type f -name '*' -print0 | \
while IFS= read -r -d '' profile ; do
  [ ! -f "$profile.custom" ] || continue
  source "$profile"
  mysql "$MYSQL_DATABASE" -u"$MYSQL_USER" -p"$MYSQL_PASSWORD" -e 'SELECT 1;' || exit 1
done

