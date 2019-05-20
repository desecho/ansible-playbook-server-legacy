#!/bin/bash
set -eu

{{ scripts_path }}/mysql_backup.sh
{{ scripts_path }}/reboot_if_needed.sh
