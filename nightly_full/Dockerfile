FROM ghcr.io/inti-cmnb/base_os_full:latest_nightly
LABEL Maintainer="Salvador E. Tropea <stropea@inti.gob.ar>"
LABEL Description="KiCad nightly on Ubuntu + heavy tools"
LABEL org.opencontainers.image.description="KiCad nightly on Ubuntu + heavy tools"

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Etc/UTC

COPY kicad_3d_install.sh kicad_version.py /usr/bin/
# COPY images.tar.gz /usr/share/kicad/resources/
# COPY pcm.v1.schema.json api.v1.schema.json /usr/share/kicad/schemas/
# COPY fp-lib-table sym-lib-table /usr/share/kicad/template/
