FROM esolang/csharp

RUN cd /tmp && \
    apk add --update libtiffxx --repository https://dl-3.alpinelinux.org/alpine/edge/main/ && \
    apk add --update libgdiplus --repository http://dl-cdn.alpinelinux.org/alpine/edge/community && \
    curl https://rdr.utopiat.net/files/mono//produire-mono-1.9.1182.tar.gz -LO && \
    mkdir -p ~/produire && \
    tar xf produire-mono-1.9.1182.tar.gz -C ~/produire && \
    rm -rf /var/cache/apk/* /tmp/* && \
    ln -s /bin/script /bin/produire && \
    rm /bin/csharp

COPY script /root/script
COPY disasm /root/disasm
