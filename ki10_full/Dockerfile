FROM ghcr.io/inti-cmnb/base_os_full:latest
LABEL MAINTAINER="Salvador E. Tropea <stropea@inti.gob.ar>"
LABEL Description="KiCad 10 on Debian + heavy tools"
LABEL org.opencontainers.image.description="KiCad 10 on Debian + heavy tools"

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Etc/UTC
COPY kicad_version.py /usr/bin/
COPY kicad-10.0-releases.sources /etc/apt/sources.list.d/
# Used to get WIP versions
# COPY kicad-10.0-nightly.sources /etc/apt/sources.list.d/
COPY kicad_3d_install.sh kicad_version.py /usr/bin/
RUN     apt-get -y update && \
	apt-get -y install --no-install-recommends kicad kicad-libraries kicad-footprints kicad-symbols kicad-templates && \
	apt-get -y autoremove && \
	rm -rf /var/lib/apt/lists/* /var/cache/debconf/templates.dat-old /var/lib/dpkg/status-old && \
	rm -rf /usr/share/icons/Adwaita/ /*.deb

# KiCad 10 doesn't work without lib tables (i.e. CLI ERC fails, GUI asks to initialize, etc.)
RUN     export DEST=~/.config/kicad/`kicad_version.py  | cut -d. -f1,2` && \
	mkdir -p ${DEST} && \
	cp /usr/share/kicad/template/fp-lib-table  /usr/share/kicad/template/sym-lib-table ${DEST}
