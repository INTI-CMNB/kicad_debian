#!/bin/sh
docker build -f Dockerfile -t ghcr.io/inti-cmnb/kicad6_debian:latest .
TG1=d`docker run --rm ghcr.io/inti-cmnb/kicad6_debian:latest kicad_version.py`
TG2=d`docker run --rm ghcr.io/inti-cmnb/kicad6_debian:latest cat /etc/debian_version | tr -d '\n'`
docker tag ghcr.io/inti-cmnb/kicad6_debian:latest ghcr.io/inti-cmnb/kicad_debian:ki6
docker tag ghcr.io/inti-cmnb/kicad6_debian:latest ghcr.io/inti-cmnb/kicad6_debian:${TG1}
docker tag ghcr.io/inti-cmnb/kicad6_debian:latest ghcr.io/inti-cmnb/kicad6_debian:${TG1}_${TG2}
docker push ghcr.io/inti-cmnb/kicad6_debian:latest
docker push ghcr.io/inti-cmnb/kicad6_debian:${TG1}
docker push ghcr.io/inti-cmnb/kicad6_debian:${TG1}_${TG2}
docker push ghcr.io/inti-cmnb/kicad_debian:ki6
