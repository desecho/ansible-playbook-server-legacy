#!/bin/bash

set -eu

if [ $1 = "init" ]; then
	if [ -n "$DESKTOP" ]; then
   		./provision.sh $1 desktop
    else 
    	./provision.sh $1 dev
    fi
else
  ./provision.sh $1 dev
fi
