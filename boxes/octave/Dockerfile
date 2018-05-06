FROM esolang/base

RUN apk add --update octave --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing && \
    rm -rf /var/cache/apk/* /tmp/*

COPY script /bin/script

RUN ln -s /bin/script /bin/octave && \
    chmod 744 /bin -R
