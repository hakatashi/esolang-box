FROM esolang/php

RUN mkdir -p ~/irc && \
    curl -m $TIMEOUT http://viewsourcecode.org/code/php/irc.phps -L -o ~/irc/irc.phps && \
    rm -rf /var/cache/apk/* /tmp/*

COPY main.irc /root/irc/main.irc

COPY script /bin/script

RUN ln -s /bin/script /bin/irc && \
    rm /bin/php && \
    chmod 744 /bin -R
