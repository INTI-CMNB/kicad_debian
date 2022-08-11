FROM debian:bullseye-slim
MAINTAINER Salvador E. Tropea <stropea@inti.gob.ar>
LABEL Description="Minimal KiCad image based on Debian"

RUN     apt-get -y update && \
	apt-get -y install --no-install-recommends kicad kicad-libraries && \
	apt-get -y autoremove && \
	rm -rf /var/lib/apt/lists/* \
	rm -rf /usr/share/icons/Adwaita/

