#!/bin/bash

info() { while IFS='' read -r line; do echo "$(date) - system - backup - $line" >> /root/errors.log; done; };
error() { while IFS='' read -r line; do echo "$(date) - system - backup - $line" >> /root/info.log; done; };

{{ scripts_path }}/backup.sh 1> >(info) 2> >(error)
