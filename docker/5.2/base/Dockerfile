FROM centos:7
MAINTAINER "Harvard University FAS Research Computing" <rchelp@fas.harvard.edu>

LABEL Description="Base image for CORONA"

RUN yum -y update && yum clean all
RUN rpm -e --nodeps systemd-container systemd-container-libs; \
    yum -d 10 -y install systemd systemd-libs systemd-devel; \
    yum -y install epel-release; \
    yum -y install python-pip; \
    yum clean all

RUN pip install supervisor

#Install OpenNebula requirements

RUN yum -y install \
        gcc \
        gcc-c++ \
        libcurl-devel \
        mariadb-devel \
        ruby-devel \
        sqlite-devel \
        make \
        && yum clean all

RUN groupadd --gid 9869 oneadmin
RUN useradd --uid 9869 -g oneadmin -d /var/lib/one oneadmin

COPY one-centos7.repo /etc/yum.repos.d/

COPY supervisord/supervisord.conf /etc/supervisord.conf
