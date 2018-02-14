FROM fasrc/corona-one-base:5.4
MAINTAINER "Harvard University FAS Research Computing" <rchelp@fas.harvard.edu>

LABEL Description="Controller image for CORONA"

RUN yum clean all && yum -y update
RUN yum -y install \
    opennebula-server \
    && yum clean all

RUN rm /var/lib/one/.one/one_auth ;\
    rm /var/lib/one/.ssh/*

VOLUME /var/lib/one

COPY supervisord/one-controller.conf /etc/supervisor.d/one-controller.conf
COPY start.sh /root/start.sh
COPY one-auth.sh /tmp/one-auth.sh

CMD ["/root/start.sh"]
