FROM esolang/csharp

ENV BUILD_PACKAGES="perl" \
    RUNTIME_PACKAGES=""

RUN git clone --depth 1 https://github.com/rottytooth/Folders.git ~/Folders
COPY folders.cs /root/Folders/Rottytooth.Esolang.Folders.SamplePrograms/Program.cs

RUN apk add $BUILD_PACKAGES $RUNTIME_PACKAGES && \
    cd ~/Folders && \
    perl -0777 -pi -e 's/<PostBuildEvent>.+<\/PostBuildEvent>//gs' Rottytooth.Esolang.Folders.SamplePrograms/Rottytooth.Esolang.Folders.SamplePrograms.csproj && \
    perl -0777 -pi -e 's/results.Errors.Count == 0/true/g' Rottytooth.Esolang.Folders/Program.cs && \
    xbuild Rottytooth.Esolang.Folders.sln /p:TargetFrameworkVersion="v4.5" /p:Configuration=Release && \
    apk del $BUILD_PACKAGES && \
    rm -rf /var/cache/apk/* /tmp/*

RUN ln -s /bin/script /bin/concise-folders

COPY script /root/script
COPY disasm /root/disasm
