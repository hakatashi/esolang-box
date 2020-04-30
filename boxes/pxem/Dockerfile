FROM esolang/ruby

RUN rm /bin/ruby && \
    /usr/local/ruby-2.7.1/bin/gem install rpxem && \
    ln -s /bin/script /bin/pxem

COPY pxem-cli.rb /root/pxem-cli.rb

COPY script /root/script
