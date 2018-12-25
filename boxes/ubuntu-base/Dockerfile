FROM ubuntu:bionic-20181112
MAINTAINER Koki Takahashi <hakatasiloving@gmail.com>

RUN apt-get -y update && \
    apt-get -y upgrade && \
    apt-get install build-essential curl apt-transport-https -y

ENV PATH=/bin:$PATH \
    TIMEOUT=60

COPY script /bin/script

RUN chmod 744 /bin/script

WORKDIR /root

CMD [ "sh" ]
