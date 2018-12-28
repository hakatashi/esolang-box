FROM esolang/base

RUN apk add --update erlang && \
    rm -rf /var/cache/apk/* /tmp/* && \
    ln -s /bin/script /bin/erlang

COPY script /root/script
