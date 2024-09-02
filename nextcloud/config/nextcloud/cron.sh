#!/bin/sh

set -eu

# FIXME: disable apache's access logs
# https://github.com/nextcloud/docker/issues/1667
#
# Apache may not run under `www-data` in non-root containers,
# which leads to permission errors in the usual entrypoint hooks
# that run as the $DOCKER_UID_USER.
#
# Ugly solution for now is to store such scripts in a "deferred"
# directory, and just run them as root here.
#
# (╯°□°)╯ ┻━┻

bash /docker-entrypoint-hooks.d/deferred/disable-access-logs.sh

# FIXME: cron jobs are hardcoded for `www-data` user
# https://github.com/nextcloud/docker/issues/1740
#
# Apache may not run under `www-data` in non-root containers,
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
