FROM ubuntu:resolute
LABEL maintainer="Koki Takahashi <hakatasiloving@gmail.com>"

RUN apt-get -y update && \
    apt-get -y upgrade && \
    apt-get install build-essential curl apt-transport-https strace unzip time -y && \
    mv /bin/script /bin/script.original

ENV PATH=/bin:$PATH \
    TIMEOUT=60

COPY script /bin/script

RUN chmod 744 /bin/script

WORKDIR /root

CMD [ "sh" ]
