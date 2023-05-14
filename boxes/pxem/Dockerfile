FROM esolang/ruby

RUN rm /bin/ruby && \
    /usr/local/ruby-latest/bin/gem install rpxem scanf && \
    ln -s /bin/script /bin/pxem

COPY pxem-cli.rb /root/pxem-cli.rb

COPY script /root/script
