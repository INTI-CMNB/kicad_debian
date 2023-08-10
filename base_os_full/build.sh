#!/bin/sh
docker build -f Dockerfile -t ghcr.io/inti-cmnb/base_os_full:latest .
TG1=d`docker run --rm ghcr.io/inti-cmnb/base_os_full:latest cat /etc/debian_version | tr -d '\n'`
TG2=b`docker run --rm ghcr.io/inti-cmnb/base_os_full:latest /bin/bash -c "blender --version | head -n 1 | tr -d 'Blender '"`
docker tag ghcr.io/inti-cmnb/base_os_full:latest ghcr.io/inti-cmnb/base_os_full:${TG1}_${TG2}
docker push ghcr.io/inti-cmnb/base_os_full:${TG1}_${TG2}
docker push ghcr.io/inti-cmnb/base_os_full:latest

