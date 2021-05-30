FROM esolang/dotnet-base

RUN ln -s /bin/script /bin/visualbasic-dotnet &&\
    /root/dotnet-sdk/dotnet new console -lang VB -o /tmp/Proj &&\
    rm -rf /tmp/Proj

COPY script /root/script
