#!/bin/sh
docker build -f Dockerfile -t ghcr.io/inti-cmnb/base_os:latest .
TG=d`docker run --rm ghcr.io/inti-cmnb/base_os:d11 cat /etc/debian_version | tr -d '\n'`
docker tag ghcr.io/inti-cmnb/base_os:latest ghcr.io/inti-cmnb/base_os:${TG}
docker push ghcr.io/inti-cmnb/base_os:latest
docker push ghcr.io/inti-cmnb/base_os:${TG}
