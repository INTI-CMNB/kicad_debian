#!/bin/sh
set -e
cp ../kicad_version.py .
docker build -f Dockerfile -t ghcr.io/inti-cmnb/kicad8_debian:latest .
TG1=`docker run --rm ghcr.io/inti-cmnb/kicad8_debian:latest kicad_version.py`
TG2=d_sid
docker tag ghcr.io/inti-cmnb/kicad8_debian:latest ghcr.io/inti-cmnb/kicad_debian:ki${TG1}_Debian
docker tag ghcr.io/inti-cmnb/kicad8_debian:latest ghcr.io/inti-cmnb/kicad_debian:ki8
docker tag ghcr.io/inti-cmnb/kicad8_debian:latest setsoft/kicad_debian:ki${TG1}_Debian
docker tag ghcr.io/inti-cmnb/kicad8_debian:latest setsoft/kicad_debian:ki8
docker tag ghcr.io/inti-cmnb/kicad8_debian:latest ghcr.io/inti-cmnb/kicad8_debian:${TG1}
docker tag ghcr.io/inti-cmnb/kicad8_debian:latest ghcr.io/inti-cmnb/kicad8_debian:${TG1}_${TG2}
docker push ghcr.io/inti-cmnb/kicad_debian:ki${TG1}_Debian
docker push ghcr.io/inti-cmnb/kicad_debian:ki8
docker push setsoft/kicad_debian:ki${TG1}_Debian
docker push setsoft/kicad_debian:ki8
docker push ghcr.io/inti-cmnb/kicad8_debian:${TG1}
docker push ghcr.io/inti-cmnb/kicad8_debian:${TG1}_${TG2}
docker push ghcr.io/inti-cmnb/kicad8_debian:latest

