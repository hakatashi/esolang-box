FROM ubuntu:16.04
MAINTAINER Koki Takahashi <hakatasiloving@gmail.com>

# Install apt packages
RUN apt-get -y update
RUN apt-get install -y git build-essential sudo software-properties-common
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Add user 'esolang'
RUN groupadd -g 1000 esolang \
    && useradd -g esolang -G sudo -m -s /bin/bash esolang \
    && echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

USER esolang

WORKDIR /home/esolang
