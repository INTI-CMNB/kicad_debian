FROM ubuntu:21.10
MAINTAINER Salvador E. Tropea <stropea@inti.gob.ar>
LABEL Description="Minimal KiCad 6 image based on Ubuntu 21.10"

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Etc/UTC
RUN	apt-get -y update && \
	apt-get -y install --no-install-recommends gnupg && \
	echo "deb http://ppa.launchpad.net/kicad/kicad-6.0-releases/ubuntu impish main" >> /etc/apt/sources.list && \
	echo "deb-src http://ppa.launchpad.net/kicad/kicad-6.0-releases/ubuntu impish main " >> /etc/apt/sources.list && \
	apt-key adv --keyserver keyserver.ubuntu.com --recv-keys FDA854F61C4D0D9572BB95E5245D5502FAD7A805 && \
	apt-get -y update && \
	apt-get -y install --no-install-recommends kicad kicad-symbols kicad-templates kicad-footprints && \
	apt-get -y autoremove && \
	rm -rf /var/lib/apt/lists/* \
	rm -rf /usr/share/icons/Adwaita/

