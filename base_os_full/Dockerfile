FROM ghcr.io/inti-cmnb/base_os:latest
MAINTAINER Salvador E. Tropea <stropea@inti.gob.ar>
LABEL Description="Debian with all tools for KiBot"
LABEL org.opencontainers.image.description "Debian with all tools for KiBot"

RUN     apt-get update  && \
	apt-get -y install --no-install-recommends flake8    \
	                                           python3-pytest python3-pytest-xdist \
	                                           python3-pip python3-wheel python3-setuptools \
	                                           python3-markdown2 \
	                                           diffutils \
	                                           x11-utils fluxbox x11vnc wmctrl \
	                                           unzip \
	                                           zbar-tools \
	                                           procps \
	                                           fonts-dejavu \
	                                           xlsx2csv && \
	echo "Pull xdg-utils, but without recommendations" && \
	apt-get -y install --no-install-recommends xdg-utils libxkbcommon0 && \
	apt-get -y install pandoc texlive-latex-base texlive-latex-recommended && \
	apt-get -y install curl python3-coverage && \
	dl_deb.py set-soft/coveralls-python && \
	apt-get -y install --no-install-recommends ./*.deb && \
	rm *.deb && \
	apt-get -y install --no-install-recommends wget git-lfs blender && \
	apt-get -y install odbcinst libodbc1 libsqliteodbc && \
	echo "Install plug-in deps: pillow and skia-python (pip, numpy, etc.)" && \
	apt-get -y install --no-install-recommends python3-pil python3-pybind11 && \
	python3 -m pip install --break-system-packages skia-python && \
	apt-get -y autoremove && \
	rm -rf /var/lib/apt/lists/* /var/cache/debconf/templates.dat-old /var/lib/dpkg/status-old && \
	rm -rf /root/.cache/pip/
