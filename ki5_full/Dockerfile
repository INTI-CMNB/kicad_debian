FROM ghcr.io/inti-cmnb/base_os_full:d11.6_b3.4
MAINTAINER Salvador E. Tropea <stropea@inti.gob.ar>
LABEL Description="KiCad 5 on Debian + heavy tools"
LABEL org.opencontainers.image.description "KiCad 5 on Debian + heavy tools"

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Etc/UTC
COPY kicad_3d_install.sh kicad_version.py /usr/bin/
RUN     apt-get -y update && \
	apt-get -y install --no-install-recommends kicad kicad-libraries && \
	apt-get -y autoremove && \
	rm -rf /var/lib/apt/lists/* /var/cache/debconf/templates.dat-old /var/lib/dpkg/status-old && \
	rm -rf /usr/share/icons/Adwaita/
