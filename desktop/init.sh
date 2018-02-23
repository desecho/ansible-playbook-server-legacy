#!/bin/bash
./remove_stuff.sh
apt install git
gsettings set org.gnome.shell.extensions.dash-to-dock scroll-action 'cycle-windows'
swapoff /swapfile
rm -rf /swapfile
