#!/bin/bash
set -e
if [[ $# -eq 0 ]] ; then
    echo "Enter project name"
    exit 0
fi

source /opt/$1/env/bin/activate
cd /opt/$1/project/src
./manage.py makemessages

if [ $1 = "movies" ]; then
   ./manage.py makemessages -d djangojs --ignore=moviesapp/static/bower/*
else
  ./manage.py makemessages -d djangojs
fi
