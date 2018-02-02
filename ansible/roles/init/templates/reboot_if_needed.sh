#!/bin/bash
set -e
if [ -f /var/run/reboot-required ]; then
  /sbin/reboot
fi
