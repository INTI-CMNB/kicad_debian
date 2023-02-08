FROM debian:bullseye-slim
MAINTAINER Salvador E. Tropea <stropea@inti.gob.ar>
LABEL Description="Minimal KiCad image based on Debian (nightly)"

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Etc/UTC
COPY kicad_3d_install.sh /usr/bin/
COPY *.list /
RUN	echo "deb http://deb.debian.org/debian bullseye-backports main" >> /etc/apt/sources.list && \
	apt-get -y update && \
	apt-get -y install --no-install-recommends ca-certificates && \
	/usr/lib/apt/apt-helper download-file https://debian.sur5r.net/kicad-nightly/pool/main/s/sur5r-keyring/sur5r-keyring_2022.02.17_all.deb sur5r-keyring.deb SHA256:52053550c4ecb4e97c48900c61b2df4ec50728249d054190e8a0925addb12fc6  && \
	dpkg -i ./sur5r-keyring.deb && \
	mv /*.list /etc/apt/sources.list.d/ && \
	apt-get -y update && \
	apt-get -y install -t bullseye-backports --no-install-recommends kicad kicad-templates kicad-libraries kicad-symbols kicad-footprints && \
	apt-get -y install --no-install-recommends kicad-nightly kicad-nightly-templates kicad-nightly-libraries kicad-nightly-symbols kicad-nightly-footprints && \
	apt-get -y autoremove && \
	rm -rf /var/lib/apt/lists/* /*.deb && \
	rm -rf /usr/share/icons/Adwaita/

