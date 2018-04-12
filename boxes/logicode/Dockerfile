FROM esolang/python2

RUN git clone --depth 1 https://github.com/LogicodeLang/Logicode.git ~/Logicode && \
    rm -rf /var/cache/apk/* /tmp/*

COPY script /bin/script

RUN ln -s /bin/script /bin/logicode && \
    rm /bin/python2 && \
    chmod 744 /bin -R

WORKDIR /root

CMD [ "script" ]
