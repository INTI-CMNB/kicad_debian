#!/bin/sh
set -e
cp ../kicad_version.py .
docker build -f Dockerfile -t ghcr.io/inti-cmnb/kicad9_debian:latest .
TG1=`docker run --rm ghcr.io/inti-cmnb/kicad9_debian:latest kicad_version.py`
TG2=d`docker run --rm ghcr.io/inti-cmnb/kicad9_debian:latest cat /etc/debian_version | tr -d '\n'`
docker tag ghcr.io/inti-cmnb/kicad9_debian:latest ghcr.io/inti-cmnb/kicad_debian:ki${TG1}_Debian
docker tag ghcr.io/inti-cmnb/kicad9_debian:latest ghcr.io/inti-cmnb/kicad_debian:ki9
docker tag ghcr.io/inti-cmnb/kicad9_debian:latest setsoft/kicad_debian:ki${TG1}_Debian
docker tag ghcr.io/inti-cmnb/kicad9_debian:latest setsoft/kicad_debian:ki9
docker tag ghcr.io/inti-cmnb/kicad9_debian:latest ghcr.io/inti-cmnb/kicad9_debian:${TG1}
docker tag ghcr.io/inti-cmnb/kicad9_debian:latest ghcr.io/inti-cmnb/kicad9_debian:${TG1}_${TG2}
