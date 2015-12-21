#!/bin/bash
set -e

sed -i "s#\$REDIS_URL#$REDIS_URL#" /usr/local/etc/hipache/config.json

exec "$@"
