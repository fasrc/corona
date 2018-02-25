#!/bin/bash
set -o errexit

su - oneadmin -c '/tmp/one-auth.sh'

# Clear stale ONE lock
rm -f /var/lock/one/one

# Start supervisord
/usr/bin/supervisord

# Start supervisor programs
/usr/bin/supervisorctl start opennebula
/usr/bin/supervisorctl start opennebula-scheduler

# Tail the logs to keep supervisor writing to stdout
tail -f /tmp/supervisord.log
