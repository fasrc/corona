FROM corona/base:latest
MAINTAINER "Harvard University FAS Research Computing" <rchelp@fas.harvard.edu>

LABEL Description="This is a nfs image for corona" Version="0.2"

RUN yum -y update && yum clean all
RUN yum -y install \
    nfs-utils \
    nfs-utils-lib

COPY nfs_start.sh /usr/sbin/nfs_start
COPY supervisord/nfs_server.conf /etc/supervisor.d/nfs_server.conf

CMD ["/usr/bin/supervisord"]