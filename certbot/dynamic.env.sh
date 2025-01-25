#!/usr/bin/env bash

if [ "$LETS_ENCRYPT_ACME_CA_SERVER_USE_STAGING" != "NO" ]; then
  echo 'CERTBOT_EXTRA_FLAGS="--dry-run"'
fi
