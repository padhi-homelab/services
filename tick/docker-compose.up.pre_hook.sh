#!/usr/bin/env bash

set -Eumo pipefail

SELF_DIR="$(cd -P -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)"
DATA_DIR="$SELF_DIR/data"

mkdir -p "$DATA_DIR/chronograf/var/lib/chronograf" \
         "$DATA_DIR/influxdb/etc/influxdb2" \
         "$DATA_DIR/influxdb/var/lib/influxdb2" \
         "$DATA_DIR/kapacitor/.kapacitor" \
         "$DATA_DIR/kapacitor/etc/kapacitor" \
         "$DATA_DIR/kapacitor/var/lib/kapacitor" \
         "$DATA_DIR/telegraf/etc/telegraf"
