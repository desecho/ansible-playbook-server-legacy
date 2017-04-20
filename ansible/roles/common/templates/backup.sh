#!/bin/bash

{{ scripts_path }}/mysql_backup.sh
{{ scripts_path }}/google_drive_backup.sh
{{ scripts_path }}/reboot_if_needed.sh

curl --retry 3 https://hchk.io/0ef8e8d4-c51f-4746-a887-70c2fe891648
