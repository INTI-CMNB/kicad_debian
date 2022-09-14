#!/bin/sh
apt-get -y update
apt-get -y install -t bullseye-backports --no-install-recommends kicad-packages3d
rm -rf /var/lib/apt/lists/*
