FROM alpine:3.7
MAINTAINER Koki Takahashi <hakatasiloving@gmail.com>

RUN apk add --update bash readline busybox busybox-extras && \
    cp /bin/bash /bin/script && \
    ln -s /bin/script /bin/bash-busybox && \
    rm -rf /var/cache/apk/* && \
    rm -rf /etc/terminfo /usr/bin/terminfo /usr/share/terminfo && \
    apk del $(apk info 2> /dev/null | grep -w -v -e readline -e musl -e busybox -e busybox-extras)

ENV PATH=/bin:$PATH

WORKDIR /

CMD [ "script" ]
