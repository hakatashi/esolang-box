FROM alpine:edge
MAINTAINER Koki Takahashi <hakatasiloving@gmail.com>

RUN apk update && \
    apk upgrade && \
    apk add git curl

ENV PATH=/bin:$PATH \
    TIMEOUT=60

COPY script /bin/script

RUN chmod 744 /bin/script

WORKDIR /root

CMD [ "sh" ]
