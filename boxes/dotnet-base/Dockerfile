FROM esolang/build-base

RUN cd /tmp && \
    curl -LO https://builds.dotnet.microsoft.com/dotnet/Sdk/10.0.202/dotnet-sdk-10.0.202-linux-musl-x64.tar.gz && \
    mkdir -p /root/dotnet-sdk && \
    tar xf /tmp/dotnet-sdk-10.0.202-linux-musl-x64.tar.gz -C /root/dotnet-sdk && \
    apk add --update gettext libintl icu && \
    rm -rf /var/cache/apk/* /tmp/* && \
    ln -s /bin/script /bin/dotnet

COPY script /root/script
