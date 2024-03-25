#!/usr/bin/env bash

set -Eumo pipefail

DOCKER_CMD="podman"
DOCKER_NETWORK_FLAGS=""

if ! $DOCKER_CMD version &> /dev/null ; then
  if ! docker version &> /dev/null ; then
    echo 'Failed to locate: `docker` or `podman`!'
    exit 1
  else
    DOCKER_CMD="docker"
    DOCKER_NETWORK_FLAGS="--attachable"
  fi
fi

NAME=$1

if ! $DOCKER_CMD network inspect $NAME &> /dev/null; then
  echo -n "[~] Creating external $DOCKER_CMD network '$NAME': "
  $DOCKER_CMD network create \
                      $DOCKER_NETWORK_FLAGS \
                      $NAME
fi
