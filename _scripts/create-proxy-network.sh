#!/usr/bin/env bash

set -Eumo pipefail

if ! docker network inspect proxy &> /dev/null; then
  echo -n "[+] Creating external docker network 'proxy': "
  docker network create \
                 --attachable \
                 proxy
fi
