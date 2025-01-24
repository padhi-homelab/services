#!/usr/bin/env bash

set -Eumo pipefail

SELF_DIR="$(cd -P -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)"
DATA_DIR="$SELF_DIR/data"

mkdir -p "$DATA_DIR/certbot/etc/letsencrypt" \
         "$DATA_DIR/certbot/var/lib/letsencrypt" \
         "$DATA_DIR/certbot/var/log/letsencrypt"
