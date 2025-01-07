#!/bin/sh
set -e
cp ../base_os/dl_deb.py .
docker build -f Dockerfile -t ghcr.io/inti-cmnb/base_os:latest_nightly .
# TG=d`docker run --rm ghcr.io/inti-cmnb/base_os:latest_nightly cat /etc/debian_version | tr -d '\n'`
# docker tag ghcr.io/inti-cmnb/base_os:latest_nightly ghcr.io/inti-cmnb/base_os:${TG}
