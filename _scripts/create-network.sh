#!/usr/bin/env bash

set -Eumo pipefail

SELF_DIR="$(cd -P -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)"
source "$SELF_DIR/colors.sh"

NAME=$1

RUNNER_CMD="${RUNNER_CMD:-}"
DOCKER_CMD="docker"
PODMAN_CMD="podman"

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

NETWORK_FLAGS=''
if [ "${RUNNER_CMD}" = "${DOCKER_CMD}" ] ; then
  NETWORK_FLAGS="--attachable"
fi

if ! $RUNNER_CMD network inspect $NAME &> /dev/null; then
  echo -n "[~] Creating external $RUNNER_CMD network '${_bold_}$NAME${_normal_}': "
  $RUNNER_CMD network create $NETWORK_FLAGS $NAME
fi
