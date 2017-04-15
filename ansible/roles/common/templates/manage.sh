#!/bin/bash

source /opt/$1/env/bin/activate
cd /opt/$1/project/src
./manage.py $2 $3 $4 $5 $6 $7 $8 $9 $10
