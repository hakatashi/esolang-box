FROM esolang/dotnet-base

RUN ln -s /bin/script /bin/csharp-dotnet &&\
    /root/dotnet-sdk/dotnet new console -o /tmp/Proj &&\
    rm -rf /tmp/Proj

COPY script /root/script
