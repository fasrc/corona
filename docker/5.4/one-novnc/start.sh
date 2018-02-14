#!/bin/bash
set -o errexit

# Configure SSL
VNC_PROXY_SUPPORT_WSS=${VNC_PROXY_SUPPORT_WSS:-"no"}
VNC_PROXY_CERT=${VNC_PROXY_CERT:-"/etc/pki/tls/certs/novnc.cer"}
VNC_PROXY_KEY=${VNC_PROXY_KEY:-"/etc/pki/tls/private/novnc.key"}

sed -i "s%^:vnc_proxy_support_wss:.*$%:vnc_proxy_support_wss: ${VNC_PROXY_SUPPORT_WSS}%g" /etc/one/sunstone-server.conf
sed -i "s%^:vnc_proxy_cert:.*$%:vnc_proxy_cert: ${VNC_PROXY_CERT}%g" /etc/one/sunstone-server.conf
sed -i "s%^:vnc_proxy_key:.*$%:vnc_proxy_key: ${VNC_PROXY_KEY}%g" /etc/one/sunstone-server.conf

# Start supervisord
/usr/bin/supervisord

# Start supervisor programs
/usr/bin/supervisorctl start one-novnc

# Tail the logs to keep supervisor writing to stdout
tail -f /tmp/supervisord.log
