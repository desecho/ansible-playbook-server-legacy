#!/bin/bash

apt-get install python-pip -y
# It's required to also install these packages for ansible installation (cryptography dependencies)
sudo apt-get install libffi-dev g++ libssl-dev -y
pip install ansible==2.3.2
