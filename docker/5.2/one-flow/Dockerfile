FROM fasrc/corona-one-base:5.2
MAINTAINER "Harvard University FAS Research Computing" <rchelp@fas.harvard.edu>

LABEL Description="OneFlow image for CORONA"

RUN yum clean all && yum -y update
RUN yum -y install \
    opennebula-flow \
    && yum clean all

COPY supervisord/one-flow.conf /etc/supervisor.d/one-flow.conf
COPY start.sh /root/start.sh

CMD ["/root/start.sh"]
