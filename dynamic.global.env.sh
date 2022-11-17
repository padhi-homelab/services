#!/usr/bin/env bash

set -Eumo pipefail

cat << EOF
GROUP_ID=$(id -g)
HOST_NAME=$(hostname)
USER_ID=$(id -u)
TZ=$(timedatectl | awk '/Time zone:/ {print $3}')
EOF
