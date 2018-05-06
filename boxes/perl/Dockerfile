FROM esolang/base

RUN apk add --update perl && \
    rm -rf /var/cache/apk/* /tmp/*

COPY script /bin/script

RUN ln -s /bin/script /bin/perl && \
    chmod 744 /bin -R
