FROM fasrc/corona-base:5.4
MAINTAINER "Harvard University FAS Research Computing" <rchelp@fas.harvard.edu>

LABEL Description="libvirt image for CORONA"

RUN yum clean all && yum -y update
RUN yum install -y centos-release-qemu-ev
RUN yum -y install \
    qemu-kvm-ev \
    libvirt \
    && yum clean all
RUN usermod -aG kvm oneadmin

COPY supervisord/libvirt.conf /etc/supervisor.d/libvirt.conf
COPY libvirt.sh /usr/local/corona/bin/libvirt.sh

CMD ["/usr/local/corona/bin/libvirt.sh"]
