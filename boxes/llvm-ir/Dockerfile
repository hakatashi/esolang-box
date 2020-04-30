FROM esolang/build-base

RUN apk add --update llvm10 && \
    rm -rf /var/cache/apk/* /tmp/* && \
    ln -s /bin/script /bin/llvm-ir

COPY script /root/script
