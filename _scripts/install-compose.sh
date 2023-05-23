#!/usr/bin/env bash

set -Eumo pipefail

[ ! -e "$1" ] || exit 1
[ "$(uname)" = 'Linux' ] || exit 1

VERSION=2.18.1
OUTPUT="$1"

case "$(uname -m)" in
  x86_64  )            ARCH="amd64" ;;
  aarch64 )            ARCH="aarch64" ;;
  arm     | armv7l )   ARCH="armv7" ;;
  ppc64   )            ARCH="ppc64le" ;;
  s390x   )            ARCH="s390x" ;;
  * )                  exit 1 ;;
esac

mkdir -p "$(dirname "$OUTPUT")"
rm -f "$OUTPUT"

wget -qO "$OUTPUT" "https://github.com/docker/compose/releases/download/v${VERSION}/docker-compose-linux-${ARCH}"
chmod +x "$OUTPUT"
