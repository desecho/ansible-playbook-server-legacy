Setup and provision a development machine with ansible effortlessly.

It is based on [Ubuntu](https://www.ubuntu.com/download/desktop).

### Installation

Create a new VM. 
Install Ubuntu Desktop. Choose minimal installation. Use lvm. Enable auto-login.
In the configuration bar:
* Select Devices -> Insert Guest Additions CD image...
* Select Devices -> Shared clipboard -> Bidirectional

Open VM settings
* User Interface -> Uncheck Show in Full-screen/Seamless  
* Display -> Set Monitor count to 2
* Display -> Set Video Memory to 128MB
* Display -> Enable 3D Acceleration, Enable 2D Acceleration
* System -> Processor -> Select 4

```bash
sudo echo "desecho ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
sudo apt-get install gcc make perl gnome-tweak-tool ssh gnome-shell-extension-dash-to-panel git dconf-tools -y
```
Remove Help, Ubuntu software and Settings from the dock. Press [Alt + F2] and enter `restart`
Run Tweaks
* Disable animations
* Extensions -> Enable Dash to panel
Keyboard -> Typing -> Switch to next input source -> Ctrl + Space  
Run dconf-editor  
Head to org -> gnome -> desktop -> interface -> cursor-size -> Set to 10  

Install VS Code - https://linuxize.com/post/how-to-install-visual-studio-code-on-ubuntu-18-04/

### Provisioning

```bash
ssh-keygen -t rsa -C desecho@gmail.com -N ''
cat ~/.ssh/id_rsa.pub
```

Add key on the [github key settings page](https://github.com/settings/keys)

```bash
git clone git@github.com:desecho/ansible-playbook-server.git
cd ansible-playbook-server
sudo ./desktop/remove_stuff.sh
ssh-copy-id -i ~/.ssh/id_rsa.pub desecho@localhost
./init/provision.sh
ansible-playbook ansible/init_desktop0.yml
./bootstrap.sh
echo [password] > ~/.vault_pass.txt
./init/clone_dev.sh
./provision.sh init desktop
exit
provisionall
ssh-copy-id -i ~/.ssh/id_rsa.pub prod  # Set up connection with your production server
ssh-copy-id -i ~/.ssh/id_rsa.pub proxy  # Set up connection with your proxy server
```

Provisioning commands like `provision movies` should be run under root.

## VMWare Player

### Hotkeys
[Ctrl + Alt] - Stop capturing inputs.
[Ctrl + Alt + Enter] - Fullscreen toggle

### Installation
Install Ubuntu Desktop with VMware Player.
Create a VM with 8 Gb of RAM and a Hard drive of 120Gb.
Open VM settings. Select Options tab -> Power -> Enable "Enter full screen mode after powering on".
Edit `%APPDATA%\VMware\preferences.ini`
Make sure to have these settings:
```
pref.vmplayer.fullscreen.nobar = "TRUE"
pref.vmplayer.fullscreen.nobar = 1
```

To enable shared folders:
Manage -> Reinstall VMware tools.
```bash
sudo cp /media/cdrom/VMwareTools*.tar.gz /tmp
tar xvf VMwareTools*.tar.gz
cd vmware-tools-distrib
sudo ./vmware-install.pl
```
Shared folders will appear here: `/mnt/hgfs`


Each time you load the machine you will need to disable and enable back the fullscreen mode and then run Displays -> Enable 200% scaling.
