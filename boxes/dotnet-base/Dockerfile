FROM esolang/build-base

RUN cd /tmp && \
    curl -LO https://download.visualstudio.microsoft.com/download/pr/d02ece12-7202-4a7b-93f7-661268d8b315/d62d32d57d330943b8a889cbd9cd58df/dotnet-sdk-5.0.103-linux-musl-x64.tar.gz

RUN    mkdir -p /root/dotnet-sdk && \
    tar xf /tmp/dotnet-sdk-5.0.103-linux-musl-x64.tar.gz -C /root/dotnet-sdk && \
    apk add --update gettext libintl icu && \
    rm -rf /var/cache/apk/* /tmp/* && \
    ln -s /bin/script /bin/dotnet

COPY script /root/script
