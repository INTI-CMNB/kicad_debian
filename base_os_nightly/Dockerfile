FROM kicad/kicad:nightly
LABEL Maintainer="Salvador E. Tropea <stropea@inti.gob.ar>"
LABEL Description="Debian with basic tools for KiBot"
LABEL org.opencontainers.image.description="Debian with basic tools for KiBot"

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Etc/UTC
COPY dl_deb.py /usr/bin/
COPY debconf.conf /etc/
USER root
RUN     sed -i -e's/ main/ main contrib non-free/g' /etc/apt/sources.list.d/debian.sources  && \
	apt-get update  && \
	apt-get -y install --no-install-recommends git make rar bzip2 librsvg2-bin ghostscript && \
	apt-get -y install --no-install-recommends imagemagick python3-qrcodegen poppler-utils python3-requests python3-xlsxwriter python3-mistune && \
	echo "KiCost Digi-Key plugin dependencies"  && \
	apt -y install --no-install-recommends python3-certifi python3-dateutil python3-inflection python3-openssl python3-pkg-resources python3-requests python3-six python3-tldextract python3-urllib3 && \
	echo "KiCost dependencies"  && \
	apt -y install --no-install-recommends python3-bs4 python3-colorama python3-lxml python3-requests python3-tqdm python3-validators python3-wxgtk4.0 python3-yaml && \
	echo "KiKit dependencies"  && \
	apt -y install --no-install-recommends python3-click python3-commentjson python3-markdown2 python3-numpy openscad  && \
	echo "Nasty patch to support tightframe on KiKit panelization" && \
	apt -y install python3-pip  && \
	pip install --break-system-packages shapely && \
	apt -y remove python3-pip  && \
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
	echo "Fix pcbnew.py violation of user preference" && \
	sed -i '/warnings\.filterwarnings/d' /usr/lib/python3/dist-packages/pcbnew.py && \
	apt-get -y autoremove && \
	rm -rf /var/lib/apt/lists/* /var/lib/dpkg/status-old  && \
	rm -rf /usr/share/icons/Adwaita/

# RUN     apt-get update  && \
# 	apt-get -y install --no-install-recommends libnng1 && \
# 	apt-get -y autoremove && \
# 	rm -rf /var/lib/apt/lists/* /var/lib/dpkg/status-old
