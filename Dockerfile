FROM ubuntu:16.04
MAINTAINER Koki Takahashi <hakatasiloving@gmail.com>

# Install apt add-apt-repository
RUN apt-get -y update
RUN apt-get install -y software-properties-common

RUN add-apt-repository -y ppa:brightbox/ruby-ng-experimental

# Install apt packages
RUN apt-get -y update
RUN apt-get install -y git build-essential sudo ruby2.4
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Add user 'esolang'
RUN groupadd -g 1000 esolang \
    && useradd -g esolang -G sudo -m -s /bin/bash esolang \
    && echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

COPY assets /home/esolang/assets
RUN chown esolang:esolang /home/esolang/assets -R && chmod 644 /home/esolang/assets -R

COPY bin /home/esolang/bin
RUN chown esolang:esolang /home/esolang/bin -R && chmod 744 /home/esolang/bin -R

USER esolang

ENV PATH $PATH:~/bin

# Install hexagony
RUN git clone --depth 1 https://github.com/m-ender/hexagony.git ~/hexagony

WORKDIR /home/esolang
