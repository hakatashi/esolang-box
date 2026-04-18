FROM esolang/java

RUN apk add bash && \
    cd /tmp && \
    curl https://github.com/JetBrains/kotlin/releases/download/v2.3.20/kotlin-compiler-2.3.20.zip -LO && \
    unzip kotlin-compiler-2.3.20.zip -d ~/ && \
    rm -rf /var/cache/apk/* /tmp/* && \
    ln -s /bin/script /bin/kotlin && \
    rm /bin/java

COPY script /root/script
