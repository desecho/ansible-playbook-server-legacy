#!/bin/bash

if [[ $# -eq 0 ]] ; then
    echo "Enter project name"
    exit 0
fi

source {{ home }}/$1/env/bin/activate
cd /opt/$1/project/src
./manage.py runserver 0.0.0.0:8000
