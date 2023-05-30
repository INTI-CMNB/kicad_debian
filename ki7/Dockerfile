FROM ghcr.io/inti-cmnb/base_os:latest
MAINTAINER Salvador E. Tropea <stropea@inti.gob.ar>
LABEL Description="KiCad 7 on Debian + base tool"
LABEL org.opencontainers.image.description "KiCad 7 on Debian + tool dependencies"

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Etc/UTC
COPY kicad_3d_install.sh kicad_version.py /usr/bin/
RUN     apt-get -y update && \
	dl_deb.py -r KiCad_7.0.5.1 -s kicad-demos -- INTI-CMNB/kicad_debian && \
	apt-get -y install --no-install-recommends /*.deb && \
	apt-get -y autoremove && \
	rm -rf /var/lib/apt/lists/* /var/cache/debconf/templates.dat-old /var/lib/dpkg/status-old && \
	rm -rf /usr/share/icons/Adwaita/ /*.deb
