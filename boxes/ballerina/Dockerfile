FROM esolang/base

ENV JAVA_HOME=/usr/lib/jvm/java-21-openjdk

RUN cd /tmp && \
    apk add bash openjdk21

RUN curl -LO https://dist.ballerina.io/downloads/2201.13.2/ballerina-2201.13.2.zip && \
    unzip ballerina-2201.13.2.zip && \
    mv ballerina-2201.13.2 /root/ballerina && \
    rm -rf /var/cache/apk/* /tmp/* && \
    ln -s /bin/script /bin/ballerina

COPY script /root/script
