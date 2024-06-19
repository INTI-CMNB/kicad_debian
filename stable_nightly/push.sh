#!/bin/sh
set -e
TG1=`docker run --rm ghcr.io/inti-cmnb/kicad_debian:stable_nightly kicad_version.py`
TG2=`docker run --rm ghcr.io/inti-cmnb/kicad_debian:stable_nightly /bin/bash -c "grep DISTRIB_CODENAME /etc/lsb-release | sed  s/DISTRIB_CODENAME=//" | tr -d '\n'`
docker push ghcr.io/inti-cmnb/kicad_debian:t${TG1}_${TG2}
docker push ghcr.io/inti-cmnb/kicad_debian:stable_nightly

