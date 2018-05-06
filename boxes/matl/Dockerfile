FROM esolang/octave

RUN git clone --depth 1 https://github.com/lmendo/MATL.git ~/MATL && \
    rm -rf /var/cache/apk/* /tmp/* && \
    ln -s /bin/script /bin/matl && \
    rm /bin/octave

COPY script /bin/script

