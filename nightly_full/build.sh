#!/bin/sh
set -e
cp ../kicad_version.py .
docker build -f Dockerfile -t ghcr.io/inti-cmnb/kicad_debian:nightly_full .
TG1=`docker run --rm ghcr.io/inti-cmnb/kicad_debian:nightly_full kicad_version.py`
TG2=`docker run --rm ghcr.io/inti-cmnb/kicad_debian:nightly_full /bin/bash -c "grep DISTRIB_CODENAME /etc/lsb-release | sed  s/DISTRIB_CODENAME=//" | tr -d '\n'`
TG3=b`docker run --rm ghcr.io/inti-cmnb/kicad_debian:nightly_full /bin/bash -c "blender --version | head -n 1 | tr -d 'Blender '"`
docker tag ghcr.io/inti-cmnb/kicad_debian:nightly_full ghcr.io/inti-cmnb/kicad_debian:${TG1}_${TG2}_${TG3}
docker push ghcr.io/inti-cmnb/kicad_debian:${TG1}_${TG2}_${TG3}
docker push ghcr.io/inti-cmnb/kicad_debian:nightly_full

