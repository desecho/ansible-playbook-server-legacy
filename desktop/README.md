Setup and provision a development machine with ansible effortlessly.

It is based on [Ubuntu](https://www.ubuntu.com/) 17.10.

## Vagrant

It uses Vagrant for packaging.

### Installation
Run cmd as administrator.

```bash
vagrant plugin install vagrant-disksize
```

Format your harddrive with Gparted in ext4 and lvm2.
Install Ubuntu 17.10 Desktop.
```bash
sudo apt-get install gcc make perl gnome-tweak-tool
```
Install Guest Additions.
Remove amazon and help from the dock.
Find and install Hide Top Bar
Run Tweaks -> Disable animations.
Make sure to switch to X.org when logging in.

```bash
sudo ./desktop/remove_stuff.sh
```
### Packaging

```bash
vagrant package --output ubuntu.box
```

### Initial Provisioning

```bash
sudo ansible-playbook ansible/init_desktop0.yml
```


## VMWare Player

### Hotkeys
[Ctrl + Alt] - Stop capturing inputs.
[Ctrl + Alt + Enter] - Fullscreen toggle

### Installation
Install Ubuntu 17.10 Desktop with VMware Player.
Create a VM with 8 Gb of RAM and a Hard drive of 120Gb.
Open VM settings. Select Options tab -> Power -> Enable "Enter full screen mode after powering on".
Edit `%APPDATA%\VMware\preferences.ini`
Make sure to have these settings:
```
pref.vmplayer.fullscreen.nobar = "TRUE"
pref.vmplayer.fullscreen.nobar = 1
```
Remove amazon and help from the dock.
Find and install Hide Top Bar
Region & Language -> Input Sources -> Add Russian
Keyboard -> Typing -> Switch to next input source -> Ctrl + Space


To enable shared folders:
Manage -> Reinstall VMware tools.
```bash
sudo cp /media/cdrom/VMwareTools*.tar.gz /tmp
tar xvf VMwareTools*.tar.gz
cd vmware-tools-distrib
sudo ./vmware-install.pl
```
Shared folders will appear here: `/mnt/hgfs`

```bash
ssh-keygen -t rsa -C desecho@gmail.com -N ''
cat ~/.ssh/id_rsa.pub
```

Add key on the [github key settings page](https://github.com/settings/keys)

### Provisioning
```bash
sudo ./desktop/init.sh
git clone git@github.com:desecho/ansible-playbook-server.git
cd ansible-playbook-server
ssh-copy-id -i ~/.ssh/id_rsa.pub vagrant@localhost
./init/provision.sh
ansible-playbook ansible/init_desktop0.yml
./bootstrap.sh
echo [password] > ~/.vault_pass.txt
./init/clone_dev.sh
./provision.sh init desktop
exit
```
Make sure `/etc/fstab` has only one swap record

```bash
provisionall
ssh-copy-id -i ~/.ssh/id_rsa.pub prod  # Set up connection with your production server
```

Provisioning commands like  `provision movies` should be run under root.

Each time you load the machine you will need to disable and enable back the fullscreen mode and then run Displays -> Enable 200% scaling.
