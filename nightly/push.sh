#!/bin/sh
set -e
. ./tgs.sh
docker push ghcr.io/inti-cmnb/kicad_debian:${TG1}_${TG2}
docker push ghcr.io/inti-cmnb/kicad_debian:nightly

