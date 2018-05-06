FROM esolang/java

RUN curl -m $TIMEOUT http://www.dangermouse.net/esoteric/Whenever.jar -L -o /tmp/Whenever.jar && \
    mkdir -p ~/Whenever && \
    unzip /tmp/Whenever.jar -d ~/Whenever && \
    rm -rf /var/cache/apk/* /tmp/* && \
    ln -s /bin/script /bin/whenever && \
    rm /bin/java

COPY script /root/script
