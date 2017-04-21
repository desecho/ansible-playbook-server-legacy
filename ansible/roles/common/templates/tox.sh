#!/bin/bash

if [[ $# -eq 0 ]] ; then
    echo "Enter project name"
    exit 0
fi

export PYTHONPATH="/opt/$1" # we have our local_settings there.
export TOX_WORKDIR="/tmp/tox-$1"
tox -c "/opt/$1/project/tox.ini"
