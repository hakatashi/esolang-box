FROM esolang/ubuntu-base

RUN apt-get update && \
    apt-get install clang libicu-dev libedit-dev libpython2.7 libxml2 git lsb-release -y && \
    git clone https://github.com/kylef/swiftenv ~/.swiftenv --depth 1 && \
    eval "$(~/.swiftenv/bin/swiftenv init -)" && \
    ~/.swiftenv/bin/swiftenv install https://swift.org/builds/swift-4.1-release/ubuntu1604/swift-4.1-RELEASE/swift-4.1-RELEASE-ubuntu16.04.tar.gz && \
    apt-get remove git lsb-release -y && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/*

COPY script /bin/script

RUN ln -s /bin/script /bin/swift && \
    chmod 744 /bin -R

WORKDIR /root

CMD [ "script" ]
