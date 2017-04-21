#!/bin/bash

isort -rc {{ host_path }}/$1/src
"{{ pycharm_path }}/format.sh" -r -m "*.py" {{ host_path }}/$1
