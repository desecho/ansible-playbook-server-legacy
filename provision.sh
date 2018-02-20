#!/bin/bash

set -eu

if [ $2 = "prod" ] && [ $1 != "init" ]; then
./scripts/moveout_nginx_configs.sh
ansible-playbook ansible/site_generic.yml --connection=local
fi

ansible-playbook ansible/$1_$2.yml --connection=local --vault-password-file ~/.vault_pass.txt

if [ $2 = "prod" ] && [ $1 != "init" ]; then
./scripts/movein_nginx_configs.sh
service nginx restart
fi
