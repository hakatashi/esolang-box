FROM esolang/java

RUN apk add bash && \
    cd /tmp && \
    curl https://github.com/JetBrains/kotlin/releases/download/v2.3.20/kotlin-compiler-2.3.20.zip -LO && \
    unzip kotlin-compiler-2.3.20.zip -d ~/ && \
    rm -rf /var/cache/apk/* /tmp/* && \
    ln -s /bin/script /bin/kotlin && \
    rm /bin/java

RUN JAVA_OPTS="-XX:TieredStopAtLevel=1 -XX:ArchiveClassesAtExit=/root/kotlinc.jsa" \
    ~/kotlinc/bin/kotlinc -version 2>&1 || true

ENV JAVA_OPTS="-Xmx512M -Xms128M -XX:SharedArchiveFile=/root/kotlinc.jsa -XX:TieredStopAtLevel=1 -Xlog:cds=off"

COPY script /root/script
