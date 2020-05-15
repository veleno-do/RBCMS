
FROM            centos:7

LABEL           maintainer="h3yukomah1y1k1m@gmail.com"

ENV             HOME /home
ENV             APP_ROOT /home

RUN             yum update -y
RUN             yum install -y openssh-server
RUN             yum install -y ruby ruby-dev
RUN             yum clean all

EXPOSE          80
EXPOSE          443

WORKDIR         ${HOME}

VOLUME          ${APP_ROOT}

COPY            . ${APP_ROOT}

CMD             ["ruby", "./rbcms-daemon.rb"]
