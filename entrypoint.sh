#!/bin/sh

## Move to app dir
cd /app

## Startup
echo "========== Starting PlexPy =========="
python PlexPy.py --config /app/.docker/config --datadir /app/.docker/data
