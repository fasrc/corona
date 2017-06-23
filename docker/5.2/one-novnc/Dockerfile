FROM fasrc/corona-sunstone:5.2
MAINTAINER "Harvard University FAS Research Computing" <rchelp@fas.harvard.edu>

LABEL Description="OneFlow image for CORONA"

COPY corona-novnc-start.sh /usr/bin/corona-novnc-start
COPY supervisord/one-novnc.conf /etc/supervisor.d/one-novnc.conf
COPY start.sh /root/start.sh

CMD ["/root/start.sh"]
