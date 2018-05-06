FROM esolang/ruby1

RUN curl -m $TIMEOUT http://www.blue.sky.or.jp/grass/grass.rb -o ~/grass.rb && \
    ln -s /bin/script /bin/grass

COPY script /bin/script

