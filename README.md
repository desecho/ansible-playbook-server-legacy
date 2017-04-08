# ansible-playbook-server
A Custom Ansible Playbook to setup a django/nginx/uwsgi/mysql server

How to use:
```
ssh-keygen -t rsa -C desecho@gmail.com -N ''
cat ~/.ssh/id_rsa.pub
```
Add a key on the [github key settings page](https://github.com/settings/keys)

```
git clone https://github.com/desecho/ansible-playbook-server.git
cd ansible-playbook-server
sudo apt install ansible -y
./bootstrap.sh
sudo su
./provision.sh
```
