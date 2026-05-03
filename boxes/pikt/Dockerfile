FROM esolang/kotlin

RUN apk add --no-cache maven && \
    git clone --depth 1 https://github.com/iamgio/pikt.git /tmp/pikt && \
    cd /tmp/pikt && \
    mvn -B package -DskipTests -Dkotlin.version=2.3.20 && \
    mkdir -p ~/pikt/libraries && \
    cp core/target/pikt.jar ~/pikt/pikt.jar && \
    cp stdlib/target/stdlib.jar ~/pikt/libraries/stdlib.jar && \
    rm -rf /tmp/pikt /root/.m2 /var/cache/apk/* && \
    ln -s /bin/script /bin/pikt

COPY script /root/script
COPY disasm /root/disasm
