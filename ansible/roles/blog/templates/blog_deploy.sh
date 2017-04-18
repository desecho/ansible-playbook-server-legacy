#!/bin/bash

cd {{ home }}/blog
git checkout source
rake generate
rake deploy
{{ scripts_path }}/fastcommit.sh
