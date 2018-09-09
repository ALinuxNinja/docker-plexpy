#!/usr/bin/env python2

from __future__ import print_function
import requests
import json

## set repo
GITHUB_REPO="Tautulli/Tautulli"

## get current release
try:
	current_release=json.loads(requests.get("https://api.github.com/repos/" + GITHUB_REPO + "/releases/latest").text)
except requests.exceptions.RequestException as e:
    # catastrophic error. bail.
    print('Error:', e)
    sys.exit(1)

## set tag name
current_release_version=current_release['tag_name']
current_release_version_file=open('current_release_version', 'w+')
current_release_version_file.write(current_release_version)
current_release_version_file.close()

## download version
current_release_download=requests.get(current_release['tarball_url'], allow_redirects=True).content
open('current_release.tar.gz', 'wb').write(current_release_download)
