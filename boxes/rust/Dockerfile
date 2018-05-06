FROM esolang/build-base

RUN apk add --update rust && \
    rm -rf /var/cache/apk/* /tmp/*

COPY script /bin/script

RUN ln -s /bin/script /bin/rust && \
    chmod 744 /bin -R
