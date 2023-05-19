FROM ghcr.io/inti-cmnb/base_os_full:latest_nightly
MAINTAINER Salvador E. Tropea <stropea@inti.gob.ar>
LABEL Description="KiCad stable nightly on Ubuntu + heavy tools"
LABEL org.opencontainers.image.description "KiCad stable nightly on Ubuntu + heavy tools"

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Etc/UTC
RUN     add-apt-repository --remove ppa:kicad/kicad-dev-nightly && \
	add-apt-repository ppa:kicad/kicad-7.0-nightly && \
	apt-get update && \
	apt-get -y install --no-install-recommends kicad kicad-templates kicad-libraries kicad-symbols kicad-footprints && \
	apt-get -y autoremove && \
	rm -rf /var/lib/apt/lists/* /var/cache/debconf/templates.dat-old /var/lib/dpkg/status-old && \
	rm -rf /usr/share/icons/Adwaita/ /*.deb
COPY kicad_3d_install.sh kicad_version.py /usr/bin/

