#!/usr/bin/env bash

echo SERVER_IP=$(ip route get 1.2.3.4 | head -n1 | awk '{print $7}')
