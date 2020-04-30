FROM esolang/base

ENV JAVA_HOME=/usr/lib/jvm/java-1.8-openjdk

RUN cd /tmp && \
    apk add bash openjdk8 && \
    curl -LO https://product-dist.ballerina.io/downloads/1.2.2/ballerina-1.2.2.zip && \
    unzip ballerina-1.2.2.zip && \
    mv ballerina-1.2.2 /root/ballerina && \
    rm -rf /var/cache/apk/* /tmp/* && \
    ln -s /bin/script /bin/ballerina

COPY script /root/script
