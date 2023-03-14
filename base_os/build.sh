#!/bin/sh
docker build -f Dockerfile -t ghcr.io/inti-cmnb/base_os:latest .
TG=d`docker run --rm ghcr.io/inti-cmnb/base_os:latest cat /etc/debian_version | tr -d '\n'`
docker tag ghcr.io/inti-cmnb/base_os:latest ghcr.io/inti-cmnb/base_os:${TG}
docker push ghcr.io/inti-cmnb/base_os:${TG}
docker push ghcr.io/inti-cmnb/base_os:latest

