#!/bin/bash

cd ~
git clone git@github.com:desecho/movies.git
git clone git@github.com:desecho/ghcontrib.git
git clone git@github.com:desecho/words.git
git clone git@github.com:desecho/blog.git
cd blog
git submodule update
cd ..
git clone git@github.com:desecho/desecho.org.git
#git clone git@github.com:desecho/ighelper.git
