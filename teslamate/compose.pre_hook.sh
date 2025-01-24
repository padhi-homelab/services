#!/usr/bin/env bash

set -Eumo pipefail

SELF_DIR="$(cd -P -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)"
DATA_DIR="$SELF_DIR/data"

mkdir -p "$DATA_DIR/teslamate/opt/app/import" \
         "$DATA_DIR/postgres/var/lib/postgresql/data" \
	 	 "$DATA_DIR/mqtt/mosquitto/config" \
	 	 "$DATA_DIR/mqtt/mosquitto/data"
