FROM fasrc/corona-one-base:5.4
MAINTAINER "Harvard University FAS Research Computing" <rchelp@fas.harvard.edu>

LABEL Description="SSH image for CORONA"

RUN yum clean all && yum -y update
RUN yum -y install \
    openssh-server \
    && yum clean all

COPY sshd.sh /usr/local/corona/bin/sshd.sh

CMD ["/usr/local/corona/bin/sshd.sh"]
