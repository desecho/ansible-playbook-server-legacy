#!/bin/bash

set -eu

git pull
git submodule init
git submodule update
