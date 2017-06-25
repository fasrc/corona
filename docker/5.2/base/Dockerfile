FROM centos:7
MAINTAINER "Harvard University FAS Research Computing" <rchelp@fas.harvard.edu>

LABEL Description="Base image for CORONA"

RUN yum clean all && yum -y update
RUN rpm -e --nodeps systemd-container systemd-container-libs; \
    yum -y install \
        systemd \
        systemd-libs \
        systemd-devel \
        epel-release \
        redhat-lsb \
        python2-pip \
        && yum clean all

RUN pip install -IU pip setuptools wheel

RUN pip install --no-cache-dir supervisor

COPY supervisord/supervisord.conf /etc/supervisord.conf
