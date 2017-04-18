#!/bin/bash

isort -rc $1/src
{{ pycharm_path }}/format.sh -r -m '*.py' {{ host_path }}/$1
