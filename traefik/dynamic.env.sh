#!/usr/bin/env bash

if [ "$SERVER_LETS_ENCRYPT_ACME_CA_SERVER_USE_STAGING" = "NO" ]; then
  echo 'SERVER_LETS_ENCRYPT_ACME_CA_SERVER=https://acme-v02.api.letsencrypt.org/directory'
else
  echo 'SERVER_LETS_ENCRYPT_ACME_CA_SERVER=https://acme-staging-v02.api.letsencrypt.org/directory'
fi
