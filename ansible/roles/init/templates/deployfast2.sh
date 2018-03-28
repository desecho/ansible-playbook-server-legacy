#!/bin/bash
set -e
if [[ $# -eq 0 ]] ; then
    echo "Enter project name"
    exit 0
fi

cd {{ home }}/$1

{% if is_prod -%}
git pull
{%- endif %}

yarn build
cd /opt/$1/project
./manage.py migrate
./manage.py collectstatic --noinput

{% if is_prod -%}
systemctl restart $1-wsgi
service nginx restart
{%- endif %}
