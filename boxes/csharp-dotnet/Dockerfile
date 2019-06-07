FROM esolang/dotnet

RUN ln -s /bin/script /bin/csharp-dotnet &&\
    ./dotnet new console -o /tmp/Proj &&\
    rm -rf /tmp/Proj

COPY script /root/script
