#!/bin/bash

set -eu

rsync -i /tmp/nginx_confs /etc/nginx/sites-enabled
rm -R /tmp/nginx_confs
