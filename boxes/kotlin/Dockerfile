FROM esolang/java

RUN apk add bash && \
    cd /tmp && \
    curl https://github.com/JetBrains/kotlin/releases/download/v1.3.31/kotlin-compiler-1.3.31.zip -LO && \
    unzip kotlin-compiler-1.3.31.zip -d ~/ && \
    rm -rf /var/cache/apk/* /tmp/* && \
    ln -s /bin/script /bin/kotlin && \
    rm /bin/java

COPY script /root/script
