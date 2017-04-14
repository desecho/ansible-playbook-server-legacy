#!/bin/bash

./scripts/moveout_nginx_configs.sh
ansible-playbook ansible/$1.yml --connection=local --vault-password-file ~/.vault_pass.txt
./scripts/movein_nginx_configs.sh
service nginx restart
