#!/bin/bash
set -o errexit
/usr/bin/novnc-server start
tail --pid $(</var/lock/one/.novnc.lock) -f /var/log/one/novnc.log
