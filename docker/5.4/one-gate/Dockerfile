FROM fasrc/corona-one-base:5.4
MAINTAINER "Harvard University FAS Research Computing" <rchelp@fas.harvard.edu>

LABEL Description="OneGate image for CORONA"

RUN yum clean all && yum -y update
RUN yum -y install \
    opennebula-gate \
    && yum clean all

COPY supervisord/one-gate.conf /etc/supervisor.d/one-gate.conf
COPY start.sh /root/start.sh

CMD ["/root/start.sh"]
