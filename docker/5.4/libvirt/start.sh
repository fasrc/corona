#!/bin/bash
set -o errexit

KVM_DEVICE=${KVM_DEVICE:-"/dev/kvm"}
KVM_SANITY_CHECK=${KVM_SANITY_CHECK:-1}
KVM_SETUP=${KVM_SETUP:-1}

function enabled(){
  [ "${1}" == "1" ] && return 0 || return 1
}

function init_kvm() {
  if [ -c "${KVM_DEVICE}" ]; then
    if enabled "${KVM_SANITY_CHECK}"; then
      if [ -z $(find "${KVM_DEVICE}" -perm -g=r,g=w) ]; then
        echo "ERROR: /dev/kvm is not group readable/writable" >&2
        exit 1
      fi
    fi
    if enabled "${KVM_SETUP}"; then
      device_gid=$(stat -c "%g" ${KVM_DEVICE})
      kvm_gid=$(getent group kvm | awk -F: '{ print $3 }')
      if [ "$device_gid" != "$kvm_gid" ]; then
        echo "INFO: Updating KVM GID to match ${KVM_DEVICE} group (gid: ${device_gid}"
        groupmod -g $device_gid kvm
      fi
    fi
  fi
}

# Check KVM device status and setup KVM group
init_kvm

# Start supervisord
/usr/bin/supervisord

# Start supervisor programs
/usr/bin/supervisorctl start libvirtd

# Tail the logs to keep supervisor writing to stdout
tail -f /tmp/supervisord.log
