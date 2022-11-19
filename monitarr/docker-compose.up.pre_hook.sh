#!/usr/bin/env bash

set -Eumo pipefail

SELF_DIR="$(cd -P -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)"
DATA_DIR="$SELF_DIR/data"

mkdir -p $DATA_DIR/lidarr/config \
         $DATA_DIR/lidarr/downloads \
         $DATA_DIR/lidarr/music \
         $DATA_DIR/radarr/config \
         $DATA_DIR/radarr/downloads \
         $DATA_DIR/radarr/movies \
         $DATA_DIR/sonarr/config \
         $DATA_DIR/sonarr/downloads \
         $DATA_DIR/sonarr/tv

if ! [ -f "$DATA_DIR/radarr/config/config.xml" ]; then
  cp "$SELF_DIR/generated/radarr/config/config.xml" \
     "$DATA_DIR/radarr/config/config.xml"
fi

if ! [ -f "$DATA_DIR/lidarr/config/config.xml" ]; then
  cp "$SELF_DIR/generated/lidarr/config/config.xml" \
     "$DATA_DIR/lidarr/config/config.xml"
fi

if ! [ -f "$DATA_DIR/sonarr/config/config.xml" ]; then
  cp "$SELF_DIR/generated/sonarr/config/config.xml" \
     "$DATA_DIR/sonarr/config/config.xml"
fi
