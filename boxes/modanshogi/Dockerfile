FROM esolang/ruby1

RUN git clone --depth 1 https://github.com/yhara/ShogiModan.git ~/ShogiModan

COPY script /bin/script

RUN ln -s /bin/script /bin/modanshogi && \
    rm /bin/ruby1 && \
    chmod 744 /bin -R

WORKDIR /root

CMD [ "script" ]
