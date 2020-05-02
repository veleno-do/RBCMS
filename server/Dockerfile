
FROM            centos:7

LABEL           maintainer="h3yukomah1y1k1m@gmail.com"

ENV             container docker
ENV             HOME /home
ENV             APP_ROOT /home

RUN             yum update -y
RUN             yum install -y iproute
RUN             yum install -y openssh-server
RUN             yum install -y ruby ruby-dev
RUN             curl -sL https://rpm.nodesource.com/setup_8.x | bash -
RUN             yum install -y nodejs
RUN             yum clean all

EXPOSE          80
EXPOSE          443

WORKDIR         ${HOME}

VOLUME          ${APP_ROOT}

COPY            . ${APP_ROOT}

CMD             ["ruby", "./rbcms-daemon.rb"]
