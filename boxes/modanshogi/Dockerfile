FROM esolang/ruby1

RUN git clone --depth 1 https://github.com/yhara/ShogiModan.git ~/ShogiModan && \
    ln -s /bin/script /bin/modanshogi && \
    rm /bin/ruby1

COPY script /bin/script

