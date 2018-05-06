FROM esolang/base

RUN apk add --update php7 && \
    rm -rf /var/cache/apk/* /tmp/*

COPY script /bin/script

RUN ln -s /bin/script /bin/php && \
    chmod 744 /bin -R
