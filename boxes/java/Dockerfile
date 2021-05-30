FROM esolang/base

ENV BUILD_PACKAGES="openjdk15-jdk" \
    RUNTIME_PACKAGES=""

RUN apk add $BUILD_PACKAGES $RUNTIME_PACKAGES --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing
RUN    rm -rf /var/cache/apk/* /tmp/* && \
    ln -s /bin/script /bin/java

# add path of javac and java to 
ENV PATH="${PATH}:/usr/lib/jvm/default-jvm/bin"
COPY script /root/script
