FROM fasrc/corona-base:4.12
MAINTAINER "Harvard University FAS Research Computing" <rchelp@fas.harvard.edu>

LABEL Description="This is a nfs image for corona"

RUN yum -y update && yum clean all
RUN yum -y install \
    nfs-utils \
    nfs-utils-lib

COPY bin/supervisor-exportfs /usr/local/sbin/supervisor-exportfs
COPY bin/supervisor-rpc.nfsd /usr/local/sbin/supervisor-rpc.nfsd
COPY supervisord/nfs_server.conf /etc/supervisor.d/nfs_server.conf
COPY start.sh /root/start.sh

CMD ["/root/start.sh"]