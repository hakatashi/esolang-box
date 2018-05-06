FROM esolang/csharp

RUN git clone --depth 1 https://github.com/Timwi/Funciton.git ~/Function && \
    cd ~/Function && \
    xbuild Funciton.sln /p:Configuration=Release && \
    rm -rf /var/cache/apk/* /tmp/* && \
    ln -s /bin/script /bin/function2d && \
    rm /bin/csharp

COPY script /root/script
