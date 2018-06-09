FROM esolang/ubuntu-base

ENV BUILD_PACKAGES="git byacc" \
    RUNTIME_PACKAGES=""

RUN apt-get update && \
    apt-get install $RUNTIME_PACKAGES $BUILD_PACKAGES -y && \
    cd /tmp && \
    git clone --depth 1 https://bitbucket.org/chastai/perl-1.0.git && \
    cd perl-1.0 && \
    sed "s/test ! -t 0/test 1 = 2/" -i Configure && \
    (yes | bash ./Configure -d) && \
    make && \
    mv perl /usr/bin/perl && \
    apt-get purge $BUILD_PACKAGES -y && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* && \
    ln -s /bin/script /bin/perl1

COPY script /root/script
