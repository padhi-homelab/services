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

mv /var/spool/cron/crontabs/www-data \
   /var/spool/cron/crontabs/user

exec busybox crond -f -l 0 -L /dev/stdout
