Setup and provision a development machine with ansible effortlessly.

It is based on [Ubuntu](https://www.ubuntu.com/) 17.10. It uses Vagrant for packaging.

## Installation
Run cmd as administrator.

```
vagrant plugin install vagrant-disksize
```

Format your harddrive with Gparted in ext4 and lvm2.
Install Ubuntu 17.10 Desktop.
```
sudo apt-get install gcc make perl
```
Install Guest Additions.
Remove amazon from the dock.
Find and install Hide Top Bar

```
# Remove libreoffice
sudo apt purge libreoffice-avmedia-backend-gstreamer libreoffice-base-core libreoffice-calc libreoffice-common libreoffice-core libreoffice-draw libreoffice-gnome libreoffice-gtk libreoffice-help-en-us libreoffice-impress libreoffice-math libreoffice-ogltrans libreoffice-pdfimport libreoffice-style-breeze libreoffice-style-galaxy libreoffice-writer -y
# Remove thunderbird
sudo apt purge thunderbird thunderbird-gnome-support thunderbird-locale-en thunderbird-locale-en-us  -y
# Remove printer drivers
sudo apt purge printer-driver-brlaser printer-driver-c2esp printer-driver-foo2zjs printer-driver-foo2zjs-common printer-driver-gutenprint printer-driver-hpcups printer-driver-min12xxw printer-driver-pnm2ppa printer-driver-postscript-hp printer-driver-ptouch printer-driver-pxljr printer-driver-sag-gdi printer-driver-splix -y
# Remove games
sudo apt purge gnome-mahjongg gnome-mines gnome-sudoku -y
# Remove unnecessary packages
sudo apt purge transmission-gtk rhythmbox brltty cups cups-bsd cups-client cups-filters cheese eog evince gnome-calendar gnome-orca hplip nautilus-sendto nautilus-share remmina shotwell simple-scan speech-dispatcher totem vino foomatic-db-compressed-ppds doc-base -y
# Make sure to remove unnecessary packages
sudo apt autoremove
cd ~
rm -rf Desktop Documents examples.desktop Music Pictures Public Templates Videos
```

## Packaging

```
vagrant package --output ubuntu.box
```

## Initial Provisioning

```
sudo ansible-playbook ansible/init_desktop0.yml
```