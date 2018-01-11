FROM dockage/alpine-openrc:3.5
MAINTAINER Mohammad Abdoli Rad <m.abdolirad@gmail.com>

ENV CONFD_VERSION=0.14.0

COPY assets/root/ /

ADD https://github.com/kelseyhightower/confd/releases/download/v${CONFD_VERSION}/confd-${CONFD_VERSION}-linux-amd64 /usr/sbin/confd
RUN chmod +x /usr/sbin/confd \
    && rc-update add confd default \
    && rc-update add local

WORKDIR /etc/confd
