#!/bin/bash

set -eu

mkdir -p /tmp/nginx_confs
mv /etc/nginx/sites-enabled/* /tmp/nginx_confs
