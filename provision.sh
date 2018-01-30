#!/bin/bash

if [ $2 = "prod" ]; then
./scripts/moveout_nginx_configs.sh
ansible-playbook ansible/site_generic.yml --connection=local -i inventory
rm /etc/nginx/sites-enabled/*
fi

ansible-playbook ansible/$1_$2.yml --connection=local --vault-password-file ~/.vault_pass.txt -i inventory

if [ $2 = "prod" ]; then
./scripts/movein_nginx_configs.sh
service nginx restart
fi
