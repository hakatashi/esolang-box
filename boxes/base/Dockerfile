FROM alpine:3.22.4
LABEL maintainer="Koki Takahashi <hakatasiloving@gmail.com>"

RUN apk update && \
    apk upgrade && \
    apk add git curl strace

ENV PATH=/bin:$PATH \
    ESOLANG_BOX_VERSION=2.5.0 \
    TIMEOUT=60

COPY script /bin/script

RUN chmod 744 /bin/script

WORKDIR /root

CMD [ "sh" ]
