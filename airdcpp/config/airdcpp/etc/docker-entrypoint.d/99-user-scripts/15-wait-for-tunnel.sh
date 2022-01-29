#!/bin/sh

while ! ping -I tun0 -c 1 -W 1 1.1.1.1 ; do
  echo "Waiting for tun0 to be online ..."
  sleep 1s
done
