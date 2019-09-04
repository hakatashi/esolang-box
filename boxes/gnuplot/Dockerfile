FROM esolang/base

RUN apk add --update gnuplot && \
    rm -rf /var/cache/apk/* /tmp/* && \
    ln -s /bin/script /bin/gnuplot

COPY script /root/script
