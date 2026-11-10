FROM esolang/csharp

RUN cd /tmp && \
    apk add --update libtiffxx --repository https://dl-3.alpinelinux.org/alpine/edge/main/ && \
    apk add --update libgdiplus --repository http://dl-cdn.alpinelinux.org/alpine/edge/community && \
    curl -fL https://produ.irelang.jp/downloads/mono/produire-mono-2.0.1396.tar.gz -O && \
    mkdir -p ~/produire && \
    tar xf produire-mono-2.0.1396.tar.gz -C ~/produire && \
    rm -rf /var/cache/apk/* /tmp/* && \
    ln -s /bin/script /bin/produire && \
    rm /bin/csharp

COPY script /root/script
COPY disasm /root/disasm
