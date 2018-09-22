FROM esolang/python3

RUN apk add --update py3-pillow && \
    git clone --depth 1 https://github.com/Liesegang/picfunge.git ~/picfunge && \
    rm -rf /var/cache/apk/* /tmp/* && \
    ln -s /bin/script /bin/picfunge

COPY script /root/script
