FROM debian:bullseye-slim
MAINTAINER Salvador E. Tropea <stropea@inti.gob.ar>
LABEL Description="Debian 11 with tools for KiBot"

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Etc/UTC
COPY dl_deb.py /usr/bin/
COPY debconf.conf /etc/
RUN     sed -i -e's/ main/ main contrib non-free/g' /etc/apt/sources.list  && \
	echo "deb http://deb.debian.org/debian bullseye-backports main" >> /etc/apt/sources.list && \
	apt-get update  && \
	apt-get -y install --no-install-recommends -t bullseye-backports git && \
	apt-get -y install make rar bzip2 librsvg2-bin ghostscript && \
	apt-get -y install --no-install-recommends imagemagick python3-qrcodegen poppler-utils python3-requests && \
	sed -i 's/<policy domain="coder" rights="none" pattern="PDF" \/>/<!-- <policy domain="coder" rights="none" pattern="PDF" \/> -->/g' /etc/ImageMagick-6/policy.xml && \
	sed -i 's/<policy domain="coder" rights="none" pattern="PS" \/>/<!-- <policy domain="coder" rights="none" pattern="PS" \/> -->/g' /etc/ImageMagick-6/policy.xml && \
	echo "Needed for GitHub, seen on git 2.39.1"  && \
	echo "[safe]" >> /etc/gitconfig && \
	echo "	directory = *" >> /etc/gitconfig && \
	echo '[protocol "file"]' >> /etc/gitconfig && \
	echo '	allow = always' >> /etc/gitconfig && \
	apt-get -y autoremove && \
	rm -rf /var/lib/apt/lists/* /var/lib/dpkg/status-old

