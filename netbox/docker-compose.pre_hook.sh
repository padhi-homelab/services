#!/usr/bin/env bash

set -Eumo pipefail

SELF_DIR="$(cd -P -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)"
DATA_DIR="$SELF_DIR/data"

mkdir -p "$DATA_DIR/postgres/var/lib/postgresql/data" \
         "$DATA_DIR/redis/data" \
         "$DATA_DIR/netbox/opt/netbox/netbox/media" \
         "$DATA_DIR/netbox/opt/netbox/netbox/reports" \
         "$DATA_DIR/netbox/opt/netbox/netbox/scripts"
