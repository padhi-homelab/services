#!/usr/bin/env bash

set -Eumo pipefail

[ ! -e "$1" ] || exit 1
[ "$(uname)" = 'Linux' ] || exit 1

VERSION=4.44.6
OUTPUT="$1"

case "$(uname -m)" in
  i386    | i686   )    ARCH="386" ;;
  x86_64  )             ARCH="amd64" ;;
  aarch64 )             ARCH="arm64" ;;
  arm     | armv7l )    ARCH="arm" ;;
  ppc64   )             ARCH="ppc64" ;;
  s390x   )             ARCH="s390x" ;;
  * )                   exit 1 ;;
esac

mkdir -p "$(dirname "$OUTPUT")"
rm -f "$OUTPUT"

wget -qO "$OUTPUT" "https://github.com/mikefarah/yq/releases/download/v$VERSION/yq_linux_${ARCH}"
chmod +x "$OUTPUT"
