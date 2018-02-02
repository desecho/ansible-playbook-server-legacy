#!/bin/bash

set -e

if [[ $# -eq 0 ]] ; then
    echo "Enter project name"
    exit 0
fi

systemctl restart $1-wsgi
service nginx restart
