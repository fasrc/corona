FROM fasrc/corona-sunstone-base:5.8
MAINTAINER "Harvard University FAS Research Computing" <rchelp@fas.harvard.edu>

LABEL Description="Sunstone image for CORONA"

RUN yum clean all && yum -y update
RUN yum -y install \
    ca-certificates \
    openssl \
    httpd \
    mod_ssl \
    mod_passenger \
    python-devel \
    && yum clean all

COPY corona-sunstone /usr/src/corona-sunstone

RUN pip install --no-cache-dir -r /usr/src/corona-sunstone/requirements.txt

RUN pip install --no-cache-dir -e /usr/src/corona-sunstone

EXPOSE 80 443

CMD ["/usr/bin/corona-sunstone"]
