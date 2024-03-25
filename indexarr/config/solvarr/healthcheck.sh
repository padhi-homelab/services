#!/bin/sh

curl -s -X POST 'http://localhost:8191/v1' \
     --header 'Content-Type: application/json' \
     --data-raw '{"cmd": "request.get","url": "https://lite.duckduckgo.com/lite"}'\
  | grep -q '"status": "ok"'
