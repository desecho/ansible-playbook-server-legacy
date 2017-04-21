#!/bin/bash

if [[ $# -eq 0 ]] ; then
    echo "Enter project name"
    exit 0
fi

isort -rc {{ host_path }}/$1/src
"{{ pycharm_path }}/format.sh" -r -m "*.py" {{ host_path }}/$1
