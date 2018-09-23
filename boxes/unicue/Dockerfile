FROM esolang/node

RUN rm /bin/node && \
    git clone --depth 1 https://github.com/hakatashi/tweet-lang.git ~/unicue && \
    cd ~/unicue && \
    curl -LO https://www.unicode.org/Public/UCD/latest/ucd/UCD.zip && \
    mkdir -p UCD && \
    unzip UCD.zip -d UCD && \
    npm install && \
    ln -s /bin/script /bin/unicue

COPY script /root/script
