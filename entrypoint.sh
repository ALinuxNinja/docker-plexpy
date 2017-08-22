#!/bin/sh

## Move to app dir
cd /app

## Make sure we can update
echo "========== Updating PlexPy =========="
git remote set-url origin https://github.com/JonnyWong16/plexpy.git
git fetch origin
git checkout master
git branch -u origin/master
git reset --hard origin/master
git pull

## Startup
echo "========== Starting PlexPy =========="
python PlexPy.py
