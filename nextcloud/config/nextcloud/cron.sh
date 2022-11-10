#!/bin/sh

set -eu

# FIXME: cron jobs are hardcoded for `www-data` user,
# but apache doesn't run under `www-data` in non-root containers,
# which leads to permission errors in cron jobs.
#
# We create a user with the UID under which apache is running,
# and then move the cron job from `www-data` to that user.

DOCKER_UID_USER="$(getent passwd $DOCKER_UID | cut -d: -f1)"

if [ -z "$DOCKER_UID_USER" ]; then
  DOCKER_UID_USER=user
  adduser --disabled-password \
          --gecos "" \
          --uid "$DOCKER_UID" \
          $DOCKER_UID_USER
fi

if ! [ -f "/crontabs/$DOCKER_UID_USER" ]; then
  cp /var/spool/cron/crontabs/www-data \
     /crontabs/$DOCKER_UID_USER
  # NOTE: crontab must be "own"ed by root,
  # but we make it g+w to allow a non-root host user to edit it.
  chown "root:$DOCKER_GID" /crontabs/$DOCKER_UID_USER
  chmod g+w /crontabs/$DOCKER_UID_USER
fi

exec busybox crond -f -l 0 \
                   -L /dev/stdout \
                   -c /crontabs
