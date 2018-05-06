FROM esolang/base

RUN apk add --update wine && \
    rm -rf /var/cache/apk/* /tmp/*

COPY script /bin/script

RUN ln -s /bin/script /bin/cmd && \
    chmod 744 /bin -R
