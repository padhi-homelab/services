#!/usr/bin/env bash

set -Eumo pipefail

SELF_DIR="$(cd -P -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)"

# TODO:
# This should be done within the unms Dockerfile!
# It initializes a bunch of directories, but not cache.
mkdir -p "$SELF_DIR/data/unms/cache"
chown 1000 "$SELF_DIR/data/unms/cache"
