FROM fasrc/corona-base:5.2
MAINTAINER "Harvard University FAS Research Computing" <rchelp@fas.harvard.edu>

LABEL Description="libvirt image for CORONA"

RUN yum -y update && yum clean all
RUN yum -y install \
    libvirt \
    qemu-system-x86 \
    qemu-kvm \
    && yum clean all

COPY supervisord/libvirtd.conf /etc/supervisor.d/libvirtd.conf
COPY start.sh /root/start.sh

CMD ["/root/start.sh"]
