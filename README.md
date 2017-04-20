# ansible-playbook-server

How to use:
```
ssh-keygen -t rsa -C desecho@gmail.com -N ''
cat ~/.ssh/id_rsa.pub
```
Add a key on the [github key settings page](https://github.com/settings/keys)

```
git clone https://github.com/desecho/ansible-playbook-server.git
cd ansible-playbook-server
sudo su
apt-get install pip
pip install ansible==2.3.0.0
./bootstrap.sh
```

Then run `./provisiondev.sh` or `./provisionprod.sh`