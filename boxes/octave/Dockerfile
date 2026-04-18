FROM esolang/base

RUN apk add --update octave && \
    rm -rf /var/cache/apk/* /tmp/* && \
    ln -s /bin/script /bin/octave

COPY script /root/script
