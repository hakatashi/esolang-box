FROM esolang/python2

RUN git clone --depth 1 https://github.com/gemdude46/unicat.git ~/unicat

COPY script /bin/script

RUN ln -s /bin/script /bin/unicat && \
    rm /bin/python2 && \
    chmod 744 /bin -R
