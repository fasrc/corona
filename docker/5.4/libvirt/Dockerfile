FROM fasrc/corona-base:5.4
MAINTAINER "Harvard University FAS Research Computing" <rchelp@fas.harvard.edu>

LABEL Description="libvirt image for CORONA"

RUN yum clean all && yum -y update
RUN yum install -y centos-release-qemu-ev
RUN yum -y install \
    qemu-kvm-ev \
    libvirt \
    && yum clean all

COPY supervisord/libvirtd.conf /etc/supervisor.d/libvirtd.conf
COPY supervisord/virtlogd.conf /etc/supervisor.d/virtlogd.conf
COPY start.sh /root/start.sh

CMD ["/root/start.sh"]
