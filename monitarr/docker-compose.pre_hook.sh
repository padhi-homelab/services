#!/usr/bin/env bash

set -Eumo pipefail

SELF_DIR="$(cd -P -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)"
DATA_DIR="$SELF_DIR/data"

mkdir -p "$DATA_DIR/lidarr/config" \
         "$DATA_DIR/lidarr/downloads" \
         "$DATA_DIR/lidarr/music" \
         "$DATA_DIR/radarr/config" \
         "$DATA_DIR/radarr/downloads" \
         "$DATA_DIR/radarr/movies" \
         "$DATA_DIR/sonarr/config" \
         "$DATA_DIR/sonarr/downloads" \
         "$DATA_DIR/sonarr/tv"
