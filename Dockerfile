FROM ubuntu:xenial

MAINTAINER "Thimico" <thimico@gmail.com>

RUN rm -f /etc/motd && \
    echo "---" > /etc/motd && \
    echo "Support by Thimico. Contact:thimico@gmail.com" >> /etc/motd && \
    echo "---" >> /etc/motd && \
    touch "/(C) Thimico"

RUN  sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list && \
    apt-get update && apt-get install -y \
        locales wget nano

RUN dpkg-reconfigure locales && \
    locale-gen pt_BR.UTF-8 && \
    update-locale LANG=pt_BR.UTF-8 LC_CTYPE=pt_BR.UTF-8 LANGUAGE=pt_BR:en LC_ALL=pt_BR.UTF-8

RUN apt-get clean && \
    apt-get autoclean && \
    apt-get autoremove -y && \
    rm -rf /build && \
    rm -rf /tmp/* /var/tmp/* && \
    rm -rf /var/lib/apt/lists/* && \
    rm -f /etc/dpkg/dpkg.cfg.d/02apt-speedup

ENV LC_ALL pt_BR.UTF-8
ENV TZ America/Bahia