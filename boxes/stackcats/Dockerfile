FROM esolang/ruby

RUN git clone --depth 1 https://github.com/m-ender/stackcats.git ~/stackcats

COPY script /bin/script

RUN ln -s /bin/script /bin/stackcats && \
    chmod 744 /bin -R
