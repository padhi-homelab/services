#!/usr/bin/env bash

set -Eumo pipefail

SELF_DIR="$(cd -P -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)"
DATA_DIR="$SELF_DIR/data"

mkdir -p "$DATA_DIR/traefik/cert" \
         "$DATA_DIR/traefik/etc/traefik/lets-encrypt"

echo -n "[~] Checking for default certificates: "
cd "$DATA_DIR/traefik/cert"

[ -f "default.crt" ] && [ -f "default.key" ] && \
    echo 'EXIST' && exit 0

openssl req -x509 -newkey rsa:4096 -sha512 -days 3650 -nodes \
            -subj "/CN=${SERVER_WAN_FQDN}" \
            -keyout default.key -out default.crt \
            2> /dev/null
echo 'GENERATED!'
