#!/usr/bin/env bash

set -Eumo pipefail

SELF_DIR="$(cd -P -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)"

mkdir -p "$SELF_DIR/data/pihole/etc/pihole" \
         "$SELF_DIR/data/pihole/etc/dnsmasq.d"
