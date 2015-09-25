FROM centos:7
MAINTAINER "Harvard University FAS Research Computing" <rchelp@fas.harvard.edu>

LABEL Description="This is a base image for DockerNebula" Version="0.2"

RUN yum -y update && yum clean all
RUN rpm -e --nodeps systemd-container systemd-container-libs; \
    yum -d 10 -y install systemd systemd-libs systemd-devel; \
    yum -y install epel-release; \
    yum clean all

#Install OpenNebula requirements

RUN yum -y install \
        gcc \
        gcc-c++ \
        libcurl-devel \
        mariadb-devel \
        ruby-devel \
        sqlite-devel \
        && yum clean all 

COPY one-centos7.repo /etc/yum.repos.d/
