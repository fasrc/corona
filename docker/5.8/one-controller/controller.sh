#!/bin/bash
set -o errexit

su - oneadmin -c '/usr/local/corona/bin/one-auth.sh'

# Clear any stale ONE lock
rm -f /var/lock/one/one

export SUPERVISORD_ORDERED="yes"

/usr/local/corona/bin/supervisord.sh
