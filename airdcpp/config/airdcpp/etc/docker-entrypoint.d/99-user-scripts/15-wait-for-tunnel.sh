#!/bin/sh

while ! ping -c 1 -W 1 1.1.1.1 ; do
  echo "Waiting for network ..."
done
