#!/bin/bash

# Remove printer drivers
apt purge printer-driver-brlaser printer-driver-c2esp printer-driver-foo2zjs printer-driver-foo2zjs-common printer-driver-gutenprint printer-driver-hpcups printer-driver-min12xxw printer-driver-pnm2ppa printer-driver-postscript-hp printer-driver-ptouch printer-driver-pxljr printer-driver-sag-gdi printer-driver-splix -y
# Make sure to remove unnecessary packages
apt autoremove
cd /home/desecho
rm -rf Music Pictures Public Templates Videos
