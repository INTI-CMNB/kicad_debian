#!/bin/sh
set -e
cp ../kicad_version.py .
docker build -f Dockerfile -t ghcr.io/inti-cmnb/kicad_debian:nightly .
. ./tgs.sh
docker tag ghcr.io/inti-cmnb/kicad_debian:nightly ghcr.io/inti-cmnb/kicad_debian:${TG1}_${TG2}
