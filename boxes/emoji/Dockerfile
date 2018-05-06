FROM esolang/python3

RUN git clone --depth 1 https://github.com/vpzomtrrfrt/emoji.py.git ~/emoji.py

COPY script /bin/script

RUN ln -s /bin/script /bin/emoji && \
    rm /bin/python3 && \
    chmod 744 /bin -R
