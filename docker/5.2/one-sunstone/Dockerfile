FROM fasrc/corona-base:5.2
MAINTAINER "Harvard University FAS Research Computing" <rchelp@fas.harvard.edu>

LABEL Description="Sunstone image for CORONA"

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
