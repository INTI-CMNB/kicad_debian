FROM debian:bullseye-slim
MAINTAINER Salvador E. Tropea <stropea@inti.gob.ar>
LABEL Description="Minimal KiCad image based on Debian (nightly)"

COPY *.list /
RUN	apt-get -y update && \
	apt-get -y install --no-install-recommends ca-certificates && \
	/usr/lib/apt/apt-helper download-file https://debian.sur5r.net/kicad-nightly/pool/main/s/sur5r-keyring/sur5r-keyring_2021.02.02_all.deb sur5r-keyring.deb SHA256:cccfb1dd7d6b1b6a137bb96ea5b5eef18a0a4a6df1d6c0c37832025d2edaa710 && \
	dpkg -i ./sur5r-keyring.deb && \
	mv /*.list /etc/apt/sources.list.d/ && \
	apt-get -y update && \
	apt-get -y install --no-install-recommends libngspice0 kicad kicad-libraries kicad-nightly kicad-nightly-symbols kicad-nightly-footprints && \
	apt-get -y autoremove && \
	rm -rf /var/lib/apt/lists/* /*.deb && \
	rm -rf /usr/share/icons/Adwaita/
COPY *-lib-table /usr/share/kicad-nightly/template/