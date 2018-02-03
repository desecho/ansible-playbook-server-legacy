ansible-playbook-server
==================
*Setup and provision a server and a development machine with ansible effortlessly.*

It sets up the following:
* [nginx][nginx]
* [uWSGI][uWSGI]
* [MySQL][MySQL]
* [Django][Django]

Along with:
* SSL serificates provided by [Let’s Encrypt][Let’s Encrypt]
* [Fail2ban][Fail2ban]

It's meant to work in production and development environments (in the VM).
It also provides a certain set of useful aliases.

It uses [ansible-vault][ansible-vault] to manage secrets.
It uses [Grive][Grive] and [Google Drive][Google Drive] for backup storage.
It installs htop and iftop to monitor through CLI.

**Warning**: It suits my particular needs but might not be suitable for others. It is not perfect and it is not meant to be. It's also currently set up in a way that is not the most secure thing one might come up with. See "Drawbacks" below for details.

It is currently used to provision the following projects:
* [Movies][Movies]
* [IT Blog][IT Blog]
* [desecho.org][desecho.org]
* [GitHub Contrib][Githubcontrib]
* pyfavorite

Requirements
------------
* [Ansible][Ansible] 2.3.0.0
* [Ubuntu][Ubuntu] 16.04


Details
------------
It has an initial provisioning which is run before everything else which is responsible for the base of the server. Then it has separate provisioning for each project.

It installs [ipdb][ipdb], [bower][bower], [git][git], [pip][pip], [tox][tox], [isort][isort], [npm][npm] globally. [Ntp][Ntp] is enabled. Locale is set to en_US.UTF-8.
The backups are being run every day. The logs are in `/root/logs`.
Security packages are being updated constantly automatically and if restart is required it is done right after the backup script is finished.

Installation
------------

Development
--------------
Install [Vagrant][Vagrant] and [VirtualBox][VirtualBox].

```bash
mkdir vm
git clone git@github.com:desecho/ansible-playbook-server.git
cp ansible-playbook-server/Vagrantfile .
vagrant plugin install vagrant-vbguest
vagrant up
vagrant ssh
sudo su
ssh-keygen -t rsa -C desecho@gmail.com -N ''
cat ~/.ssh/id_rsa.pub
# Add a key on the [github key settings page](https://github.com/settings/keys)
```

You need to make changes to [common.yml][common.yml] before you start.

```bash
cd /vagrant/ansible-playbook-server
./init/provision.sh
./bootstrap.sh
./init/init_password.sh password  # password for ansible-vault
./provision.sh init dev
exit
exit
vagrant ssh
provisionall
ssh-copy-id -i ~/.ssh/id_rsa.pub prod  # Set up connection with your production server
?
```
Copy aliases to your hosts `~/.bash_aliases` file (until the line).

Install [Octopress][Octopress]. The process is described [here](https://blog.desecho.org).

Production
--------------

```bash
ssh-keygen -t rsa -C desecho@gmail.com -N ''
cat ~/.ssh/id_rsa.pub
```

Add a key on the [github key settings page](https://github.com/settings/keys)

```bash
git clone git@github.com:desecho/ansible-playbook-server.git
cd /root/ansible-playbook-server
apt-get update
./init/provision.sh
./bootstrap.sh
./init/init_password.sh password  # Password for ansible-vault
./provision.sh init prod  # You might need to run it twice in case of an error
exit
```

Reconnect to the server

```bash
provisionall
```

Install [Grive][Grive]. The process is described [here](https://blog.desecho.org/?#toc_516).

Usage
------------
```bash
# Full provisioning of each service
provision init
provision movies
provision site
provision blog
provision ghcontrib
```
# Provision all services at once
```bash
provisionall
```
Commands
------------
Here is a short list of available aliases. For the full list, run `?`.

### Django
Can be run only from the "home" directory: (it is in fact `/root` for root and `/home/ubuntu` for ubuntu but we make it really cozy inside `/vagrant`)

```bash
. workon movies
manage migrate
```

Aliases to be run from anywhere.

```bash
develop movies  # Start development server
deploy movies  # Light version of provisioning. (if there are no changes to the ansible playbook related to the project)
tox movies
makemessages movies
```

### Blog

```bash
blogdeploy
blogpost
blogpreview
```


### Site

```bash
sitedeploy
```

Playbooks used
------------
* [ansible-nginx][ansible-nginx]
* [ansible-role-fail2ban][ansible-role-fail2ban]
* [ansible-django][ansible-django]
* [ansible-swapfile][ansible-swapfile]
* [ansible-role-mysql][ansible-role-mysql]
* [acme-nginx][acme-nginx]
* [ansible-role-nodejs][ansible-role-nodejs]


Still not automated
------------
* Octopress installation
* Grive installation
* It does not set up connection to your production server
* It does not create the ssh key


Drawbacks
------------
* It only uses root user to simplify things. Note: there is still ubuntu user in the VM but it is currently there only because I didn't find a way to get rid of it
* No real CI/CD
* Deployment happens manualy. It is easy to do but you still have to connect directly to the server and run commands
* Questionable backup solution
* There are a few issues which have not been resolved for the moment
    * `provisionall` command does not stop on error so you need to visually make sure there are no red lines on the screen
    * Ansible event statuses shows change in places it shouldn't do so sometimes
    * It restarts nginx multiple times while provisioning
    * You have to run initial `provision init` command 2 times to make it work.
    * It is not optimized.

[Movies]: https://github.com/desecho/movies
[Let’s Encrypt]: https://letsencrypt.org/
[ansible-nginx]: https://github.com/savoirfairelinux/ansible-nginx
[Django]: https://www.djangoproject.com/
[IT Blog]: https://blog.desecho.org/
[desecho.org]: https://desecho.org
[uWSGI]: https://github.com/unbit/uwsgi
[nginx]: https://www.nginx.com/resources/wiki/
[ansible-vault]: https://github.com/jptomo/ansible-vault
[common.yml]: https://github.com/desecho/ansible-playbook-server/blob/master/ansible/vars/common.yml
[acme-nginx]: https://github.com/hsoft/ansible-acme-nginx
[ansible-swapfile]: https://github.com/kamaln7/ansible-swapfile
[ansible-django]: https://github.com/desecho/ansible-django
[ansible-role-fail2ban]: https://github.com/infOpen/ansible-role-fail2ban
[ansible-role-mysql]: https://github.com/geerlingguy/ansible-role-mysql
[Fail2ban]: https://www.fail2ban.org/
[MySQL]: https://www.mysql.com/
[Octopress]: http://octopress.org
[Grive]: https://github.com/Grive/grive
[Google Drive]: https://drive.google.com
[ansible-role-nodejs]: https://github.com/geerlingguy/ansible-role-nodejs
[ipdb]: https://github.com/gotcha/ipdb
[bower]: https://bower.io/
[git]: https://git-scm.com/
[pip]: https://github.com/pypa/pip
[tox]: https://github.com/tox-dev/tox
[isort]: https://github.com/timothycrosley/isort
[npm]: https://www.npmjs.com/
[Ntp]: http://support.ntp.org/bin/view/Main/WebHome
[VirtualBox]: https://www.virtualbox.org/
[Vagrant]: https://www.vagrantup.com/
[Githubcontrib]: https://github.com/desecho/ghcontrib
[Ansible]: https://www.ansible.com/
[Ubuntu]: https://www.ubuntu.com/
