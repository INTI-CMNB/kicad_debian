#!/bin/sh
apt-get -y update
apt-get -y install --no-install-recommends kicad-nightly-packages3d
rm -rf /var/lib/apt/lists/*
