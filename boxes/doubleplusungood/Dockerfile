FROM esolang/build-base

RUN apk add boost-dev perl && \
    rm -rf /var/cache/apk/* /tmp/*

COPY script /bin/script

RUN ln -s /bin/script /bin/doubleplusungood && \
    chmod 744 /bin -R

WORKDIR /root

CMD [ "script" ]
