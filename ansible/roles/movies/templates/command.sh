#!/bin/bash

info() { while IFS='' read -r line; do echo "$(date) - {{ django_name }} - {{ command }} - $line" >> {{ logs_path }}/errors.log; done; };
error() { while IFS='' read -r line; do echo "$(date) - {{ django_name }} - {{ command }} - $line" >> {{ logs_path }}/info.log; done; };

{{ python }} {{ manage }} {{ command }} 1> >(info) 2> >(error)
