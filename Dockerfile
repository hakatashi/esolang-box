FROM ubuntu:xenial-20170119
MAINTAINER Koki Takahashi <hakatasiloving@gmail.com>

# Install add-apt-repository
RUN apt-get -y update
RUN apt-get install -y software-properties-common

RUN add-apt-repository -y ppa:brightbox/ruby-ng-experimental
RUN add-apt-repository -y ppa:octave/stable

# Install apt packages
RUN apt-get -y update
RUN apt-get install -y git build-essential sudo ruby2.4 curl iputils-ping python python3 default-jre default-jdk ncurses-dev libncurses-dev cmake libgd-dev libpng-dev libgif-dev haskell-platform ruby1.8 vim zip libdigest-crc-perl nodejs npm recode python-pip libc6-dev-i386 bison flex libboost-dev mono-runtime mono-xbuild mono-mcs python3-pip octave php gdc
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

RUN pip install --upgrade pip \
    && pip install pyparsing \
    && pip3 install numpy sympy

RUN gem2.4 install bundler

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
    && curl -m 30 "https://gist.github.com/satos---jp/16b0b863651178e7c33a9bec8dc9b538/raw/3f0788f6030cbcf1c25d405eb97946c72c5f0144/evli_interpreter_wopen_bug_fixed.java" -L -o evil.java \
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
    && curl -m 30 "http://web.archive.org/web/20070423184121/http://www.harderweb.de/jix/langs/axo/axopp.0.1.0.cc" -LO \
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
    && curl -m 30 "http://web.archive.org/web/20110708001349/http://www.billglover.com/software/toadskin/toadskin-1_0_1.tgz" -LO \
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
    && curl -m 30 "http://web.archive.org/web/20031209180058/http://www.mines.edu/students/b/bolmstea/malbolge/dis.tar.gz" -LO \
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

# Install Wierd
RUN cd /tmp \
    && git clone --depth 1 https://github.com/catseye/Wierd.git Wierd \
    && cd Wierd/dialect/wierd-jnc \
    && make \
    && cp bin/wierd-jnc ~/interpreters/wierd-jnc

# Install Word!CPU
RUN cd /tmp \
    && curl -m 30 "https://esolangs.org/wiki/User:Marinus/Word%21CPU_interpreter" -L | awk -F "</?pre>" '{print $2}' RS=".{999999}" | recode HTML > wordcpu.c \
    && gcc -Wall -O2 wordcpu.c -o wordcpu \
    && cp wordcpu ~/interpreters/wordcpu

# Install Foobar and Foobaz and Barbaz, oh my!
RUN curl -m 30 "https://web-beta.archive.org/web/20170104020522/https://esolangs.org/wiki/User:Sgeo/ffbimp" -L \
    | awk -F "</?pre>" '{print $2}' RS=".{999999}" | recode HTML..u8 > ~/interpreters/ffb.py

# Install Fugue
RUN cd /tmp \
    && curl -m 30 https://github.com/graue/esofiles/raw/master/fugue/impl/fugue_x86.c -LO \
    && sed -i -e "s/stricmp/strcasecmp/" fugue_x86.c \
    && gcc -Wall -O2 fugue_x86.c -o fugue \
    && mv fugue ~/interpreters/fugue

# Install Aheui
RUN cd /tmp \
    && git clone --depth 1 https://github.com/aheui/caheui.git \
    && cd caheui \
    && make \
    && mv aheui ~/interpreters/aheui

# Install ModanShogi
RUN git clone --depth 1 https://github.com/yhara/ShogiModan.git ~/interpreters/ShogiModan

# Install PPAP
RUN git clone --depth 1 https://github.com/yhara/ppap-lang.git ~/interpreters/ppap-lang \
    && cd ~/interpreters/ppap-lang \
    && echo "source 'https://rubygems.org'" >> Gemfile \
    && bundle install

# Install Streem
RUN cd /tmp \
    && git clone --depth 1 https://github.com/matz/streem.git \
    && cd streem \
    && make \
    && mv bin/streem ~/interpreters/streem

# Install Starry
RUN curl -m 30 https://github.com/yhara/esolang-book-sources/raw/master/starry/starry.rb -L -o ~/interpreters/starry.rb

# Install Whitespace
RUN cd /tmp \
    && curl https://github.com/hostilefork/whitespacers/raw/master/c/whitespace.c -LO \
    && gcc -Wall -O2 whitespace.c -o whitespace \
    && mv whitespace ~/interpreters/whitespace

# Install Aubergine
RUN curl -m 30 "https://web-beta.archive.org/web/20170103234403/https://esolangs.org/wiki/Aubergine/aubergine.py" -L \
    | awk -F "</?pre>" '{print $2}' RS=".{999999}" | recode HTML..u8 > ~/interpreters/aubergine.py

# Install UberGenes
RUN curl -m 30 "https://web-beta.archive.org/web/20170103072709/https://esolangs.org/wiki/UberGenes" -L \
    | awk -F "</?pre>" '{print $10}' RS=".{999999}" | recode HTML..u8 > ~/interpreters/ubergenes.py

# Install PATH
RUN cd /tmp \
    && curl -m 30 https://sourceforge.net/projects/pathlang/files/PATH/0.33/path-0.33.tar.gz -LO \
    && mkdir -p ~/interpreters/path \
    && tar xzf path-0.33.tar.gz -C ~/interpreters/path

# Install Floater
RUN git clone --depth 1 https://github.com/Zom-B/Floater.git ~/interpreters/Floater \
    && cd ~/interpreters/Floater \
    && javac -encoding UTF-8 `find . -name "*.java"`

# Install Recurse
RUN curl -m 30 https://www.csh.rit.edu/~pat/hack/quickies/recurse/recurse.py -L -o ~/interpreters/recurse.py

# Install Beatnik
RUN curl -m 30 https://github.com/graue/esofiles/raw/master/beatnik/impl/BEATNIK.c -L -o /tmp/BEATNIK.c \
    && gcc -Wall -O2 /tmp/BEATNIK.c -o ~/interpreters/BEATNIK

# Install Binary lambda calculus
RUN cd /tmp \
    && mkdir -p blc \
    && cd blc \
    && curl -m 30 http://www.ioccc.org/2012/tromp/Makefile -LO \
    && curl -m 30 http://www.ioccc.org/2012/tromp/tromp.c -LO \
    && make tromp64 \
    && mv tromp64 ~/interpreters/tromp64

# Install Z80golf
RUN cd /tmp \
    && curl -m 30 http://golf.shinh.org/z80golf.tgz -LO \
    && tar xzf z80golf.tgz \
    && cd z80golf/src \
    && make \
    && mv z80golf ~/interpreters/z80golf

# Install Cardinal
RUN curl -m 30 https://gist.github.com/kurgm/c5d7eedcd773d707d98cfaf363926274/raw/560d5d94534cb8f512077d3d69ee2abef8bebf35/cardinal.py -L -o ~/interpreters/cardinal.py

# Install CJam
RUN curl -m 30 https://sourceforge.net/projects/cjam/files/cjam-0.6.5/cjam-0.6.5.jar -L -o ~/interpreters/cjam-0.6.5.jar

# Install Convex
RUN curl -m 30 https://github.com/GamrCorps/Convex/raw/master/out/builds/convex-0.9/convex/convex.jar -L -o ~/interpreters/convex.jar

# Install Cubix
RUN git clone --depth 1 https://github.com/ETHproductions/cubix.git ~/interpreters/cubix
COPY implementations/cubix.js /home/esolang/interpreters/cubix.js

# Install Cy
RUN curl -m 30 https://github.com/cyoce/Cy/raw/master/cy.rb -L -o ~/interpreters/cy.rb

# Install ~English
RUN cd /tmp \
    && git clone --depth 1 https://github.com/AnotherTest/-English.git \
    && cd -- -English \
    && mkdir -p bin \
    && cmake . \
    && make \
    && mv bin/NotEnglish ~/interpreters/NotEnglish

# Install Velato
RUN git clone --depth 1 https://github.com/rottytooth/Velato.git ~/interpreters/Velato
COPY implementations/Rottytooth.Esolang.Velato.sln /home/esolang/interpreters/Velato/Rottytooth.Esolang.Velato.sln
RUN cd ~/interpreters/Velato \
    && xbuild Rottytooth.Esolang.Velato.sln /p:TargetFrameworkVersion="v4.5" /p:Configuration=Release

# Install Shakespeare
RUN git clone --depth 1 https://github.com/drsam94/Spl.git ~/interpreters/Spl

# Install Element
RUN curl -m 30 https://github.com/PhiNotPi/Element/raw/master/InterpreterTIO.plx -L -o ~/interpreters/element.plx

# Install Emojicode
RUN cd /tmp \
    && curl -m 30 https://github.com/emojicode/emojicode/releases/download/v0.3/Emojicode-0.3-x86_64-linux-gnu.tar.gz -LO \
    && tar xzf Emojicode-0.3-x86_64-linux-gnu.tar.gz \
    && cd Emojicode-0.3-x86_64-linux-gnu \
    && mkdir -p ~/interpreters/Emojicode/bin \
    && (yes | ./install.sh ~/interpreters/Emojicode/bin ~/interpreters/Emojicode/Emojipackages)
ENV EMOJICODE_PACKAGES_PATH /home/esolang/interpreters/Emojicode/Emojipackages

# Install bash pure environment
RUN cd /tmp \
    && curl -m 30 https://olivier.sessink.nl/jailkit/jailkit-2.19.tar.gz -LO \
    && tar xzf jailkit-2.19.tar.gz \
    && cd jailkit-2.19 \
    && ./configure \
    && make \
    && sudo make install \
    && sudo mkdir -p /opt/jails/bash-pure \
    && sudo chown root:root /opt/jails/bash-pure \
    && sudo jk_init -j /opt/jails/bash-pure uidbasics \
    && sudo mkdir -p /opt/jails/bash-pure/bin \
    && sudo cp /bin/bash /opt/jails/bash-pure/bin/bash \
    && sudo cp /lib/x86_64-linux-gnu/libtinfo.so.5 /opt/jails/bash-pure/lib/x86_64-linux-gnu \
    && sudo cp /lib/x86_64-linux-gnu/libdl.so.2 /opt/jails/bash-pure/lib/x86_64-linux-gnu

# Install ferNANDo
RUN curl -m 30 "https://web-beta.archive.org/web/20170103051757/https://esolangs.org/wiki/FerNANDo" -L \
    | awk -F "</?pre>" '{print $44}' RS=".{999999}" | recode HTML > ~/interpreters/fernando.py

# Install Folders
RUN git clone --depth 1 https://github.com/rottytooth/Folders.git ~/interpreters/Folders
COPY implementations/folders.cs /home/esolang/interpreters/Folders/Rottytooth.Esolang.Folders.SamplePrograms/Program.cs
RUN cd ~/interpreters/Folders \
    && perl -0777 -pi -e 's/<PostBuildEvent>.+<\/PostBuildEvent>//gs' Rottytooth.Esolang.Folders.SamplePrograms/Rottytooth.Esolang.Folders.SamplePrograms.csproj \
    && perl -0777 -pi -e 's/results.Errors.Count == 0/true/g' Rottytooth.Esolang.Folders/Program.cs \
    && xbuild Rottytooth.Esolang.Folders.sln /p:TargetFrameworkVersion="v4.5" /p:Configuration=Release

# Install gs2
RUN curl -m 30 https://github.com/nooodl/gs2/raw/master/gs2.py -L -o ~/interpreters/gs2.py

# Install Half-Broken Car in Heavy Traffic
RUN git clone --depth 1 git://metanohi.name/hbcht.git ~/interpreters/hbcht

# Install INTERCAL
RUN cd /tmp \
    && curl -m 30 http://www.catb.org/~esr/intercal/intercal-0.30.tar.gz -LO \
    && mkdir -p ~/interpreters/intercal \
    && tar xzf intercal-0.30.tar.gz -C ~/interpreters/intercal \
    && cd ~/interpreters/intercal/intercal-0.30 \
    && ./configure \
    && make

# Install Japt
RUN git clone --depth 1 https://github.com/ETHproductions/japt.git ~/interpreters/japt
COPY implementations/japt.js /home/esolang/interpreters/japt.js

# Install Jelly
ENV LC_ALL en_US.UTF-8
RUN git clone --depth 1 https://github.com/DennisMitchell/jelly.git ~/interpreters/jelly

# Install Jellyfish
RUN git clone --depth 1 https://github.com/iatorm/jellyfish.git ~/interpreters/jellyfish

# Install Labyrinth
RUN git clone --depth 1 https://github.com/m-ender/labyrinth.git ~/interpreters/labyrinth

# Install Logicode
RUN git clone --depth 1 https://github.com/LogicodeLang/Logicode.git ~/interpreters/Logicode

# Install LOLCODE
RUN cd /tmp \
    && git clone --depth 1 https://github.com/justinmeza/lci.git \
    && cd lci \
    && cmake . \
    && make \
    && mv lci ~/interpreters/lci

# Install MATL
RUN git clone --depth 1 https://github.com/lmendo/MATL.git ~/interpreters/MATL

# Install Minimal-2D
RUN curl -m 30 "https://web-beta.archive.org/web/20170104032924/https://esolangs.org/wiki/User:Marinus/Minimal-2D_interpreter" -L \
    | awk -F "</?pre>" '{print $2}' RS=".{999999}" | recode HTML | perl -i.bak -pe 's/[^[:ascii:]]//g' > ~/interpreters/Minimal-2D.py

# Install Minus
RUN curl -m 30 http://www.golfscript.com/minus/files/iminus.c -L -o /tmp/iminus.c \
    && gcc -Wall -O2 /tmp/iminus.c -o ~/interpreters/iminus

# Install Emmental
RUN cd /tmp \
    && curl -m 30 http://catseye.tc/distfiles/emmental-1.0-2015.0101.zip -LO \
    && unzip emmental-1.0-2015.0101.zip \
    && cd emmental-1.0-2015.0101 \
    && ./build.sh \
    && mv bin/emmental ~/interpreters/emmental

# Install SQLite 3
RUN cd /tmp \
    && curl -m 30 https://sqlite.org/2017/sqlite-autoconf-3200000.tar.gz -LO \
    && (echo "3814c6f629ff93968b2b37a70497cfe98b366bf587a2261a56a5f750af6ae6a0 sqlite-autoconf-3200000.tar.gz" | sha256sum -c) \
    && tar xzf sqlite-autoconf-3200000.tar.gz \
    && cd sqlite-autoconf-3200000 \
    && ./configure \
    && make \
    && mv sqlite3 ~/interpreters/sqlite3

# Install JavaScript (Rhino)
RUN cd /tmp \
    && curl -m 30 https://github.com/mozilla/rhino/releases/download/Rhino1_7_7_RELEASE/rhino1.7.7.zip -LO \
    && (echo "6ce56b4809d1e7723fd2918dcb093b594f30941194361d4aa2b699f68e897d47 rhino1.7.7.zip" | sha256sum -c) \
    && unzip rhino1.7.7.zip \
    && mv rhino1.7.7/js.jar ~/interpreters/js.jar

RUN sudo apt-get update -y && sudo apt-get install apt-transport-https -y && sudo apt-get clean && sudo rm -rf /var/lib/apt/lists/*

# Install Crystal
RUN sudo apt-key adv --keyserver keys.gnupg.net --recv-keys 09617FD37CC06B54 \
    && sudo bash -c "echo \"deb https://dist.crystal-lang.org/apt crystal main\" > /etc/apt/sources.list.d/crystal.list" \
    && sudo apt-get -y update \
    && sudo apt-get install crystal -y \
    && sudo apt-get clean \
    && sudo rm -rf /var/lib/apt/lists/*

# Install PowerShell
RUN (curl https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -) \
    && sudo bash -c "echo \"deb [arch=amd64] https://packages.microsoft.com/ubuntu/16.04/prod xenial main\" > /etc/apt/sources.list.d/microsoft.list" \
    && sudo apt-get -y update \
    && sudo apt-get install -y powershell \
    && sudo apt-get clean \
    && sudo rm -rf /var/lib/apt/lists/*

# Install Verilog
RUN sudo apt-get update -y && sudo apt-get install iverilog -y && sudo apt-get clean && sudo rm -rf /var/lib/apt/lists/*

# Install D (DMD)
RUN sudo apt-key adv --keyserver keys.gnupg.net --recv-keys EBCF975E5BA24D5E \
    && sudo bash -c "echo \"deb http://master.dl.sourceforge.net/project/d-apt/ d-apt main\" > /etc/apt/sources.list.d/d-apt.list" \
    && sudo apt-get -y update \
    && sudo apt-get install -y dmd-bin \
    && sudo apt-get clean \
    && sudo rm -rf /var/lib/apt/lists/*

# Install Taxi
RUN cd /tmp \
    && git clone https://github.com/BigZaphod/Taxi.git \
    && g++ -O2 -Wall Taxi/source/taxi.cpp -o taxi -DNO_GREETINGS \
    && mv taxi ~/interpreters

# Install Simula
# Many thanks to https://github.com/TryItOnline/tiosetup/blob/master/languages/simula
RUN cd /tmp \
    && curl -m 30 https://ftp.gnu.org/gnu/cim/cim-5.1.tar.gz -LO \
    && (echo "b90717b66ec400503bdd69e537e8b7f3e8a9d106c3ba9a08a04ae57369a069a9 cim-5.1.tar.gz" | sha256sum -c) \
    && tar xzf cim-5.1.tar.gz \
    && cd cim-5.1 \
    && sed -i 's:\.\./\.\./lib/:../lib/:' lib/* \
    && ./configure \
    && make \
    && sudo make install

# Install jq
RUN sudo apt-get update -y && sudo apt-get install jq -y && sudo apt-get clean && sudo rm -rf /var/lib/apt/lists/*

# Install ADJUST
RUN cd /tmp \
    && curl -m 30 https://github.com/graue/esofiles/raw/master/adjust/impl/adjust.18.1.tar.gz -LO \
    && (echo "d6a624f0b86808ffb69dfe440228ac1ff8f3b386349ec1b9e211e619fb5c4923 adjust.18.1.tar.gz" | sha256sum -c) \
    && tar xzf adjust.18.1.tar.gz \
    && cd adjust.18.1 \
    && gcc -O2 -Wall -o ~/interpreters/adjust adjust.c

# Install Make
RUN sudo apt-get update -y && sudo apt-get install make -y && sudo apt-get clean && sudo rm -rf /var/lib/apt/lists/* \
    && cd /tmp \
    && curl -m 30 https://github.com/shinh/ags/raw/master/be/srv/ag_launcher.c -LO \
    && (echo "9370bbf7283631f04e937b115ed6c48548cea7a35efff40902ffb0ddf31d0758 ag_launcher.c" | sha256sum -c) \
    && gcc -O2 -Wall -o ~/interpreters/ag_launcher ag_launcher.c

# Install wake
RUN sudo apt-get update -y && sudo apt-get install libpcre3-dev -y && sudo apt-get clean && sudo rm -rf /var/lib/apt/lists/* \
    && cd /tmp \
    && curl -m 30 http://shinh.skr.jp/wake/wake.tgz -LO \
    && (echo "a947a4e2d36c7dafd693c307dfab1edbb1d7090c2c9bd4c8980a4fdfc33549c0 wake.tgz" | sha256sum -c) \
    && g++ -O2 -Wall wake/wake.cc -o ~/interpreters/wake -lpcre

# Clean up /tmp
RUN sudo rm -rf /tmp/*

ARG debug

# Remove the packages that matters only when build
RUN if [ -z ${debug:+true} ]; then \
        sudo apt-get remove --purge -y build-essential curl default-jdk ncurses-dev libncurses-dev cmake haskell-platform software-properties-common nodejs npm recode python-pip python3-pip bison flex libboost-dev mono-xbuild libpcre3-dev \
        && sudo apt-get autoremove -y; \
    else \
        sudo apt-get update -y; \
    fi

# Copy assets
COPY assets /home/esolang/assets
RUN sudo chown esolang:esolang /home/esolang/assets -R && sudo chmod 744 /home/esolang/assets && sudo chmod 644 /home/esolang/assets/*

COPY bin /home/esolang/bin
RUN sudo chown esolang:esolang /home/esolang/bin -R && sudo chmod 744 /home/esolang/bin -R

WORKDIR /home/esolang
