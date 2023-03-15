#!/bin/sh
cp ../kicad_version.py .
docker build -f Dockerfile -t ghcr.io/inti-cmnb/kicad6_debian:latest_full .
TG1=`docker run --rm ghcr.io/inti-cmnb/kicad6_debian:latest_full kicad_version.py`
TG2=d`docker run --rm ghcr.io/inti-cmnb/kicad6_debian:latest_full cat /etc/debian_version | tr -d '\n'`
TG3=b`docker run --rm ghcr.io/inti-cmnb/kicad6_debian:latest_full /bin/bash -c "ls -d /usr/bin/?.? | tr -d '\n' | tail -c 3"`
docker tag ghcr.io/inti-cmnb/kicad6_debian:latest_full ghcr.io/inti-cmnb/kicad_debian:ki${TG1}_Debian_full
docker tag ghcr.io/inti-cmnb/kicad6_debian:latest_full ghcr.io/inti-cmnb/kicad6_debian:${TG1}_${TG2}_${TG3}
docker push ghcr.io/inti-cmnb/kicad_debian:ki${TG1}_Debian_full
docker push ghcr.io/inti-cmnb/kicad6_debian:${TG1}_${TG2}_${TG3}
docker push ghcr.io/inti-cmnb/kicad6_debian:latest_full

