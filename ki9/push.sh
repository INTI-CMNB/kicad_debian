#!/bin/sh
set -e
TG1=`docker run --rm ghcr.io/inti-cmnb/kicad9_debian:latest kicad_version.py`
TG2=d`docker run --rm ghcr.io/inti-cmnb/kicad9_debian:latest cat /etc/debian_version | tr -d '\n'`
docker push ghcr.io/inti-cmnb/kicad_debian:ki${TG1}_Debian
docker push ghcr.io/inti-cmnb/kicad_debian:ki9
docker push setsoft/kicad_debian:ki${TG1}_Debian
docker push setsoft/kicad_debian:ki9
docker push ghcr.io/inti-cmnb/kicad9_debian:${TG1}
docker push ghcr.io/inti-cmnb/kicad9_debian:${TG1}_${TG2}
docker push ghcr.io/inti-cmnb/kicad9_debian:latest

