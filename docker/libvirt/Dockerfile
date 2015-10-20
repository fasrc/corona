FROM fasrc/corona-base:4.12
MAINTAINER "Harvard University FAS Research Computing" <rchelp@fas.harvard.edu>

LABEL Description="This is a libvirt image for DockerNebula"

RUN yum -y update && yum clean all
RUN yum -y install \
    libvirt \
    qemu-system-x86 \
    qemu-kvm \
    && yum clean all

COPY start.sh /root/

CMD ["/root/start.sh"]