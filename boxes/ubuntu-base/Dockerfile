FROM ubuntu:jammy
LABEL maintainer="Koki Takahashi <hakatasiloving@gmail.com>"

RUN apt-get -y update && \
    apt-get -y upgrade && \
    apt-get install build-essential curl apt-transport-https strace unzip -y

ENV PATH=/bin:$PATH \
    TIMEOUT=60

COPY script /bin/script

RUN chmod 744 /bin/script

RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
    unzip awscliv2.zip && \
    ./aws/install && \
    rm -rf awscliv2.zip aws

WORKDIR /root

CMD [ "sh" ]
