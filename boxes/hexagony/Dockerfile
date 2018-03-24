FROM esolang/ruby

RUN git clone --depth 1 https://github.com/m-ender/hexagony.git ~/hexagony

COPY script /bin/script

RUN ln -s /bin/script /bin/hexagony && \
    chmod 744 /bin -R

WORKDIR /root

CMD [ "script" ]
