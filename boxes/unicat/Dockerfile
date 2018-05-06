FROM esolang/python2

RUN git clone --depth 1 https://github.com/gemdude46/unicat.git ~/unicat && \
    ln -s /bin/script /bin/unicat && \
    rm /bin/python2

COPY script /root/script
