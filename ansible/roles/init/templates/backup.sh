#!/bin/bash

{{ scripts_path }}/mysql_backup.sh
{{ scripts_path }}/google_drive_backup.sh
{{ scripts_path }}/reboot_if_needed.sh

curl --retry 3 {{ track_code_backup }}
