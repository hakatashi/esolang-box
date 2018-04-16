FROM esolang/ruby

RUN git clone --depth 1 https://github.com/nefo-mi/Typhon.git ~/Typhon && \
    rm -rf /var/cache/apk/* /tmp/*

COPY script /bin/script

RUN ln -s /bin/script /bin/typhon && \
    rm /bin/ruby && \
    chmod 744 /bin -R

WORKDIR /root

CMD [ "script" ]
