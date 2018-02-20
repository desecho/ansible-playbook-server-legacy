#!/bin/bash

set -eu

if [ $DESKTOP = 1 ]; then
    ./provision.sh $1 desktop
else
    ./provision.sh $1 dev
fi
