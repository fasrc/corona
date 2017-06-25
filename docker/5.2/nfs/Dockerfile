FROM fasrc/corona-base:5.2
MAINTAINER "Harvard University FAS Research Computing" <rchelp@fas.harvard.edu>

LABEL Description="NFS image for CORONA"

RUN yum clean all && yum -y update
RUN yum -y install \
    nfs-utils \
    nfs-utils-lib \
    && yum clean all

COPY bin/supervisor-exportfs /usr/local/sbin/supervisor-exportfs
COPY bin/supervisor-rpc.nfsd /usr/local/sbin/supervisor-rpc.nfsd
COPY supervisord/nfs_server.conf /etc/supervisor.d/nfs_server.conf
COPY start.sh /root/start.sh

CMD ["/root/start.sh"]
