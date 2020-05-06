FROM esolang/csharp

RUN git clone --depth 1 https://github.com/settyan117/Folders.git ~/Folders && \
    ln -s /bin/script /bin/pure-folders && \
    rm /bin/csharp

COPY folders.cs /root/Folders/Rottytooth.Esolang.Folders.SamplePrograms/Program.cs

ENV BUILD_PACKAGES="perl" \
    RUNTIME_PACKAGES="g++ tar tree"

RUN apk add $BUILD_PACKAGES $RUNTIME_PACKAGES && \
    cd ~/Folders && \
    perl -0777 -pi -e 's/<PostBuildEvent>.+<\/PostBuildEvent>//gs' Rottytooth.Esolang.Folders.SamplePrograms/Rottytooth.Esolang.Folders.SamplePrograms.csproj && \
    perl -0777 -pi -e 's/results.Errors.Count == 0/true/g' Rottytooth.Esolang.Folders/Program.cs && \
    xbuild Rottytooth.Esolang.Folders.sln /p:TargetFrameworkVersion="v4.5" /p:Configuration=Release && \
    apk del $BUILD_PACKAGES && \
    echo -e "#!/bin/sh\ncat -" > /root/cat.sh && \
    chmod +x ~/cat.sh && \
    rm -rf /var/cache/apk/* /tmp/*

COPY script /root/script
COPY disasm /root/script
