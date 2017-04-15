#!/bin/bash

systemctl restart $1-wsgi
service nginx restart
