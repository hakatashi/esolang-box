FROM esolang/ruby

RUN apk add --update libssl1.0 && \
    /usr/local/ruby-2.5.0/bin/gem install bundler && \
    git clone --depth 1 https://github.com/yhara/ppap-lang.git ~/ppap-lang && \
    cd ~/ppap-lang && \
    echo "source 'https://rubygems.org'" >> Gemfile && \
    /usr/local/ruby-2.5.0/bin/bundle install && \
    rm -rf /var/cache/apk/* /tmp/*

COPY script /bin/script

RUN ln -s /bin/script /bin/ppap && \
    rm /bin/ruby && \
    chmod 744 /bin -R
