#!/bin/bash

set -eu

if [ $1 = "init" ]; then
	if [ $DESKTOP = 1]; then
   		./provision.sh $1 desktop
    else
    	./provision.sh $1 dev
    fi
    exit 0
fi

if [ $1 = "blog" ]; then
    if [ $DESKTOP = 1]; then
        ./provision.sh $1 desktop
    else
        ./provision.sh $1 dev
    fi
    exit 0
fi

./provision.sh $1 dev
