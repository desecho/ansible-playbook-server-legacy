#!/bin/bash

if [[ $# -eq 0 ]] ; then
    echo "Enter project name"
    exit 0
fi

yesterday=`date -d "yesterday" '+%d-%m-%Y'`
scp "do:/var/backups/$yesterday/$1.$yesterday.sql.gz" /tmp/dump.sql.gz
gunzip -c /tmp/dump.sql.gz | /opt/$1/restoredb.sh
