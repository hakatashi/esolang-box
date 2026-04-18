FROM esolang/dotnet-base

COPY Funciton.csproj /tmp/

RUN git clone --depth 1 https://codeberg.org/Timwi/Funciton.git ~/Function && \
    cd ~/Function/Src && \
    mv /tmp/Funciton.csproj . && \
    /root/dotnet-sdk/dotnet publish -c Release -o ~/Function/out && \
    rm -rf ~/.nuget /tmp/* && \
    ln -s /bin/script /bin/function2d

COPY script /root/script
