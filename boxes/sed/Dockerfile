FROM esolang/base

RUN apk add --update sed && \
    rm -rf /var/cache/apk/* /tmp/* && \
    mv /bin/sed /usr/bin/sed && \
    ln -s /bin/script /bin/sed

COPY script /root/script
