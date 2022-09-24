#!/usr/bin/env bash

set -Eumo pipefail

NAME=$1

if ! docker network inspect $NAME &> /dev/null; then
  echo -n "[~] Creating external docker network '$NAME': "
  docker network create \
                 --attachable \
                 $NAME
fi
