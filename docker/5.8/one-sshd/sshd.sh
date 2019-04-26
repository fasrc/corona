#!/bin/bash
set -o errexit

/usr/sbin/sshd-keygen

/usr/sbin/sshd -D
