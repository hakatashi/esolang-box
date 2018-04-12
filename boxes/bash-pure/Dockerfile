FROM alpine:3.7
MAINTAINER Koki Takahashi <hakatasiloving@gmail.com>

RUN apk add --update bash readline && \
    cp /bin/bash /bin/script && \
    ln -s /bin/script /bin/bash-pure && \
    rm -rf /var/cache/apk/* && \
    rm -rf /etc/terminfo /usr/bin/terminfo /usr/share/terminfo && \
    (find /usr/local/bin /usr/sbin /usr/bin /sbin /bin -type l | grep -w -v -e grep -e bash-pure | xargs rm -f) && \
    apk del $(apk info 2> /dev/null | grep -v -e readline -e musl)

ENV PATH=/bin

WORKDIR /

CMD [ "script" ]
