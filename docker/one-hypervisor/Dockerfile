FROM corona/base:latest
MAINTAINER "Harvard University FAS Research Computing" <rchelp@fas.harvard.edu>

LABEL Description="This is a OpenNebula node image for corona" Version="0.2"

RUN yum -y update && yum clean all
RUN yum -y install \
    opennebula-node-kvm \
    openssh-server \
    && yum clean all

COPY start.sh /root/

CMD ["/root/start.sh"]