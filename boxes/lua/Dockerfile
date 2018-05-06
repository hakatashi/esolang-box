FROM esolang/base

RUN apk add --update lua5.3 && \
    rm -rf /var/cache/apk/* /tmp/*

COPY script /bin/script

RUN ln -s /bin/script /bin/lua && \
    chmod 744 /bin -R
