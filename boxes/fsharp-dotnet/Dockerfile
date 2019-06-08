FROM esolang/dotnet

RUN ln -s /bin/script /bin/fsharp-dotnet &&\
    ./dotnet new console -lang F# -o /tmp/Proj &&\
    rm -rf /tmp/Proj

COPY script /root/script
