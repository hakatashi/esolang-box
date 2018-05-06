FROM esolang/base

RUN apk add --update wine && \
    rm -rf /var/cache/apk/* /tmp/* && \
    ln -s /bin/script /bin/cmd

COPY script /bin/script

