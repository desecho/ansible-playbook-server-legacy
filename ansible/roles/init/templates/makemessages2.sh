#!/bin/bash
set -e
if [[ $# -eq 0 ]] ; then
    echo "Enter project name"
    exit 0
fi

source /opt/$1/env/bin/activate
cd /opt/$1/project
./manage.py makemessages

if [ $1 = "movies" ] || [ $1 = "ghcontrib" ] || [ $1 = "ighelper" ] || [ $1 = "words" ]; then
   ./manage.py makemessages -d djangojs --ignore=$1app/static/* --ignore=node_modules/*
   exit 0
fi

./manage.py makemessages -d djangojs
