#!/bin/bash
set -e
if [[ $# -eq 0 ]] ; then
    echo "Enter project name"
    exit 0
fi

source /opt/$1/env/bin/activate
cd /opt/$1/project
./manage.py makemessages

if [ $1 = "movies" ]; then
   ./manage.py makemessages -d djangojs --ignore=moviesapp/static/* --ignore=node_modules/*
   exit 0
fi

if [ $1 = "ghcontrib" ]; then
   ./manage.py makemessages -d djangojs --ignore=ghcontrib/static/* --ignore=node_modules/*
   exit 0
fi

if [ $1 = "ighelper" ]; then
   ./manage.py makemessages -d djangojs --ignore=ighelper/static/* --ignore=node_modules/*
   exit 0
fi

./manage.py makemessages -d djangojs