#!/bin/sh
cp ../base_os/dl_deb.py .
docker build -f Dockerfile -t ghcr.io/inti-cmnb/base_os:latest_nightly .
TG=`docker run --rm ghcr.io/inti-cmnb/base_os:latest_nightly /bin/bash -c "grep DISTRIB_CODENAME /etc/lsb-release | sed  s/DISTRIB_CODENAME=//" | tr -d '\n'`
docker tag ghcr.io/inti-cmnb/base_os:latest_nightly ghcr.io/inti-cmnb/base_os:${TG}
docker push ghcr.io/inti-cmnb/base_os:${TG}
docker push ghcr.io/inti-cmnb/base_os:latest_nightly

