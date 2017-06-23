FROM fasrc/corona-base:4.12
MAINTAINER "Harvard University FAS Research Computing" <rchelp@fas.harvard.edu>

LABEL Description="This is a OpenNebula sunstone image for corona"

RUN yum -y update && yum clean all
RUN yum -y install \
    opennebula-sunstone \
    && yum clean all

RUN gem install --no-ri --no-rdoc \
    rack \
    sinatra \
    thin \
    zendesk_api \
    sqlite3 \
    builder \

COPY start.sh /root/start.sh

CMD ["/root/start.sh"]