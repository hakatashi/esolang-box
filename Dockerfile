FROM ubuntu:xenial-20170119
MAINTAINER Koki Takahashi <hakatasiloving@gmail.com>

# Install add-apt-repository
RUN apt-get -y update
RUN apt-get install -y software-properties-common

RUN add-apt-repository -y ppa:brightbox/ruby-ng-experimental

# Install apt packages
RUN apt-get -y update
RUN apt-get install -y git build-essential sudo ruby2.4 curl iputils-ping python python3 default-jre default-jdk ncurses-dev libncurses-dev cmake libgd-dev libpng-dev libgif-dev haskell-platform ruby1.8 vim zip libdigest-crc-perl nodejs npm
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Set up locale. This is mainly required by TrumpScript.
# http://serverfault.com/a/689947
RUN sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen \
    && echo 'LANG="en_US.UTF-8"' > /etc/default/locale \
    && dpkg-reconfigure --frontend=noninteractive locales \
    && update-locale LANG=en_US.UTF-8

# Add user 'esolang'
RUN groupadd -g 1000 esolang \
    && useradd -g esolang -G sudo -m -s /bin/bash esolang \
    && echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

# Switch to the latest version of Node.js
RUN npm install n -g && n latest

# Enter into esolang user
USER esolang

# Create saucer for asset files
RUN mkdir -p ~/assets && mkdir -p ~/bin && mkdir -p ~/interpreters

# Export path
ENV PATH /home/esolang/bin:$PATH

# Install hexagony
RUN git clone --depth 1 https://github.com/m-ender/hexagony.git ~/interpreters/hexagony

# Install unlambda
RUN curl -m 30 ftp://ftp.madore.org/pub/madore/unlambda/unlambda-2.0.0.tar.gz -o /tmp/unlambda.tar.gz \
    && tar xzf /tmp/unlambda.tar.gz -C /tmp \
    && gcc -O2 -Wall -o ~/interpreters/unlambda /tmp/unlambda-2.0.0/c-refcnt/unlambda.c

# Install snowman
RUN git clone --depth 1 https://github.com/KeyboardFire/snowman-lang.git ~/interpreters/snowman \
    && cd ~/interpreters/snowman/lib \
    && make

# Install rail
RUN cd /tmp \
    && curl -m 30 http://www.xmission.com/~tyrecius/rail-0.5.tar.gz -LO \
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
RUN curl -m 30 http://lhartikk.github.io/ArnoldC.jar -o ~/interpreters/ArnoldC.jar

# Install Evil
RUN cd /tmp \
    && curl -G "http://www.theopenproxy.net/browse.php" \
            -H "Referer: http://www.theopenproxy.net/" \
            --data-urlencode "u=http://web.archive.org/web/20070906133127/http://www1.pacific.edu/~twrensch/evil/evil.java" \
            -o evil.java \
            -m 30 -L \
    && javac evil.java \
    && mv evil.class ~/interpreters

# Install Haystack
RUN git clone --depth 1 https://github.com/kade-robertson/haystack.git ~/interpreters/haystack

# Install Befunge-98
RUN cd /tmp \
    && curl -m 30 https://sourceforge.net/projects/cfunge/files/cfunge/0.9.0/cfunge-0.9.0.tar.bz2 -LO \
    && tar xjf cfunge-0.9.0.tar.bz2 \
    && cd cfunge-0.9.0 \
    && mkdir build \
    && cd build \
    && cmake .. \
    && make \
    && mv cfunge ~/interpreters

# Install Seed
COPY implementations/seed.py /home/esolang/interpreters/seed.py

# Install piet
RUN cd /tmp \
    && curl -m 30 http://www.bertnase.de/npiet/npiet-1.3e.tar.gz -O \
    && tar xzf npiet-1.3e.tar.gz \
    && cd npiet-1.3e \
    && ./configure \
    && make npiet \
    && mv npiet ~/interpreters

# Install slashes
COPY implementations/slashes.pl /home/esolang/interpreters/slashes.pl

# Install Axo
RUN cd /tmp \
    && curl -G "http://www.theopenproxy.net/browse.php" \
            -H "Referer: http://www.theopenproxy.net/" \
            --data-urlencode "u=http://web.archive.org/web/20070423184121/http://www.harderweb.de/jix/langs/axo/axopp.0.1.0.cc" \
            -o axopp.0.1.0.cc \
            -m 30 -L \
    && sed -i -e 's/sranddev()/srand(time(NULL))/' axopp.0.1.0.cc \
    && g++ -O2 -Wall axopp.0.1.0.cc -o axopp -include stdlib.h \
    && mv axopp ~/interpreters

# Install GOTO 10
RUN cd /tmp \
    && curl -m 30 https://github.com/qpliu/esolang/raw/master/goto10/hs/goto10.hs -LO \
    && ghc goto10.hs -o goto10 \
    && mv goto10 ~/interpreters

# Install Unicat
RUN git clone --depth 1 https://github.com/gemdude46/unicat.git ~/interpreters/unicat

# Install Toadskin
RUN cd /tmp \
    && curl -G "http://www.theopenproxy.net/browse.php" \
            -H "Referer: http://www.theopenproxy.net/" \
            --data-urlencode "u=http://web.archive.org/web/20110708001349/http://www.billglover.com/software/toadskin/toadskin-1_0_1.tgz" \
            -o toadskin-1_0_1.tgz \
            -m 30 -L \
    && tar xzf toadskin-1_0_1.tgz \
    && cd toadskin \
    && gcc -O2 -Wall c/toadskin.c -o toadskin \
    && mv toadskin ~/interpreters

# Install Python 1
RUN cd /tmp \
    && curl -m 30 http://legacy.python.org/download/releases/src/python1.0.1.tar.gz -LO \
    && tar xzf python1.0.1.tar.gz \
    && cd python-1.0.1 \
    && sed -i 's/^getline/my_getline/' Objects/fileobject.c \
    && sed -i 's/ getline/ my_getline/' Objects/fileobject.c \
    && ./configure \
    && make \
    && mv python ~/interpreters/python1.0.1

# Install Malbolge
RUN cd /tmp \
    && curl -m 30 http://esoteric.sange.fi/orphaned/malbolge/malbolge.c -LO \
    && gcc -O2 -Wall malbolge.c -o malbolge \
    && mv malbolge ~/interpreters

# Install Dis
RUN cd /tmp \
    && curl -G "http://www.theopenproxy.net/browse.php" \
            -H "Referer: http://www.theopenproxy.net/" \
            --data-urlencode "u=http://web.archive.org/web/20031209180058/http://www.mines.edu/students/b/bolmstea/malbolge/dis.tar.gz" \
            -o dis.tar.gz \
            -m 30 -L \
    && tar xzf dis.tar.gz \
    && gcc -O2 -Wall dis/dis.c -o dis.out \
    && mv dis.out ~/interpreters/dis

# Install Unreadable
COPY implementations/unreadable.py /home/esolang/interpreters/unreadable.py

# Install Grass
RUN curl -m 30 http://www.blue.sky.or.jp/grass/grass.rb -o ~/interpreters/grass.rb

# Install Brainfuck
RUN git clone --depth 1 https://github.com/lifthrasiir/esotope-bfc.git ~/interpreters/esotope-bfc

# Install goruby
RUN cd /tmp \
    && curl -m 30 https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0.tar.gz -O \
    && tar xzf ruby-2.4.0.tar.gz \
    && cd ruby-2.4.0 \
    && ./configure \
    && make golf \
    && cp goruby ~/interpreters/goruby

# Install GolfScript
RUN curl -m 30 http://www.golfscript.com/golfscript/golfscript.rb -o ~/interpreters/golfscript.rb

# Install Befunge-93
RUN cd /tmp \
    && curl -m 30 http://catseye.tc/distfiles/befunge-93-2.23-2015.0101.zip -LO \
    && unzip befunge-93-2.23-2015.0101.zip \
    && cd befunge-93-2.23-2015.0101 \
    && make \
    && mv bin/bef ~/interpreters/bef

# Install Glass
RUN cd /tmp \
    && curl -m 30 http://codu.org/eso/glass/glass-0.12.tar.bz2 -LO \
    && tar xjf glass-0.12.tar.bz2 \
    && cd glass-0.12 \
    && make CXXFLAGS="-O2 -g -include stdio.h -include string.h" \
    && mv glass ~/interpreters/glass

# Install ZOMBIE
RUN curl -m 30 https://github.com/graue/esofiles/raw/master/zombie/impl/zombie.py -L -o ~/interpreters/zombie.py

# Install 05AB1E
RUN git clone --depth 1 https://github.com/Adriandmen/05AB1E.git ~/interpreters/05AB1E

# Install 2sable
RUN git clone --depth 1 https://github.com/Adriandmen/2sable.git ~/interpreters/2sable

# Install 3var
RUN cd /tmp \
    && git clone --depth 1 https://github.com/olls/3var-interpreter.git \
    && cd 3var-interpreter \
    && make \
    && cp 3var ~/interpreters/3var

# Install ><>
RUN curl -m 30 https://gist.github.com/anonymous/6392418/raw/3b16018cb47f2f9ad1fa085c155cc5c0dc448b2d/fish.py -L -o ~/interpreters/fish.py

# Install Arcyóu
RUN git clone --depth 1 https://github.com/Nazek42/arcyou.git ~/interpreters/arcyou

# Install Emoji
RUN git clone --depth 1 https://github.com/vpzomtrrfrt/emoji.py.git ~/interpreters/emoji.py

# Install Beam
RUN git clone --depth 1 https://github.com/ETHproductions/beam-js.git ~/interpreters/beam-js
COPY implementations/beam.js /home/esolang/interpreters/beam.js

# Install Zucchini
RUN curl -m 30 http://pastebin.ca/raw/2313538 -L -o ~/interpreters/zucchini.py

# Clean up /tmp
RUN sudo rm -rf /tmp/*

ARG debug

# Remove the packages that matters only when build
RUN if [ -z ${debug:+true} ]; then \
        sudo apt-get remove --purge -y git build-essential curl default-jdk ncurses-dev libncurses-dev cmake haskell-platform software-properties-common zip nodejs npm; \
        sudo apt-get autoremove -y; \
    else \
        sudo apt-get update -y; \
    fi

# Copy assets
COPY assets /home/esolang/assets
RUN sudo chown esolang:esolang /home/esolang/assets -R && sudo chmod 744 /home/esolang/assets && sudo chmod 644 /home/esolang/assets/*

COPY bin /home/esolang/bin
RUN sudo chown esolang:esolang /home/esolang/bin -R && sudo chmod 744 /home/esolang/bin -R

WORKDIR /home/esolang
