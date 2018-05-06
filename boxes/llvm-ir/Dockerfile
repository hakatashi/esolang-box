FROM esolang/build-base

RUN apk add --update llvm5 && \
    rm -rf /var/cache/apk/* /tmp/* && \
    ln -s /bin/script /bin/llvm-ir

COPY script /root/script
