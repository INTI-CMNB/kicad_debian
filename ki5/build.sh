#!/bin/sh
cp ../kicad_version.py .
docker build -f Dockerfile -t ghcr.io/inti-cmnb/kicad5_debian:latest .
TG1=`docker run --rm ghcr.io/inti-cmnb/kicad5_debian:latest cat /etc/debian_version | tr -d '\n'`
TG2=`docker run --rm ghcr.io/inti-cmnb/kicad5_debian:latest kicad_version.py`
docker tag ghcr.io/inti-cmnb/kicad5_debian:latest ghcr.io/inti-cmnb/kicad_debian:${TG1}-${TG2}
docker tag ghcr.io/inti-cmnb/kicad5_debian:latest ghcr.io/inti-cmnb/kicad_debian:latest
docker tag ghcr.io/inti-cmnb/kicad5_debian:latest setsoft/kicad_debian:${TG1}-${TG2}
docker tag ghcr.io/inti-cmnb/kicad5_debian:latest setsoft/kicad_debian:latest
docker tag ghcr.io/inti-cmnb/kicad5_debian:latest ghcr.io/inti-cmnb/kicad5_debian:${TG2}
docker tag ghcr.io/inti-cmnb/kicad5_debian:latest ghcr.io/inti-cmnb/kicad5_debian:${TG2}_d${TG1}
docker push ghcr.io/inti-cmnb/kicad_debian:${TG1}-${TG2}
docker push ghcr.io/inti-cmnb/kicad_debian:latest
docker push setsoft/kicad_debian:${TG1}-${TG2}
docker push setsoft/kicad_debian:latest
docker push ghcr.io/inti-cmnb/kicad5_debian:${TG2}
docker push ghcr.io/inti-cmnb/kicad5_debian:${TG2}_d${TG1}
docker push ghcr.io/inti-cmnb/kicad5_debian:latest

