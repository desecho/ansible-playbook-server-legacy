#!/bin/bash
set -e
if [[ $# -eq 0 ]] ; then
    echo "Enter project name"
    exit 0
fi

source /opt/$1/env/bin/activate
cd /opt/$1/project
./manage.py runserver 0.0.0.0:8000
