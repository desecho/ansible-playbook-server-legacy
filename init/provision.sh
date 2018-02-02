#!/bin/bash

set -eu

ANSIBLE_VERSION=2.3.2

apt-get install python-pip -y
# It's required to also install these packages for ansible installation (cryptography dependencies)
sudo apt-get install libffi-dev g++ libssl-dev -y
pip install ansible==$ANSIBLE_VERSION
