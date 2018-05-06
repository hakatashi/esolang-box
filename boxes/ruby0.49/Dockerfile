FROM esolang/ubuntu-base

ENV BUILD_PACKAGES="libssl-dev:i386 bison gcc-multilib" \
    RUNTIME_PACKAGES="libgdbm-dev:i386"

RUN dpkg --add-architecture i386 && \
    apt-get update && \
    apt-get install $RUNTIME_PACKAGES $BUILD_PACKAGES -y && \
    cd /tmp && \
    curl -m $TIMEOUT http://ftp.ruby-lang.org/pub/ruby/1.0/ruby-0.49.tar.gz -LO && \
    tar xzf ruby-0.49.tar.gz && \
    cd ruby && \
    curl -m $TIMEOUT https://raw.githubusercontent.com/hakatashi/historical-rubies/master/ruby-0.49.patch -LO && \
    patch -p1 < ruby-0.49.patch && \
    ./configure && \
    sed -i 's/@//' Makefile && \
    (make LIBS="-L/usr/lib32 -lm -lgdbm -lgdbm_compat -lcrypt" -j5 > /tmp/make.log) && \
    mv ruby /bin/ruby && \
    apt-get purge $BUILD_PACKAGES -y && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/*

COPY script /bin/script

RUN ln -s /bin/script /bin/ruby0.49 && \
    chmod 744 /bin -R
