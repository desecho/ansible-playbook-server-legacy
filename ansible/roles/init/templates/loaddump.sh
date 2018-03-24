#!/bin/bash
set -e
if [[ $# -eq 0 ]] ; then
    echo "Enter project name"
    exit 0
fi

yesterday=`date -d "yesterday" '+%d-%m-%Y'`

{% if is_dev -%}
scp "prod:/var/backups/$yesterday/$1.$yesterday.sql.gz" /tmp/dump.sql.gz
gunzip -c /tmp/dump.sql.gz | /opt/$1/restoredb.sh
{%- endif %}

{% if is_prod -%}
gunzip -c /var/backups/$yesterday/$1.$yesterday.sql.gz | /opt/$1/restoredb.sh
{%- endif %}
