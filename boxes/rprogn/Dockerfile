FROM esolang/lua

RUN git clone --depth 1 https://github.com/TehFlaminTaco/Reverse-Programmer-Notation.git ~/Reverse-Programmer-Notation && \
    ln -s /bin/script /bin/rprogn && \
    rm /bin/lua

COPY script /root/script
