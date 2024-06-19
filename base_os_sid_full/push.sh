#!/bin/sh
set -e
TG1=d_sid
TG2=b`docker run --rm ghcr.io/inti-cmnb/base_os_full:latest_sid /bin/bash -c "ls -d /usr/bin/?.? | tr -d '\n' | tail -c 3"`
docker push ghcr.io/inti-cmnb/base_os_full:${TG1}_${TG2}
docker push ghcr.io/inti-cmnb/base_os_full:latest_sid
