FROM fasrc/corona-base:4.12
MAINTAINER "Harvard University FAS Research Computing" <rchelp@fas.harvard.edu>

LABEL Description="This is a OpenNebula node image for corona" Version="0.2"

RUN yum -y update && yum clean all
RUN yum -y install \
    opennebula-node-kvm \
    openssh-server \
    && yum clean all

COPY supervisord/one-hypervisor.conf /etc/supervisor.d/one-hypervisor.conf
COPY start.sh /root/start.sh

CMD ["/root/start.sh"]
