FROM fasrc/corona-one-base:5.8
MAINTAINER "Harvard University FAS Research Computing" <rchelp@fas.harvard.edu>

LABEL Description="Base sunstone image for CORONA"

RUN yum clean all && yum -y update
RUN yum -y install \
    opennebula-sunstone \
    && yum clean all
