FROM esolang/python2

RUN git clone --depth 1 https://github.com/kade-robertson/stuck.git ~/stuck && \
    ln -s /bin/script /bin/stuck && \
    rm /bin/python2

COPY script /bin/script

