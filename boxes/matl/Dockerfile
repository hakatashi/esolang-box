FROM esolang/octave

RUN git clone --depth 1 https://github.com/lmendo/MATL.git ~/MATL && \
    rm -rf /var/cache/apk/* /tmp/*

COPY script /bin/script

RUN ln -s /bin/script /bin/matl && \
    rm /bin/octave && \
    chmod 744 /bin -R

WORKDIR /root

CMD [ "script" ]
