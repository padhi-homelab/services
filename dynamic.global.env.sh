#!/usr/bin/env bash

set -Eumo pipefail

cat << EOF
ARCHITECTURE="$(uname -m)"
GROUP_ID="$(id -g)"
HOST_NAME="$(hostname 2>/dev/null || hostnamectl hostname)"
USER_ID="$(id -u)"
TZ="$(timedatectl | awk '/Time zone:/ {print $3}')"
EOF
