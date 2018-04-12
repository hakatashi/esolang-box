FROM esolang/ruby

RUN curl -m $TIMEOUT http://www.golfscript.com/golfscript/golfscript.rb -o ~/golfscript.rb

COPY script /bin/script

RUN ln -s /bin/script /bin/golfscript && \
    chmod 744 /bin -R

WORKDIR /root

CMD [ "script" ]
