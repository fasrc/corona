FROM fasrc/corona-base:5.2
MAINTAINER "Harvard University FAS Research Computing" <rchelp@fas.harvard.edu>

LABEL Description="OneFlow image for CORONA"

RUN yum -y update && yum clean all
RUN yum -y install \
    opennebula-gate \
    && yum clean all

COPY supervisord/one-gate.conf /etc/supervisor.d/one-gate.conf
COPY start.sh /root/start.sh

CMD ["/root/start.sh"]
