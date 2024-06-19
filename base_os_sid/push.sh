#!/bin/sh
set -e
TG=d_sid
docker push ghcr.io/inti-cmnb/base_os_sid:${TG}
docker push ghcr.io/inti-cmnb/base_os_sid:latest

