#!/usr/bin/env bash

set -Eumo pipefail

SELF_DIR="$(cd -P -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)"

mkdir -p $SELF_DIR/data/airdcpp/config \
         $SELF_DIR/data/airdcpp/downloads \
         $SELF_DIR/data/airdcpp/shared \
         $SELF_DIR/data/caddy/config \
         $SELF_DIR/data/caddy/data \
         $SELF_DIR/data/openvpn/config
