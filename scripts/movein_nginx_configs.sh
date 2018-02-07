#!/bin/bash

set -eu

rsync -r /tmp/nginx_confs/* /etc/nginx/sites-enabled
rm -R /tmp/nginx_confs
