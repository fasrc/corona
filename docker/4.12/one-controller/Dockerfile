FROM fasrc/corona-base:4.12
MAINTAINER "Harvard University FAS Research Computing" <rchelp@fas.harvard.edu>

LABEL Description="This is a OpenNebula head node image for corona"

RUN yum -y update && yum clean all
RUN yum -y install \
    opennebula-server \
    opennebula-flow \
    && yum clean all

RUN gem install --no-ri --no-rdoc aws-sdk --version "= 1.33"
RUN gem install --no-ri --no-rdoc \
    rack \
    sinatra \
    thin \
    zendesk_api \
    sqlite3 \
    sequel \
    amazon-ec2 \
    uuidtools \
    curb \
    net-ldap \
    builder \
    trollop \
    treetop \
    parse-cron \
    ox mysql \
    softlayer_api \
    configparser azure

RUN rm /var/lib/one/.one/one_auth ;\
    rm /var/lib/one/.ssh/*

VOLUME /var/lib/one

COPY supervisord/one-controller.conf /etc/supervisor.d/one-controller.conf
COPY start.sh /root/start.sh
COPY one-auth.sh /tmp/one-auth.sh

CMD ["/root/start.sh"]
