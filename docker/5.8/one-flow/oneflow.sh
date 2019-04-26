#!/bin/bash
set -o errexit

su oneadmin -c "/usr/bin/ruby /usr/lib/one/oneflow/oneflow-server.rb"
