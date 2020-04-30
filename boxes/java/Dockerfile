FROM esolang/base

RUN cd /tmp && \
    curl https://download.java.net/java/early_access/alpine/10/binaries/openjdk-15-ea+10_linux-x64-musl_bin.tar.gz -LO && \
    tar xf openjdk-15-ea+10_linux-x64-musl_bin.tar.gz && \
    cp -r jdk-15/* /usr && \
    rm -rf /var/cache/apk/* /tmp/* && \
    ln -s /bin/script /bin/java

COPY script /root/script
