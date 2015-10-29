#!/bin/bash
set -o errexit

# Start supervisord
/usr/bin/supervisord

# Start supervisor programs
/usr/bin/supervisorctl start libvirtd

# Tail the logs to keep supervisor writing to stdout
tail -f /tmp/supervisord.log
