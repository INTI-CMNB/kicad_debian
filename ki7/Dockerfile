FROM ghcr.io/inti-cmnb/base_os:latest
MAINTAINER Salvador E. Tropea <stropea@inti.gob.ar>
LABEL Description="KiCad 7 on Debian + base tool"
LABEL org.opencontainers.image.description "KiCad 7 on Debian + tool dependencies"

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Etc/UTC
COPY kicad_3d_install.sh kicad_version.py /usr/bin/
RUN     touch /etc/apt/sources.list && \
	cp /etc/apt/sources.list /etc/apt/sources.list.ok && \
	echo "deb http://deb.debian.org/debian bookworm-backports main" >> /etc/apt/sources.list && \
	apt-get -y update && \
	apt-get install -y --no-install-recommends kicad kicad-footprints kicad-symbols kicad-templates && \
	apt-get -y autoremove && \
	rm -rf /var/lib/apt/lists/* /var/cache/debconf/templates.dat-old /var/lib/dpkg/status-old && \
	rm -rf /usr/share/icons/Adwaita/ /*.deb
