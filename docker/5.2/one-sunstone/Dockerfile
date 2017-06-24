FROM fasrc/corona-sunstone-base:5.2
MAINTAINER "Harvard University FAS Research Computing" <rchelp@fas.harvard.edu>

LABEL Description="Sunstone image for CORONA"

RUN yum -y update && yum clean all
RUN yum -y install \
    openssl \
    httpd \
    mod_passenger \
    && yum clean all

COPY start.sh /root/start.sh

CMD ["/root/start.sh"]
