#!/usr/bin/env bash

set -Eumo pipefail

SELF_DIR="$(cd -P -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)"

mkdir -p "$SELF_DIR/data/openvpn/config" \
         "$SELF_DIR/data/qbittorrent/config" \
         "$SELF_DIR/data/qbittorrent/data" \
         "$SELF_DIR/data/qbittorrent/torrents/complete" \
         "$SELF_DIR/data/qbittorrent/torrents/incomplete"
