FROM esolang/csharp

RUN git clone --depth 1 https://github.com/rottytooth/Velato.git ~/Velato && \
    ln -s /bin/script /bin/velato

COPY Rottytooth.Esolang.Velato.sln /root/Velato/Rottytooth.Esolang.Velato.sln

RUN cd ~/Velato && \
    xbuild Rottytooth.Esolang.Velato.sln /p:TargetFrameworkVersion="v4.5" /p:Configuration=Release && \
    rm -rf /var/cache/apk/* /tmp/*

COPY script /root/script
