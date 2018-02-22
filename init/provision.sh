#!/bin/bash

set -eu

ANSIBLE_VERSION=2.4.3

apt-get install python-pip -y
# It's required to also install these packages for ansible installation (cryptography dependencies)
sudo apt-get install libffi-dev g++ libssl-dev -y
LC_ALL=C
pip install ansible==$ANSIBLE_VERSION
mkdir /etc/ansible
echo localhost > /etc/ansible/hosts