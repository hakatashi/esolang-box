FROM esolang/ruby1

RUN curl -m $TIMEOUT http://www.blue.sky.or.jp/grass/grass.rb -o ~/grass.rb

COPY script /bin/script

RUN ln -s /bin/script /bin/grass && \
    chmod 744 /bin -R

WORKDIR /root

CMD [ "script" ]
