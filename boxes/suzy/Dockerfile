FROM esolang/python2

RUN git clone --depth 1 https://github.com/gvx/suzy.git ~/suzy

COPY script /bin/script

RUN ln -s /bin/script /bin/suzy && \
    rm /bin/python2 && \
    chmod 744 /bin -R
