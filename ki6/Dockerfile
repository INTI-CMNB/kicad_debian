FROM debian:bullseye-slim
MAINTAINER Salvador E. Tropea <stropea@inti.gob.ar>
LABEL Description="Minimal KiCad 6 image based on Ubuntu 21.10"

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Etc/UTC
COPY kicad_3d_install.sh /usr/bin/
RUN	echo "deb http://deb.debian.org/debian bullseye-backports main" >> /etc/apt/sources.list && \
	apt-get -y update && \
	apt-get -y install -t bullseye-backports --no-install-recommends kicad kicad-symbols kicad-templates kicad-footprints && \
	apt-get -y autoremove && \
	rm -rf /var/lib/apt/lists/* \
	rm -rf /usr/share/icons/Adwaita/
