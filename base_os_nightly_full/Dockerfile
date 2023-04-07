FROM ghcr.io/inti-cmnb/base_os:latest_nightly
MAINTAINER Salvador E. Tropea <stropea@inti.gob.ar>
LABEL Description="Debian with all tools for KiBot (nightly)"
LABEL org.opencontainers.image.description "Debian with all tools for KiBot (nightly)"

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
	apt-get -y install curl && \
	apt-get -y install python3-coverage && \
	dl_deb.py set-soft/coveralls-python && \
	apt -y install --no-install-recommends ./*.deb && \
	rm *.deb && \
	apt-get -y install --no-install-recommends xz-utils wget && \
	wget https://mirrors.ocf.berkeley.edu/blender/release/Blender3.4/blender-3.4.1-linux-x64.tar.xz && \
	tar xvf blender-3.4.1-linux-x64.tar.xz --strip-components=1 -C /usr/bin/ && \
	rm blender-3.4.1-linux-x64.tar.xz && \
	apt-get -y remove wget xz-utils && \
	apt-get -y autoremove && \
	rm -rf /var/lib/apt/lists/* /var/cache/debconf/templates.dat-old /var/lib/dpkg/status-old
RUN     echo "Install plug-in deps: pillow and skia-python (pip, numpy, etc.)" && \
	curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py && \
	/usr/bin/3.4/python/bin/python3.10 get-pip.py && \
	/usr/bin/3.4/python/bin/python3.10 -m pip install numpy==1.23.1 && \
	/usr/bin/3.4/python/bin/python3.10 -m pip install pillow && \
	/usr/bin/3.4/python/bin/python3.10 -m pip install skia-python && \
	rm -rf get-pip.py && \
	rm -rf /root/.cache/pip/
