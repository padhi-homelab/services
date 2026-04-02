#!/usr/bin/env bash

set -Eumo pipefail

SELF_DIR="$(cd -P -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)"
DATA_DIR="$SELF_DIR/data"

if ! [ -f "$DATA_DIR/mosquitto/mosquitto/security/acl" ]; then
  touch "$DATA_DIR/mosquitto/mosquitto/security/acl"
  chmod 0700 "$DATA_DIR/mosquitto/mosquitto/security/acl"
fi

if ! [ -f "$DATA_DIR/mosquitto/mosquitto/security/passwd" ]; then
  touch "$DATA_DIR/mosquitto/mosquitto/security/passwd"
  chmod 0700 "$DATA_DIR/mosquitto/mosquitto/security/passwd"
fi
