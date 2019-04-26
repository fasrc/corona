FROM fasrc/corona-one-base:5.4
MAINTAINER "Harvard University FAS Research Computing" <rchelp@fas.harvard.edu>

LABEL Description="OneFlow image for CORONA"

RUN yum clean all && yum -y update
RUN yum -y install \
    opennebula-flow \
    && yum clean all

COPY oneflow.sh /usr/local/corona/bin/oneflow.sh

CMD ["/usr/local/corona/bin/oneflow.sh"]
