#!/bin/bash

if [ -f /var/lib/one/.one/one_auth ]; then
        echo "Password for one admin already exists"
    else
        ONE_PASSWORD=$(date +%s | sha256sum | base64 | head -c 32 ; echo)
        
        cat <<-EOT > /var/lib/one/.one/one_auth
oneadmin:$ONE_PASSWORD
EOT
        echo "The oneadmin password is $ONE_PASSWORD"
fi

if [ -f /var/lib/one/.ssh/id_dsa ]; then
        echo "DSA key already exists"
    else
        ssh-keygen -t dsa -f ~/.ssh/id_dsa -N ''
        
        cat id_dsa.pub > authorized_keys
fi
