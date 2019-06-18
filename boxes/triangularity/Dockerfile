FROM esolang/python3

RUN rm /bin/python3 && \
    git clone --depth 1 https://github.com/Mr-Xcoder/Triangularity.git ~/Triangularity && \
    ln -s /bin/script /bin/triangularity

COPY script /root/script
