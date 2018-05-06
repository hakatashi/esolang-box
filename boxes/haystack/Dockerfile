FROM esolang/python2

RUN git clone --depth 1 https://github.com/kade-robertson/haystack.git ~/haystack

COPY script /bin/script

RUN ln -s /bin/script /bin/haystack && \
    rm /bin/python2 && \
    chmod 744 /bin -R
