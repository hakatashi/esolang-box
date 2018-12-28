FROM esolang/ruby

RUN /usr/local/ruby-2.6.0/bin/gem install bundler && \
    git clone --depth 1 https://github.com/yhara/ppap-lang.git ~/ppap-lang && \
    cd ~/ppap-lang && \
    echo "source 'https://rubygems.org'" >> Gemfile && \
    /usr/local/ruby-2.6.0/bin/bundle install && \
    rm -rf /var/cache/apk/* /tmp/* && \
    ln -s /bin/script /bin/ppap && \
    rm /bin/ruby

COPY script /root/script
