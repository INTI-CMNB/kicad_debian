#!/bin/sh
# KiCad nightly doesn't include the global symbol lib table:
#cp /usr/share/kicad/template/sym-lib-table .
#cp /usr/share/kicad/template/fp-lib-table .
docker build --no-cache -f Dockerfile -t setsoft/kicad_debian:bullseye-7.0.0rc2-20230204 .
docker build -f Dockerfile -t setsoft/kicad_debian:nightly .
