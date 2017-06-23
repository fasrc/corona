#!/bin/bash
set -o errexit

# Start supervisord
/usr/bin/supervisord

# Start supervisor programs
/usr/bin/supervisorctl start exportfs
/usr/bin/supervisorctl start rpcbind
/usr/bin/supervisorctl start rpc.statd
/usr/bin/supervisorctl start rpc.nfsd
/usr/bin/supervisorctl start rpc.mountd

# Tail the logs to keep supervisor writing to stdout
tail -f /tmp/supervisord.log
