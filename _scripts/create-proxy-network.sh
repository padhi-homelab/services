#!/usr/bin/env bash

set -Eumo pipefail

docker network inspect \
               proxy \
               &> /dev/null \
|| \
docker network create \
               --attachable \
               proxy
