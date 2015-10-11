#!/bin/bash

su - oneadmin -c '/tmp/one-auth.sh'
rm /tmp/one-auth.sh

/usr/bin/supervisord
