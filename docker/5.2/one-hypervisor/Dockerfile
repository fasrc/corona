FROM fasrc/corona-one-base:5.2
MAINTAINER "Harvard University FAS Research Computing" <rchelp@fas.harvard.edu>

LABEL Description="Hypervisor image for CORONA"

RUN yum clean all && yum -y update
RUN yum -y install \
    opennebula-node-kvm \
    openssh-server \
    && yum clean all

COPY supervisord/one-hypervisor.conf /etc/supervisor.d/one-hypervisor.conf
COPY start.sh /root/start.sh

CMD ["/root/start.sh"]
