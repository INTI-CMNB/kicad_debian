FROM ghcr.io/inti-cmnb/base_os:latest
MAINTAINER Salvador E. Tropea <stropea@inti.gob.ar>
LABEL Description="KiCad 7 on Debian + base tool"
LABEL org.opencontainers.image.description "KiCad 7 on Debian + tool dependencies"

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Etc/UTC
COPY kicad_3d_install.sh kicad_version.py /usr/bin/
# GPG key obtained using: https://unix.stackexchange.com/questions/679495/now-that-apt-key-is-deprecated-how-do-you-add-an-ubuntu-ppa-as-a-debian-apt-sou
COPY kicad-7.0-releases.gpg /usr/share/keyrings/
# Debian 12.1 and Ubuntu Lunar (23.04) are quite similar on 2023-08
RUN     echo "deb [signed-by=/usr/share/keyrings/kicad-7.0-releases.gpg] https://ppa.launchpadcontent.net/kicad/kicad-7.0-releases/ubuntu lunar main" >> /etc/apt/sources.list && \
	apt-get -y update && \
	apt-get install -y --no-install-recommends kicad kicad-footprints kicad-symbols kicad-templates && \
	apt-get -y autoremove && \
	rm -rf /var/lib/apt/lists/* /var/cache/debconf/templates.dat-old /var/lib/dpkg/status-old && \
	rm -rf /usr/share/icons/Adwaita/ /*.deb
