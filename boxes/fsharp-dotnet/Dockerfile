FROM esolang/dotnet-base

RUN ln -s /bin/script /bin/fsharp-dotnet &&\
    /root/dotnet-sdk/dotnet new console -lang F# -o /tmp/Proj &&\
    rm -rf /tmp/Proj

COPY Proj.fsproj /tmp/Proj/Proj.fsproj
COPY script /root/script
