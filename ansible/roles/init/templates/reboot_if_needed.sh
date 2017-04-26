#!/bin/bash

if [ -f /var/run/reboot-required ]; then
  /sbin/reboot
fi
