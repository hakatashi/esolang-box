FROM alpine:3.19
LABEL maintainer="Koki Takahashi <hakatasiloving@gmail.com>"

RUN apk update && \
    apk upgrade && \
    apk add git curl strace aws-cli

ENV PATH=/bin:$PATH \
    ESOLANG_BOX_VERSION=2.4.0 \
    TIMEOUT=60

COPY script /bin/script

RUN chmod 744 /bin/script

WORKDIR /root

CMD [ "sh" ]
