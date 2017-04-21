#!/bin/bash

if [[ $# -eq 0 ]] ; then
    echo "Enter project name"
    exit 0
fi

cd /opt/$1
uwsgi --honour-stdin uwsgi_debug.ini
