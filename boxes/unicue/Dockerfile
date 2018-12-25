FROM esolang/node

ENV BUILD_PACKAGES="npm" \
    RUNTIME_PACKAGES=""

RUN apk add --update $BUILD_PACKAGES $RUNTIME_PACKAGES && \
    rm /bin/node && \
    git clone --depth 1 https://github.com/hakatashi/tweet-lang.git ~/unicue && \
    cd ~/unicue && \
    curl -LO https://www.unicode.org/Public/UCD/latest/ucd/UCD.zip && \
    mkdir -p UCD && \
    unzip UCD.zip -d UCD && \
    npm install && \
    apk del $BUILD_PACKAGES && \
    rm -rf /var/cache/apk/* /tmp/* && \
    ln -s /bin/script /bin/unicue

COPY script /root/script
