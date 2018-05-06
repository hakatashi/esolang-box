FROM esolang/php

RUN mkdir -p ~/irc && \
    curl -m $TIMEOUT http://viewsourcecode.org/code/php/irc.phps -L -o ~/irc/irc.phps && \
    rm -rf /var/cache/apk/* /tmp/* && \
    ln -s /bin/script /bin/irc && \
    rm /bin/php

COPY main.irc /root/irc/main.irc

COPY script /root/script
