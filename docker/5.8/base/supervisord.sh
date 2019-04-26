#!/bin/bash
set -o errexit

SUPERVISORD_ORDERED=${SUPERVISORD_ORDERED:-"no"}

if [ "${SUPERVISORD_ORDERED}" == "yes" ]; then
  /usr/bin/supervisord -n &
  while [ ! -S "/tmp/supervisor.sock" ]; do
    sleep 1
  done
  PROGRAMS=$(grep -Eh '^\[program:(.*)]$' /etc/supervisor.d/*.conf | sed -E 's/\[program:(.*)\]$/\1/')
  for prog in ${PROGRAMS}; do
    supervisorctl start "${prog}"
  done
  wait %1
else
  /usr/bin/supervisord -n
fi
