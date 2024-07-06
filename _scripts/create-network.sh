#!/usr/bin/env bash

set -Eumo pipefail

DOCKER_CMD="docker"
DOCKER_NETWORK_FLAGS="--attachable"

if ! $DOCKER_CMD version &> /dev/null ; then
  if ! podman version &> /dev/null ; then
    echo 'Failed to locate: `docker` or `podman`!'
    exit 1
  else
    DOCKER_CMD="podman"
    DOCKER_NETWORK_FLAGS=""
  fi
fi

NAME=$1

if ! $DOCKER_CMD network inspect $NAME &> /dev/null; then
  echo -n "[~] Creating external $DOCKER_CMD network '$NAME': "
  $DOCKER_CMD network create \
                      $DOCKER_NETWORK_FLAGS \
                      $NAME
fi
