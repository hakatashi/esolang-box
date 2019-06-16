FROM esolang/base

RUN apk add --update rakudo --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing && \
    rm -rf /var/cache/apk/* /tmp/* && \
    ln -s /bin/script /bin/perl6

COPY script /root/script
