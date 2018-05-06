FROM esolang/ruby

RUN curl -m $TIMEOUT http://www.golfscript.com/golfscript/golfscript.rb -o ~/golfscript.rb && \
    ln -s /bin/script /bin/golfscript

COPY script /root/script
