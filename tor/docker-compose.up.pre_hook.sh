#!/usr/bin/env bash

set -Eumo pipefail

SELF_DIR="$(cd -P -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)"

mkdir -p $SELF_DIR/data/tor/etc/tor \
         $SELF_DIR/data/tor/var/lib/tor \
         $SELF_DIR/data/tor/var/log/tor
