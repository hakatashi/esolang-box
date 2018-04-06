FROM esolang/base

RUN apk add --update vim && \
    rm -rf /var/cache/apk/* /tmp/*

COPY script /bin/script

RUN ln -s /bin/script /bin/vim && \
    chmod 744 /bin -R

WORKDIR /root

CMD [ "script" ]
