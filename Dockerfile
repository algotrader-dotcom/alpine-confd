FROM dockage/alpine-openrc:3.5
MAINTAINER Mohammad Abdoli Rad <m.abdolirad@gmail.com>

LABEL org.label-schema.name="alpine-confd" \
        org.label-schema.vendor="Dockage" \
        org.label-schema.description="Docker confd, built on Alpine Linux. confd is a lightweight configuration management tool." \
        org.label-schema.vcs-url="https://github.com/dockage/alpine-confd" \
        org.label-schema.version="3.5" \
        org.label-schema.license="MIT"

ENV CONFD_VERSION=0.14.0

COPY assets/root/ /

ADD https://github.com/kelseyhightower/confd/releases/download/v${CONFD_VERSION}/confd-${CONFD_VERSION}-linux-amd64 /usr/sbin/confd
RUN chmod +x /usr/sbin/confd \
    && rc-update add local \
    && rc-update add confd

WORKDIR /etc/confd
