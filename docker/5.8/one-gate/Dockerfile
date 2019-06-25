FROM fasrc/corona-one-base:5.8
MAINTAINER "Harvard University FAS Research Computing" <rchelp@fas.harvard.edu>

LABEL Description="OneGate image for CORONA"

RUN yum clean all && yum -y update
RUN yum -y install \
    opennebula-gate \
    && yum clean all

COPY onegate.sh /usr/local/corona/bin/onegate.sh

CMD ["/usr/local/corona/bin/onegate.sh"]
