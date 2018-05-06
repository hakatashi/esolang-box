FROM esolang/base

RUN apk add --update jq && \
    rm -rf /var/cache/apk/* /tmp/* && \
    ln -s /bin/script /bin/jq

COPY script /root/script
