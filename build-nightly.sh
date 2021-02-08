#!/bin/sh
# KiCad nightly doesn't include the global symbol lib table:
#cp /usr/share/kicad/template/sym-lib-table .
#cp /usr/share/kicad/template/fp-lib-table .
docker build --no-cache -f Dockerfile-nightly -t setsoft/kicad_debian:bullseye-5.99-20210208 .
docker build -f Dockerfile-nightly -t setsoft/kicad_debian:nightly .
