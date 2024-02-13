#!/bin/sh
set -e
docker build -f Dockerfile -t ghcr.io/inti-cmnb/base_os_full:latest_nightly .
TG1=d`docker run --rm ghcr.io/inti-cmnb/base_os_full:latest_nightly cat /etc/debian_version | tr -d '\n'`
TG2=b`docker run --rm ghcr.io/inti-cmnb/base_os_full:latest_nightly /bin/bash -c "ls -d /usr/bin/?.? | tr -d '\n' | tail -c 3"`
docker tag ghcr.io/inti-cmnb/base_os_full:latest_nightly ghcr.io/inti-cmnb/base_os_full:${TG1}_${TG2}
docker push ghcr.io/inti-cmnb/base_os_full:${TG1}_${TG2}
docker push ghcr.io/inti-cmnb/base_os_full:latest_nightly
