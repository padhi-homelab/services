#!/usr/bin/env bash

set -Eumo pipefail

# NOTE: `echo` to get rid of quotes around network name,
# possibly from extraction via `yq`.
NAME="$(echo $1)"

if ! docker network inspect $NAME &> /dev/null; then
  echo -n "[~] Creating external docker network '$NAME': "
  docker network create \
                 --attachable \
                 $NAME
fi
