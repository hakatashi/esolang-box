FROM esolang/ubuntu-base

RUN apt-get update && \
    apt-get install clang libicu-dev libedit-dev -y && \
    curl https://swift.org/builds/swift-4.1-release/ubuntu1604/swift-4.1-RELEASE/swift-4.1-RELEASE-ubuntu16.04.tar.gz -LO && \
    tar xzf swift-4.1-RELEASE-ubuntu16.04.tar.gz && \
    rm swift-4.1-RELEASE-ubuntu16.04.tar.gz && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

COPY script /bin/script

RUN ln -s /bin/script /bin/swift && \
    chmod 744 /bin -R

WORKDIR /root

CMD [ "script" ]
