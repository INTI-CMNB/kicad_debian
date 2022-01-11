#!/bin/sh
# KiCad nightly doesn't include the global symbol lib table:
#cp /usr/share/kicad/template/sym-lib-table .
#cp /usr/share/kicad/template/fp-lib-table .
docker build --no-cache -f Dockerfile -t setsoft/kicad_debian:ki6 .
docker build -f Dockerfile-nightly -t setsoft/kicad_debian:ki6.0.0_Ubuntu21.10 .
