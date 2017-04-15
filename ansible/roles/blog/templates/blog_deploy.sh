#!/bin/bash

cd {{ home }}/blog
git checkout source
rake generate
rake deploy
git add .
git commit -m'changes'
git push
