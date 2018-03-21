FROM alpine:3.7
MAINTAINER Koki Takahashi <hakatasiloving@gmail.com>

RUN apk update && \
    apk upgrade && \
    apk add git curl

ENV PATH=/bin:$PATH \
    TIMEOUT=60
