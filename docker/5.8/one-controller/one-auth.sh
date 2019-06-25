#!/bin/bash

if [ -f ~/.one/one_auth ]; then
  echo "Password for one admin already exists"
else
  ONE_PASSWORD=$(date +%s | sha256sum | base64 | head -c 32 ; echo)
  echo "oneadmin:$ONE_PASSWORD" > ~/.one/one_auth
  echo "The oneadmin password is $ONE_PASSWORD"
  chmod 600 ~/.one/one_auth
fi

if [ -f ~/.ssh/id_rsa ]; then
  echo "SSH RSA key already exists"
else
  ssh-keygen -t rsa -f ~/.ssh/id_rsa -N ''
  cat ~/.ssh/id_rsa.pub > ~/.ssh/authorized_keys
  chmod 700 ~/.ssh
  chmod 600 ~/.ssh/authorized_keys
fi
