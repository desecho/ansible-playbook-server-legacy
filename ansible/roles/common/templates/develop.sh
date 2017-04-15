#!/bin/bash

source /opt/$1/env/bin/activate
cd /opt/$1/project/src
./manage.py runserver 0.0.0.0:8000
