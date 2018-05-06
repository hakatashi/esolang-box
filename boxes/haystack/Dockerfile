FROM esolang/python2

RUN git clone --depth 1 https://github.com/kade-robertson/haystack.git ~/haystack && \
    ln -s /bin/script /bin/haystack && \
    rm /bin/python2

COPY script /root/script
