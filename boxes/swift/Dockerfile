FROM esolang/ubuntu-base

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
    apt-get install -y tzdata && \
    apt-get install clang libicu-dev libedit-dev libpython2.7 libxml2 git lsb-release -y && \
    git clone https://github.com/kylef/swiftenv.git ~/.swiftenv --depth 1 && \
    (eval "$(~/.swiftenv/bin/swiftenv init -)" || echo "Ignoring eval failure") && \
    ~/.swiftenv/bin/swiftenv install https://swift.org/builds/swift-5.3.3-release/ubuntu2004/swift-5.3.3-RELEASE/swift-5.3.3-RELEASE-ubuntu20.04.tar.gz && \
    apt-get remove git lsb-release -y && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* && \
    ln -s /bin/script /bin/swift

COPY script /root/script
