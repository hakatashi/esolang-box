FROM esolang/base

RUN curl https://download.java.net/java/early_access/alpine/19/binaries/openjdk-13-ea+19_linux-x64-musl_bin.tar.gz -LO && \
    tar xf openjdk-13-ea+19_linux-x64-musl_bin.tar.gz && \
    cp -r jdk-13/* /usr && \
    rm -rf /var/cache/apk/* /tmp/* && \
    ln -s /bin/script /bin/java

COPY script /root/script
