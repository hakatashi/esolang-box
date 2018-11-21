FROM esolang/base

RUN curl https://download.java.net/java/early_access/alpine/20/binaries/openjdk-12-ea+20_linux-x64-musl_bin.tar.gz -LO && \
    tar xf openjdk-12-ea+20_linux-x64-musl_bin.tar.gz  && \
    rm openjdk-12-ea+20_linux-x64-musl_bin.tar.gz && \
    mv jdk-12 ~/jdk && \
    cp -r ~/jdk/* /usr/  && \
    rm -rf /var/cache/apk/* /tmp/* && \
    ln -s /bin/script /bin/java

COPY script /root/script
