FROM centos:centos6
MAINTAINER Qen Empaces <qen.empaces@gmail.com>

ENV HOME /root
ENV SHELL /bin/bash

RUN yum install -y wget tar bzip2 openssl openssl-devel curl libxml2 libxml2-devel libxslt libxslt-devel curl-devel git make automake

RUN wget http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
RUN rpm -Uvh epel-release-6*.rpm
RUN rm -rf /epel-release*

RUN wget -O ruby-install-0.5.0.tar.gz https://github.com/postmodern/ruby-install/archive/v0.5.0.tar.gz
RUN tar -xzvf ruby-install-0.5.0.tar.gz
RUN cd ruby-install-0.5.0 && make install 
RUN cd / && rm -Rf ruby-install-0.5.*
RUN ruby-install --system ruby -- --disable-install-rdoc
RUN gem install bundler --no-rdoc --no-ri

# clean up
RUN rm -rf /usr/local/src/*
RUN yum clean all
RUN rm -rf /var/cache/yum/*
