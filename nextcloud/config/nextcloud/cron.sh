#!/bin/sh

set -eu

# FIXME: cron jobs are hardcoded for `www-data` user,
# but apache doesn't run under `www-data` in non-root containers,
# which leads to permission errors in cron jobs.
#
# We create a user with the UID under which apache is running,
# and then move the cron job from `www-data` to that user.

adduser --disabled-password \
        --gecos "" \
        --uid "$DOCKER_UID" \
        user

if ! [ -f '/crontabs/user' ]; then
  cp /var/spool/cron/crontabs/www-data \
     /crontabs/user
  # NOTE: crontab must be "own"ed by root,
  # but we make it g+w to allow a non-root host user to edit it.
  chown "root:$DOCKER_GID" /crontabs/user
  chmod g+w /crontabs/user
fi

exec busybox crond -f -l 0 \
                   -L /dev/stdout \
                   -c /crontabs
