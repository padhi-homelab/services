#!/usr/bin/env bash

set -Eumo pipefail

SELF_DIR="$(cd -P -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)"
DATA_DIR="$SELF_DIR/data"

mkdir -p "$DATA_DIR/airdcpp/config" \
         "$DATA_DIR/airdcpp/downloads" \
         "$DATA_DIR/airdcpp/shared" \
         "$DATA_DIR/openvpn/config"
