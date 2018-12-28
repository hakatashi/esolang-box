FROM esolang/erlang

RUN apk add --update elixir && \
    rm -rf /var/cache/apk/* /tmp/* && \
    ln -s /bin/script /bin/elixir

COPY script /root/script
