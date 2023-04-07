FROM ubuntu:kinetic
MAINTAINER Salvador E. Tropea <stropea@inti.gob.ar>
LABEL Description="Ubuntu Kinetic with basic tools for KiBot"
LABEL org.opencontainers.image.description "Ubuntu Kinetic with basic tools for KiBot"

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Etc/UTC
COPY dl_deb.py /usr/bin/
RUN     apt-get update  && \
	apt-get -y install --no-install-recommends git && \
	apt-get -y install --no-install-recommends make rar bzip2 librsvg2-bin ghostscript && \
	apt-get -y install --no-install-recommends imagemagick python3-qrcodegen poppler-utils python3-requests python3-xlsxwriter && \
	echo "KiCad 7.99 needs backported python3-wxgtk4.0"
	apt-get -y install --no-install-recommends -t kinetic-backports python3-wxgtk4.0  && \
	echo "KiCost Digi-Key plugin dependencies"  && \
	apt -y install --no-install-recommends python3-certifi python3-dateutil python3-inflection python3-openssl python3-pkg-resources python3-requests python3-six python3-tldextract python3-urllib3 && \
	echo "KiCost dependencies"  && \
	apt -y install --no-install-recommends python3-bs4 python3-colorama python3-lxml python3-requests python3-tqdm python3-validators python3-yaml && \
	echo "KiKit dependencies"  && \
	apt -y install --no-install-recommends python3-click python3-commentjson python3-markdown2 python3-numpy python3-shapely openscad  && \
	echo "KiAuto dependencies"  && \
	apt -y install --no-install-recommends python3-psutil python3-xvfbwrapper recordmydesktop xdotool xsltproc xclip  && \
	echo "KiDiff dependencies"  && \
	apt -y install --no-install-recommends xdg-utils  && \
	sed -i 's/<policy domain="coder" rights="none" pattern="PDF" \/>/<!-- <policy domain="coder" rights="none" pattern="PDF" \/> -->/g' /etc/ImageMagick-6/policy.xml && \
	sed -i 's/<policy domain="coder" rights="none" pattern="PS" \/>/<!-- <policy domain="coder" rights="none" pattern="PS" \/> -->/g' /etc/ImageMagick-6/policy.xml && \
	echo "Needed for GitHub, seen on git 2.39.1"  && \
	echo "[safe]" >> /etc/gitconfig && \
	echo "	directory = *" >> /etc/gitconfig && \
	echo '[protocol "file"]' >> /etc/gitconfig && \
	echo '	allow = always' >> /etc/gitconfig && \
	apt-get -y autoremove && \
	rm -rf /var/lib/apt/lists/* /var/lib/dpkg/status-old  && \
	rm -rf /usr/share/icons/Adwaita/

