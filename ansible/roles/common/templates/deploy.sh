#!/bin/bash

cd $1
git pull
bower install --allow-root
source /opt/$1/env/bin/activate
pip install -r requirements.txt
cd /opt/$1/project/src
./manage.py migrate
./manage.py collectstatic --noinput
{% if is_prod -%}
systemctl restart $1-wsgi
service nginx restart
{%- endif %}