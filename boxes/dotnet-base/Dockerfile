FROM esolang/build-base

RUN cd /tmp && \
    curl -LO https://download.visualstudio.microsoft.com/download/pr/fb8f282d-41eb-4926-87b8-78bff54bd0c5/c2cf161fe014133a5d177beb035e3b99/dotnet-sdk-7.0.203-linux-musl-x64.tar.gz

RUN    mkdir -p /root/dotnet-sdk && \
    tar xf /tmp/dotnet-sdk-7.0.203-linux-musl-x64.tar.gz -C /root/dotnet-sdk && \
    apk add --update gettext libintl icu && \
    rm -rf /var/cache/apk/* /tmp/* && \
    ln -s /bin/script /bin/dotnet

COPY script /root/script
