FROM corona/base:latest
MAINTAINER "Harvard University FAS Research Computing" <rchelp@fas.harvard.edu>

LABEL Description="This is a libvirt image for DockerNebula" Version="0.2"

RUN yum -y update && yum clean all
RUN yum -y install \
    libvirt \
    qemu-system-x86 \
    qemu-kvm \
    && yum clean all

COPY start.sh /root/

CMD ["/root/start.sh"]