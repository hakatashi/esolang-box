FROM esolang/ruby

RUN rm /bin/ruby && \
    /usr/local/ruby-2.6.3/bin/gem install rpxem && \
    ln -s /bin/script /bin/pxem

COPY pxem-cli.rb /root/pxem-cli.rb

COPY script /root/script
