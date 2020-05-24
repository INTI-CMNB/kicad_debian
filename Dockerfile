FROM debian:10.4-slim
MAINTAINER Salvador E. Tropea <set@ieee.org>
LABEL Description="Minimal KiCad image based on Debian"

RUN echo "deb http://deb.debian.org/debian buster-backports main" >> /etc/apt/sources.list && \
	apt-get -y update && \
	apt-get -y install -t buster-backports --no-install-recommends kicad kicad-libraries && \
	apt-get -y autoremove && \
	rm -rf /var/lib/apt/lists/* \
	rm -rf /usr/share/icons/Adwaita/

