FROM esolang/java

RUN apk add bash && \
    cd /tmp && \
    curl https://github.com/JetBrains/kotlin/releases/download/v1.2.31/kotlin-compiler-1.2.31.zip -LO && \
    unzip kotlin-compiler-1.2.31.zip -d ~/ && \
    rm -rf /var/cache/apk/* /tmp/*

COPY script /bin/script

RUN ln -s /bin/script /bin/kotlin && \
    rm /bin/java && \
    chmod 744 /bin -R
