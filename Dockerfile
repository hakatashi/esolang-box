FROM ubuntu:16.04
MAINTAINER Koki Takahashi <hakatasiloving@gmail.com>

# Install add-apt-repository
RUN apt-get -y update
RUN apt-get install -y software-properties-common

RUN add-apt-repository -y ppa:brightbox/ruby-ng-experimental

# Install apt packages
RUN apt-get -y update
RUN apt-get install -y git build-essential sudo ruby2.4 curl iputils-ping python default-jre default-jdk ncurses-dev libncurses-dev cmake
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Add user 'esolang'
RUN groupadd -g 1000 esolang \
    && useradd -g esolang -G sudo -m -s /bin/bash esolang \
    && echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

# Enter into esolang user
USER esolang

# Create saucer for asset files
RUN mkdir -p ~/assets && mkdir -p ~/bin && mkdir -p ~/interpreters

# Export path
ENV PATH $PATH:/home/esolang/bin

# Set up locale. This is mainly required by TrumpScript.
# http://serverfault.com/a/689947
RUN sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen \
    && echo 'LANG="en_US.UTF-8"' > /etc/default/locale \
    && dpkg-reconfigure --frontend=noninteractive locales \
    && update-locale LANG=en_US.UTF-8

# Install hexagony
RUN git clone --depth 1 https://github.com/m-ender/hexagony.git ~/interpreters/hexagony

# Install unlambda
RUN curl ftp://ftp.madore.org/pub/madore/unlambda/unlambda-2.0.0.tar.gz -o /tmp/unlambda.tar.gz \
    && tar xzf /tmp/unlambda.tar.gz -C /tmp \
    && gcc -O2 -Wall -o ~/interpreters/unlambda /tmp/unlambda-2.0.0/c-refcnt/unlambda.c

# Install snowman
RUN git clone --depth 1 https://github.com/KeyboardFire/snowman-lang.git ~/interpreters/snowman \
    && cd ~/interpreters/snowman/lib \
    && make

# Install rail
RUN cd /tmp \
    && curl http://www.xmission.com/~tyrecius/rail-0.5.tar.gz -LO \
    && tar xzf rail-0.5.tar.gz \
    && cd rail-0.5 \
    && sh compile.sh \
    && cp rail ~/interpreters/rail

# Install stack cats
RUN git clone --depth 1 https://github.com/m-ender/stackcats.git ~/interpreters/stackcats

# Install trumpscript
RUN git clone --depth 1 https://github.com/samshadwell/TrumpScript.git ~/interpreters/TrumpScript

# Install stuck
RUN git clone --depth 1 https://github.com/kade-robertson/stuck.git ~/interpreters/stuck

# Install ArnoldC
RUN curl http://lhartikk.github.io/ArnoldC.jar -o ~/interpreters/ArnoldC.jar

# Install Evil
RUN cd /tmp \
    && curl https://web.archive.org/web/20070906133127/http://www1.pacific.edu/~twrensch/evil/evil.java -O \
    && javac evil.java \
    && mv evil.class ~/interpreters

# Install Haystack
RUN git clone --depth 1 https://github.com/kade-robertson/haystack.git ~/interpreters/haystack

# Install Befunge-98
RUN cd /tmp \
    && curl https://sourceforge.net/projects/cfunge/files/cfunge/0.9.0/cfunge-0.9.0.tar.bz2 -LO \
    && tar xjf cfunge-0.9.0.tar.bz2 \
    && cd cfunge-0.9.0 \
    && mkdir build \
    && cd build \
    && cmake .. \
    && make \
    && mv cfunge ~/interpreters

# Install Seed
COPY implementations/seed.py /home/esolang/interpreters/seed.py

# Intermediate package install instruction
RUN sudo apt-get -y update
RUN sudo apt-get install -y libgd-dev libpng-dev libgif-dev

# Install piet
RUN cd /tmp \
    && curl http://www.bertnase.de/npiet/npiet-1.3e.tar.gz -O \
    && tar xzf npiet-1.3e.tar.gz \
    && cd npiet-1.3e \
    && ./configure \
    && make npiet \
    && mv npiet ~/interpreters

# Clean up /tmp
RUN sudo rm -rf /tmp/*

# Copy assets
COPY assets /home/esolang/assets
RUN sudo chown esolang:esolang /home/esolang/assets -R && sudo chmod 744 /home/esolang/assets && sudo chmod 644 /home/esolang/assets/*

COPY bin /home/esolang/bin
RUN sudo chown esolang:esolang /home/esolang/bin -R && sudo chmod 744 /home/esolang/bin -R

WORKDIR /home/esolang
