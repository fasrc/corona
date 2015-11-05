#!/bin/bash
set -o errexit

# Start supervisord
/usr/bin/supervisord

# Tail the logs to keep supervisor writing to stdout
tail -f /tmp/supervisord.log
