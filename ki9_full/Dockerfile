FROM ghcr.io/inti-cmnb/base_os_full:latest_nightly
LABEL Maintainer="Salvador E. Tropea <stropea@inti.gob.ar>"
LABEL Description="KiCad 9 on Debian + heavy tools"
LABEL org.opencontainers.image.description="KiCad 9 on Debian + heavy tools"

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Etc/UTC

COPY kicad_version.py /usr/bin/

