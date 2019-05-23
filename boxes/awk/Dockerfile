FROM esolang/base

RUN apk add --update gawk && \
    rm -rf /var/cache/apk/* /tmp/* && \
    ln -s /bin/script /bin/awk

COPY script /root/script
