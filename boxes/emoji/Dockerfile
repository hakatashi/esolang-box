FROM esolang/python3

RUN git clone --depth 1 https://github.com/vpzomtrrfrt/emoji.py.git ~/emoji.py && \
    ln -s /bin/script /bin/emoji && \
    rm /bin/python3

COPY script /bin/script

