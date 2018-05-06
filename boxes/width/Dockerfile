FROM esolang/python3

RUN git clone --depth 1 https://github.com/stestoltz/Width.git ~/Width && \
    ln -s /bin/script /bin/width && \
    rm /bin/python3

COPY script /root/script
