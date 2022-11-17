#!/usr/bin/env bash

set -Eumo pipefail

SELF_DIR="$(cd -P -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)"
DATA_DIR="$SELF_DIR/data"

mkdir -p "$DATA_DIR/openvpn/config" \
         "$DATA_DIR/qbittorrent/config" \
         "$DATA_DIR/qbittorrent/data" \
         "$DATA_DIR/qbittorrent/torrents/complete" \
         "$DATA_DIR/qbittorrent/torrents/incomplete"
