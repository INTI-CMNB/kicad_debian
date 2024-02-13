FROM ghcr.io/inti-cmnb/base_os_full:latest_nightly
MAINTAINER Salvador E. Tropea <stropea@inti.gob.ar>
LABEL Description="KiCad nightly on Ubuntu + heavy tools"
LABEL org.opencontainers.image.description "KiCad nightly on Ubuntu + heavy tools"

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Etc/UTC

COPY kicad_3d_install.sh kicad_version.py /usr/bin/
COPY images.tar.gz /usr/share/kicad/resources/
