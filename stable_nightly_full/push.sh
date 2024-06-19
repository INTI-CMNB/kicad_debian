#!/bin/sh
set -e
TG1=t`docker run --rm ghcr.io/inti-cmnb/kicad_debian:stable_nightly_full kicad_version.py`
TG2=`docker run --rm ghcr.io/inti-cmnb/kicad_debian:stable_nightly_full /bin/bash -c "grep DISTRIB_CODENAME /etc/lsb-release | sed  s/DISTRIB_CODENAME=//" | tr -d '\n'`
TG3=b`docker run --rm ghcr.io/inti-cmnb/kicad_debian:stable_nightly_full /bin/bash -c "blender --version | head -n 1 | tr -d 'Blender '"`
docker push ghcr.io/inti-cmnb/kicad_debian:${TG1}_${TG2}_${TG3}
docker push ghcr.io/inti-cmnb/kicad_debian:stable_nightly_full

