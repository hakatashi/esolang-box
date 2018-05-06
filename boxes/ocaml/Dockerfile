FROM esolang/base

RUN apk add --update ocaml && \
    rm -rf /var/cache/apk/* /tmp/* && \
    ln -s /bin/script /bin/ocaml

COPY script /bin/script

