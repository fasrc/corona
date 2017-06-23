FROM fasrc/corona-base:5.2
MAINTAINER "Harvard University FAS Research Computing" <rchelp@fas.harvard.edu>

LABEL Description="Controller image for CORONA"

RUN yum -y update && yum clean all
RUN yum -y install \
    opennebula-server \
    && yum clean all

RUN printf '1\n\ny\n\n' | /usr/share/one/install_gems

RUN rm /var/lib/one/.one/one_auth ;\
    rm /var/lib/one/.ssh/*

VOLUME /var/lib/one

COPY supervisord/one-controller.conf /etc/supervisor.d/one-controller.conf
COPY start.sh /root/start.sh
COPY one-auth.sh /tmp/one-auth.sh

CMD ["/root/start.sh"]
