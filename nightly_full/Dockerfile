FROM ghcr.io/inti-cmnb/base_os_full:latest_nightly
MAINTAINER Salvador E. Tropea <stropea@inti.gob.ar>
LABEL Description="KiCad nightly on Ubuntu + heavy tools"
LABEL org.opencontainers.image.description "KiCad nightly on Ubuntu + heavy tools"

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Etc/UTC
ENV LD_LIBRARY_PATH="/usr/lib/kicad-nightly/lib/x86_64-linux-gnu/:/usr/lib/kicad-nightly/lib/"
ENV KICAD_PATH="/usr/share/kicad-nightly"
ENV PYTHONPATH="/usr/lib/kicad-nightly/local/lib/python3.10/dist-packages"

RUN     apt-get update && \
	apt-get install -y software-properties-common && \
	add-apt-repository ppa:kicad/kicad-dev-nightly && \
	apt-get update && \
	apt-get -y install --no-install-recommends kicad-nightly kicad-nightly-templates kicad-nightly-libraries kicad-nightly-symbols kicad-nightly-footprints && \
	apt-get -y autoremove && \
	rm -rf /var/lib/apt/lists/* /var/cache/debconf/templates.dat-old /var/lib/dpkg/status-old && \
	rm -rf /usr/share/icons/Adwaita/ /*.deb
COPY kicad_3d_install.sh kicad_version.py /usr/bin/
# Make the nightly the main KiCad
RUN     ln -s /usr/bin/kicad-cli-nightly /usr/bin/kicad-cli && \
	ln -s /usr/bin/pcbnew-nightly /usr/bin/pcbnew && \
	ln -s /usr/bin/eeschema-nightly /usr/bin/eeschema
