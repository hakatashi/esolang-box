FROM esolang/base

RUN apk add --update ocaml && \
    rm -rf /var/cache/apk/* /tmp/*

COPY script /bin/script

RUN ln -s /bin/script /bin/ocaml && \
    chmod 744 /bin -R

WORKDIR /root

CMD [ "script" ]
