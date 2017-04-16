#!/bin/bash

cd /opt/$1
uwsgi --honour-stdin uwsgi_debug.ini
