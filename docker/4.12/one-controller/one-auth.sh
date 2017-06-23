#!/bin/bash

if [ -f ~/.one/one_auth ]; then
        echo "Password for one admin already exists"
    else
        ONE_PASSWORD=$(date +%s | sha256sum | base64 | head -c 32 ; echo)
        
        cat <<-EOT > ~/.one/one_auth
oneadmin:$ONE_PASSWORD
EOT
        echo "The oneadmin password is $ONE_PASSWORD"
        
        chmod 600 ~/.one/one_auth
fi

if [ -f ~/.ssh/id_dsa ]; then
        echo "DSA key already exists"
    else
        ssh-keygen -t dsa -f ~/.ssh/id_dsa -N ''
        
        cat ~/.ssh/id_dsa.pub > ~/.ssh/authorized_keys
        chmod 700 ~/.ssh
        chmod 600 ~/.ssh/authorized_keys
fi
