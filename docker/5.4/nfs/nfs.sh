#!/bin/bash
set -o errexit

export SUPERVISORD_ORDERED="yes"

/usr/local/corona/bin/supervisord.sh
