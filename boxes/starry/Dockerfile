FROM esolang/ruby

RUN curl -m $TIMEOUT https://github.com/yhara/esolang-book-sources/raw/master/starry/starry.rb -L -o ~/starry.rb && \
    rm -rf /var/cache/apk/* /tmp/*

COPY script /bin/script

RUN ln -s /bin/script /bin/starry && \
    rm /bin/ruby && \
    chmod 744 /bin -R

WORKDIR /root

CMD [ "script" ]
