#!/bin/sh
set -e
docker build -f Dockerfile -t ghcr.io/inti-cmnb/base_os_sid:latest .
TG=d_sid
docker tag ghcr.io/inti-cmnb/base_os_sid:latest ghcr.io/inti-cmnb/base_os_sid:${TG}

