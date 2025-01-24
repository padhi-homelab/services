#!/usr/bin/env bash

set -Eumo pipefail

SELF_DIR="$(cd -P -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)"
DATA_DIR="$SELF_DIR/data"

CERT_FILENAME="cert.pem"
KEY_FILENAME="privkey.pem"

TRAEFIK_DATA_DIR="$SELF_DIR/../traefik/data"
TRAEFIK_CERT_FILE="$TRAEFIK_DATA_DIR/traefik/cert/default.crt"
TRAEFIK_KEY_FILE="$TRAEFIK_DATA_DIR/traefik/cert/default.key"

echo -n "[~] Checking for default SSL certificate: "
cd "$DATA_DIR/unifi/usr/lib/unifi/cert"

if [ -f "$CERT_FILENAME" ] && [ -f "$KEY_FILENAME" ] ; then
    echo "${_fg_green_}EXISTS${_normal_}" && exit 0
fi

! [ -f "$TRAEFIK_CERT_FILE" ] || cp "$TRAEFIK_CERT_FILE" "$CERT_FILENAME"
! [ -f "$TRAEFIK_KEY_FILE" ] || cp "$TRAEFIK_KEY_FILE" "$KEY_FILENAME"

if [ -f "$CERT_FILENAME" ] && [ -f "$KEY_FILENAME" ] ; then
    echo "${_fg_cyan_}${_bold_}TRAEFIK${_normal_}" && exit 0
fi

openssl req -x509 -newkey rsa:4096 -sha512 -days 3650 -nodes \
            -subj "/CN=${SERVER_LAN_FQDN}" \
            -addext "subjectAltName=DNS:${SERVER_LAN_FQDN}" \
            -keyout "$KEY_FILENAME" -out "$CERT_FILENAME" \
            2> /dev/null
echo "${_fg_magenta_}${_bold_}GENERATED!${_normal_}"
