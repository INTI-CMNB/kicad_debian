FROM ghcr.io/inti-cmnb/base_os_full:latest
LABEL MAINTAINER="Salvador E. Tropea <stropea@inti.gob.ar>"
LABEL Description="KiCad 9 on Debian + heavy tools"
LABEL org.opencontainers.image.description="KiCad 9 on Debian + heavy tools"

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Etc/UTC
COPY kicad_3d_install.sh kicad_version.py /usr/bin/
RUN     touch /etc/apt/sources.list && \
	cp /etc/apt/sources.list /etc/apt/sources.list.ok && \
	echo "deb http://deb.debian.org/debian bookworm-backports main"  >> /etc/apt/sources.list && \
	apt-get -y update && \
	apt-get install -y -t bookworm-backports --no-install-recommends kicad kicad-footprints kicad-symbols kicad-templates && \
	apt-get -y autoremove && \
	rm -rf /var/lib/apt/lists/* /var/cache/debconf/templates.dat-old /var/lib/dpkg/status-old && \
	rm -rf /usr/share/icons/Adwaita/ /*.deb
