FROM ubuntu:16.04
MAINTAINER Koki Takahashi <hakatasiloving@gmail.com>

# Install add-apt-repository
RUN apt-get -y update
RUN apt-get install -y software-properties-common

RUN add-apt-repository -y ppa:brightbox/ruby-ng-experimental

# Install apt packages
RUN apt-get -y update
RUN apt-get install -y git build-essential sudo ruby2.4 curl iputils-ping python
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Add user 'esolang'
RUN groupadd -g 1000 esolang \
    && useradd -g esolang -G sudo -m -s /bin/bash esolang \
    && echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

# Enter into esolang user
USER esolang

# Create saucer for asset files
RUN mkdir -p ~/assets && mkdir -p ~/bin

# Export path
ENV PATH $PATH:/home/esolang/bin

# Set variables about language. This is required by TrumpScript.
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8

# Install hexagony
RUN git clone --depth 1 https://github.com/m-ender/hexagony.git ~/hexagony

# Install unlambda
RUN curl ftp://ftp.madore.org/pub/madore/unlambda/unlambda-2.0.0.tar.gz -o /tmp/unlambda.tar.gz \
    && tar xzf /tmp/unlambda.tar.gz -C /tmp \
    && gcc -O2 -Wall -o ~/bin/unlambda-exec /tmp/unlambda-2.0.0/c-refcnt/unlambda.c

# Install snowman
RUN git clone --depth 1 https://github.com/KeyboardFire/snowman-lang.git ~/snowman \
    && cd ~/snowman/lib \
    && make

# Install rail
RUN cd /tmp \
    && curl http://www.xmission.com/~tyrecius/rail-0.5.tar.gz -LO \
    && tar xzf rail-0.5.tar.gz \
    && cd rail-0.5 \
    && sh compile.sh \
    && cp rail ~/bin/rail-exec

# Install stack cats
RUN git clone --depth 1 https://github.com/m-ender/stackcats.git ~/stackcats

# Install trumpscript
RUN git clone --depth 1 https://github.com/samshadwell/TrumpScript.git ~/TrumpScript

# Install stuck
RUN git clone --depth 1 https://github.com/kade-robertson/stuck.git ~/stuck

# Clean up /tmp
RUN sudo rm -rf /tmp/*

# Copy assets
COPY assets /home/esolang/assets
RUN sudo chown esolang:esolang /home/esolang/assets -R && sudo chmod 744 /home/esolang/assets && sudo chmod 644 /home/esolang/assets/*

COPY bin /home/esolang/bin
RUN sudo chown esolang:esolang /home/esolang/bin -R && sudo chmod 744 /home/esolang/bin -R

WORKDIR /home/esolang
