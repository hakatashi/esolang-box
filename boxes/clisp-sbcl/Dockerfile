FROM esolang/build-base

RUN apk add --update --no-cache --repository=http://dl-cdn.alpinelinux.org/alpine/edge/testing roswell && \
    ros setup && \
    ln -s /bin/script /bin/clisp-sbcl

COPY script /root/script
