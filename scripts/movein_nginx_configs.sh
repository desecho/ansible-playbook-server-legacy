#!/bin/bash

cp /tmp/nginx_confs/* -n /etc/nginx/sites-enabled
rm -R /tmp/nginx_confs
