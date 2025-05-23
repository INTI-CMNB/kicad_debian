FROM ghcr.io/inti-cmnb/base_os:latest
LABEL MAINTAINER="Salvador E. Tropea <stropea@inti.gob.ar>"
LABEL Description="Debian with all tools for KiBot"
LABEL org.opencontainers.image.description "Debian with all tools for KiBot"

RUN     apt-get update  && \
	apt-get -y install --no-install-recommends flake8    \
	                                           python3-pytest python3-pytest-xdist \
	                                           python3-pip python3-wheel python3-setuptools \
	                                           python3-markdown2 \
	                                           diffutils openssh-client \
	                                           x11-utils fluxbox x11vnc wmctrl \
	                                           unzip \
	                                           zbar-tools \
	                                           procps \
	                                           fonts-dejavu \
	                                           xlsx2csv gnome-themes-extra-data && \
	echo "PanDoc w/LaTeX"  && \
	apt-get -y install pandoc texlive-latex-base texlive-latex-recommended && \
	echo "ODBC support (for KiCad 7+) and GIT LFS" && \
	apt-get -y install libodbc1 libsqliteodbc git-lfs && \
	echo "Install Coveralls helpers (KiBot coverage)" && \
	apt-get -y install curl python3-coverage && \
	dl_deb.py set-soft/coveralls-python && \
	apt-get -y install --no-install-recommends ./*.deb && \
	rm *.deb && \
	apt-get -y autoremove && \
	rm -rf /var/lib/apt/lists/* /var/cache/debconf/templates.dat-old /var/lib/dpkg/status-old

RUN	echo "Install Blender" && \
	apt-get update  && \
	apt-get -y install --no-install-recommends xz-utils wget && \
	wget https://mirrors.ocf.berkeley.edu/blender/release/Blender4.2/blender-4.2.4-linux-x64.tar.xz && \
	tar xvf blender-4.2.4-linux-x64.tar.xz --strip-components=1 -C /usr/bin/ && \
	rm blender-4.2.4-linux-x64.tar.xz && \
	apt-get -y remove xz-utils wget && \
	apt-get -y autoremove && \
	rm -rf /var/lib/apt/lists/* /var/cache/debconf/templates.dat-old /var/lib/dpkg/status-old

# This should be solved in 4.2.4 https://projects.blender.org/blender/blender/issues/130024
# RUN	echo "Install blender plug-in deps: pillow and skia-python (pip, numpy, etc.)" && \
# 	curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py && \
# 	/usr/bin/4.2/python/bin/python3.11 get-pip.py && \
# 	/usr/bin/4.2/python/bin/python3.11 -m pip install --break-system-packages numpy && \
# 	/usr/bin/4.2/python/bin/python3.11 -m pip install --break-system-packages pillow && \
# 	/usr/bin/4.2/python/bin/python3.11 -m pip install --break-system-packages skia-python && \
# 	/usr/bin/4.2/python/bin/python3.11 -m pip install --break-system-packages git+https://github.com/30350n/error_helper.git@1.1 && \
# 	rm -rf get-pip.py && \
# 	rm -rf /root/.cache/pip/

RUN	echo "Install blender plug-in" && \
	blender --online-mode --command extension sync && \
	blender --online-mode --command extension install --enable pcb3d_importer && \
	mv /root/.config/blender/4.2/extensions/blender_org/pcb3d_importer /bin/4.2/extensions/system/
#	# 2.17 isn't compatible with 2.16, so downgrade it && \
#	cd /bin/4.2/extensions/system/pcb3d_importer/ && \
#	curl -L https://github.com/30350n/pcb2blender/releases/download/v2.16-k8.0-b4.2lts/pcb2blender_importer_v2-16_b4-2lts.zip -o importer.zip && \
#	unzip -o importer.zip && \
#	rm importer.zip
#	sed '/^wheels =/d' /root/.config/blender/4.2/extensions/blender_org/pcb3d_importer/blender_manifest.toml  && \
#	rm -rf /root/.config/blender/4.2/extensions/blender_org/pcb3d_importer/wheels/
