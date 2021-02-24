FROM esolang/base

RUN apk add --update sqlite && \
    rm -rf /var/cache/apk/* /tmp/*
RUN ln -s /bin/script /bin/sqlite3

COPY script /root/script
