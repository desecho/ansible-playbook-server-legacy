# ansible-playbook-custom
A Custom Ansible Playbook to setup a django/nginx/uwsgi/mysql server

How to use:
```
git clone https://github.com/desecho/ansible-playbook-server.git
cd ansible-playbook-server
ssh-keygen -t rsa -C desecho@gmail.com -N ''
sudo apt install ansible -y
./bootstrap.sh
sudo su
./provision.sh
```