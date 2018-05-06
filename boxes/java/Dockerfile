FROM esolang/base

RUN apk add --update openjdk8 openjdk8-jre && \
    rm -rf /var/cache/apk/* /tmp/* && \
    ln -s /bin/script /bin/java

COPY script /bin/script

