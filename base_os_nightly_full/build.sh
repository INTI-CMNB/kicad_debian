#!/bin/sh
set -e
docker build -f Dockerfile -t ghcr.io/inti-cmnb/base_os_full:latest_nightly .
TG1=`docker run --rm ghcr.io/inti-cmnb/base_os_full:latest_nightly /bin/bash -c "grep DISTRIB_CODENAME /etc/lsb-release | sed  s/DISTRIB_CODENAME=//" | tr -d '\n'`
TG2=b`docker run --rm ghcr.io/inti-cmnb/base_os_full:latest_nightly /bin/bash -c "ls -d /usr/bin/?.? | tr -d '\n' | tail -c 3"`
docker tag ghcr.io/inti-cmnb/base_os_full:latest_nightly ghcr.io/inti-cmnb/base_os_full:${TG1}_${TG2}
docker push ghcr.io/inti-cmnb/base_os_full:${TG1}_${TG2}
docker push ghcr.io/inti-cmnb/base_os_full:latest_nightly
