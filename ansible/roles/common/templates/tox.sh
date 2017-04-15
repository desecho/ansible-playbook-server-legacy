#!/bin/bash

export PYTHONPATH="/opt/$1" # we have our local_settings there.
export TOX_WORKDIR="/tmp/tox-$1"
tox -c "/opt/$1/project/tox.ini"
