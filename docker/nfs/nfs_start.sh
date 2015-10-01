#!/bin/bash

exportfs -r
rpcbind
rpc.statd
rpc.nfsd
rpc.mountd $RPCMOUNTDOPTS --foreground