FROM esolang/lua

RUN git clone --depth 1 https://github.com/TehFlaminTaco/Reverse-Programmer-Notation.git ~/Reverse-Programmer-Notation

COPY script /bin/script

RUN ln -s /bin/script /bin/rprogn && \
    rm /bin/lua && \
    chmod 744 /bin -R

WORKDIR /root

CMD [ "script" ]
