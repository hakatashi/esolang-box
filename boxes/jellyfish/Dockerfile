FROM esolang/python3

RUN git clone --depth 1 https://github.com/iatorm/jellyfish.git ~/jellyfish && \
    ln -s /bin/script /bin/jellyfish && \
    rm /bin/python3

COPY script /root/script
