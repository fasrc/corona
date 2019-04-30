FROM fasrc/corona-base:5.8
MAINTAINER "Harvard University FAS Research Computing" <rchelp@fas.harvard.edu>

LABEL Description="Base ONE image for CORONA"

RUN yum clean all && yum -y update

# Install base OpenNebula requirements

RUN yum -y install \
    gcc \
    gcc-c++ \
    libcurl-devel \
    mariadb-devel \
    ruby-devel \
    sqlite-devel \
    make \
    opennebula-ruby \
    && yum clean all

RUN printf '1\n\ny\n\n' | /usr/share/one/install_gems
