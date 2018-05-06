FROM esolang/python3

RUN git clone --depth 1 https://github.com/stestoltz/Width.git ~/Width

COPY script /bin/script

RUN ln -s /bin/script /bin/width && \
    rm /bin/python3 && \
    chmod 744 /bin -R
