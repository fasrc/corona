FROM fasrc/corona-sunstone-base:5.2
MAINTAINER "Harvard University FAS Research Computing" <rchelp@fas.harvard.edu>

LABEL Description="Sunstone image for CORONA"

RUN yum clean all && yum -y update
RUN yum -y install \
    ca-certificates \
    openssl \
    httpd \
    mod_ssl \
    mod_passenger \
    python34-pip \
    && yum clean all

RUN mkdir -p /usr/src/app

COPY requirements.txt /usr/src/app/

RUN pip install --no-cache-dir -r /usr/src/app/requirements.txt

COPY . /usr/src/app

RUN pip install --no-cache-dir -e /usr/src/app/

EXPOSE 80 443

CMD ["/usr/bin/corona-sunstone"]
