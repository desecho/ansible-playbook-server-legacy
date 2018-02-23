#!/bin/bash

cd {{ home }}/blog
git checkout master
hugo -s .
{{ scripts_path }}/fastcommit.sh
rsync -avz --delete public/ prod:/opt/blog/