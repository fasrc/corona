#!/bin/bash
set -o errexit

/usr/sbin/sshd-keygen

# Start supervisord
/usr/bin/supervisord

# Start supervisor programs
/usr/bin/supervisorctl start sshd

# Tail the logs to keep supervisor writing to stdout
tail -f /tmp/supervisord.log
