TG1=`docker run --rm ghcr.io/inti-cmnb/kicad_debian:nightly kicad_version.py`
# TG2=`docker run --rm ghcr.io/inti-cmnb/kicad_debian:nightly /bin/bash -c "grep DISTRIB_CODENAME /etc/lsb-release | sed  s/DISTRIB_CODENAME=//" | tr -d '\n'`
TG2=d`docker run --rm ghcr.io/inti-cmnb/kicad_debian:nightly cat /etc/debian_version | tr -d '\n'`
