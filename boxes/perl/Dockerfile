FROM esolang/base

RUN apk add --update perl && \
    rm -rf /var/cache/apk/* /tmp/* && \
    ln -s /bin/script /bin/perl

COPY script /bin/script

