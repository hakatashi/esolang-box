FROM esolang/base

RUN apk add --update vim && \
    rm -rf /var/cache/apk/* /tmp/* && \
    ln -s /bin/script /bin/vim

COPY script /bin/script

