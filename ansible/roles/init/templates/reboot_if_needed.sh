#!/bin/bash

if [ -f /var/run/reboot-required ]; then
  reboot
fi
