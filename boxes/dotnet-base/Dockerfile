FROM esolang/build-base

RUN cd /tmp && \
    curl https://aka.ms/dotnet/net5/preview3/Sdk/dotnet-sdk-linux-musl-x64.tar.gz -LO && \
    mkdir -p /root/dotnet-sdk && \
    tar xf dotnet-sdk-linux-musl-x64.tar.gz -C /root/dotnet-sdk && \
    apk add --update gettext libintl icu && \
    rm -rf /var/cache/apk/* /tmp/* && \
    ln -s /bin/script /bin/dotnet

COPY script /root/script
