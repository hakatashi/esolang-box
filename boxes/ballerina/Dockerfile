FROM esolang/base

ENV JAVA_HOME=/usr/lib/jvm/java-1.8-openjdk

RUN cd /tmp && \
    apk add bash openjdk8 && \
    curl -LO https://product-dist.ballerina.io/downloads/0.991.0/ballerina-0.991.0.zip && \
    unzip ballerina-0.991.0.zip && \
    mkdir -p ~/ballerina && \
    cd ballerina-0.991.0 && \
    mv bin ~/ballerina && \
    mv lib ~/ballerina && \
    mv src ~/ballerina && \
    mv bre ~/ballerina && \
    rm -rf /var/cache/apk/* /tmp/* && \
    ln -s /bin/script /bin/ballerina

COPY script /root/script
