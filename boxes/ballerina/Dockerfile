FROM esolang/base

ENV JAVA_HOME=/usr/lib/jvm/java-1.8-openjdk

RUN cd /tmp && \
    apk add bash openjdk8

RUN curl -LO https://dist.ballerina.io/downloads/1.2.13/ballerina-1.2.13.zip && \
    unzip ballerina-1.2.13.zip && \
    mv ballerina-1.2.13 /root/ballerina && \
    rm -rf /var/cache/apk/* /tmp/* && \
    ln -s /bin/script /bin/ballerina

COPY script /root/script
