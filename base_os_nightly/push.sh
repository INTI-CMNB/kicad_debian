#!/bin/sh
set -e
TG=d`docker run --rm ghcr.io/inti-cmnb/base_os:latest_nightly cat /etc/debian_version | tr -d '\n'`
docker push ghcr.io/inti-cmnb/base_os:${TG}
docker push ghcr.io/inti-cmnb/base_os:latest_nightly

