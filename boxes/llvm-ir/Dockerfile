FROM esolang/build-base

RUN apk add --update llvm5 && \
    rm -rf /var/cache/apk/* /tmp/*

COPY script /bin/script

RUN ln -s /bin/script /bin/llvm-ir && \
    chmod 744 /bin -R

WORKDIR /root

CMD [ "script" ]
