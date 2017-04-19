#!/bin/bash

# It is supposed to break on error but it doesn't
# set -e

./provision.sh init $1
./provision.sh movies $1
./provision.sh blog $1
./provision.sh site $1
