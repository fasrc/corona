FROM centos:7
MAINTAINER "Harvard University FAS Research Computing" <rchelp@fas.harvard.edu>

ENV DOCKERNEBULA_BASE centos7

LABEL Description="This is a base image for DockerNebula" Version="0.1"

RUN yum -y update && yum clean all
RUN rpm -e --nodeps systemd-container systemd-container-libs; \
    && rpm -e --nodeps yum-plugin-fastestmirror; \
    && yum -d 10 -y install systemd systemd-libs systemd-devel; \
    && yum -y install epel-release; \
    && yum clean all