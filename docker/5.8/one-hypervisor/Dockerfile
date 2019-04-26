FROM fasrc/corona-one-sshd:5.8
MAINTAINER "Harvard University FAS Research Computing" <rchelp@fas.harvard.edu>

LABEL Description="Hypervisor image for CORONA"

RUN yum clean all && yum -y update
RUN yum -y install \
    opennebula-node-kvm \
    && yum clean all

CMD ["/usr/local/corona/bin/sshd.sh"]
