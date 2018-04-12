FROM esolang/base

RUN apk add --update openjdk8 openjdk8-jre && \
    rm -rf /var/cache/apk/* /tmp/*

COPY script /bin/script

RUN ln -s /bin/script /bin/java && \
    chmod 744 /bin -R

WORKDIR /root

CMD [ "script" ]
