#!/usr/bin/env bash

set -Eumo pipefail

SELF_DIR="$(cd -P -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)"

mkdir -p $SELF_DIR/data/caddy/config \
         $SELF_DIR/data/caddy/data \
         $SELF_DIR/data/lidarr/config \
         $SELF_DIR/data/lidarr/downloads \
         $SELF_DIR/data/radarr/config \
         $SELF_DIR/data/radarr/downloads \
         $SELF_DIR/data/sonarr/config \
         $SELF_DIR/data/sonarr/downloads

if ! [ -f "$SELF_DIR/data/radarr/config/config.xml" ]; then
  cp "$SELF_DIR/extra/radarr/config/config.xml" \
     "$SELF_DIR/data/radarr/config/config.xml"
fi

if ! [ -f "$SELF_DIR/data/lidarr/config/config.xml" ]; then
  cp "$SELF_DIR/extra/lidarr/config/config.xml" \
     "$SELF_DIR/data/lidarr/config/config.xml"
fi

if ! [ -f "$SELF_DIR/data/sonarr/config/config.xml" ]; then
  cp "$SELF_DIR/extra/sonarr/config/config.xml" \
     "$SELF_DIR/data/sonarr/config/config.xml"
fi

cat << EOF > "$SELF_DIR/.env"
TZ=$(timedatectl | awk '/Time zone:/ {print $3}')
USER_ID=$(id -u)
EOF
