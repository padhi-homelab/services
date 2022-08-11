#!/usr/bin/env bash

set -Eumo pipefail

SELF_DIR="$(cd -P -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)"

mkdir -p "$SELF_DIR/data/traefik/cert" \
         "$SELF_DIR/data/traefik/etc/traefik" \
         "$SELF_DIR/data/traefik/var/log/traefik"
