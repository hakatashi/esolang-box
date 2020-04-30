FROM esolang/csharp

RUN cd /tmp && \
    apk add --update libgdiplus --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing && \
    curl https://rdr.utopiat.net/files/mono//produire-mono-1.6.965.tar.gz -LO && \
    mkdir -p ~/produire && \
    tar xf produire-mono-1.6.965.tar.gz -C ~/produire && \
    rm -rf /var/cache/apk/* /tmp/* && \
    ln -s /bin/script /bin/produire && \
    rm /bin/csharp

COPY script /root/script
