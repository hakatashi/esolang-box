FROM esolang/csharp

RUN git clone --depth 1 https://github.com/Timwi/Funciton.git ~/Function && \
    cd ~/Function && \
    xbuild Funciton.sln /p:Configuration=Release && \
    rm -rf /var/cache/apk/* /tmp/*

COPY script /bin/script

RUN ln -s /bin/script /bin/function2d && \
    rm /bin/csharp && \
    chmod 744 /bin -R

WORKDIR /root

CMD [ "script" ]
