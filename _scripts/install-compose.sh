#!/usr/bin/env bash

set -Eumo pipefail

[ ! -e "$1" ] || exit 1
[ "$(uname)" = 'Linux' ] || exit 1

OUTPUT="$1"
RUNNER_CMD="${RUNNER_CMD:-}"

DOCKER_CMD="docker"
DOCKER_COMPOSE_VERSION=2.29.0

PODMAN_CMD="podman"
PODMAN_COMPOSE_VERSION=1.2.0

if [ -z "$RUNNER_CMD" ] ; then
  if command $DOCKER_CMD version &> /dev/null ; then
    RUNNER_CMD="${DOCKER_CMD}"
  elif command $PODMAN_CMD version &> /dev/null ; then
    RUNNER_CMD="${PODMAN_CMD}"
  else
    echo "Failed to locate: \`$DOCKER_CMD\` or \`$PODMAN_CMD\`!"
    exit 1
  fi
fi

if [ "${RUNNER_CMD}" = "${DOCKER_CMD}" ] ; then
  case "$(uname -m)" in
    x86_64  )            ARCH="amd64" ;;
    aarch64 )            ARCH="aarch64" ;;
    arm     | armv7l )   ARCH="armv7" ;;
    ppc64   )            ARCH="ppc64le" ;;
    s390x   )            ARCH="s390x" ;;
    * )                  exit 1 ;;
  esac
  URL="https://github.com/docker/compose/releases/download/v${DOCKER_COMPOSE_VERSION}/docker-compose-linux-${ARCH}"
elif [ "${RUNNER_CMD}" = "${PODMAN_CMD}" ] ; then
  URL="https://raw.githubusercontent.com/containers/podman-compose/v${PODMAN_COMPOSE_VERSION}/podman_compose.py"
fi

echo $RUNNER_CMD
echo $URL

mkdir -p "$(dirname "$OUTPUT")"
rm -f "$OUTPUT"

wget -qO "$OUTPUT" "$URL"
chmod +x "$OUTPUT"
