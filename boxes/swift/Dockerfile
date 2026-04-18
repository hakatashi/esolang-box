FROM esolang/ubuntu-base

ENV BUILD_PACKAGES="" \
    RUNTIME_PACKAGES="git gnupg2 libcurl4-openssl-dev libedit2 libgcc-13-dev libpython3-dev libstdc++-13-dev libxml2-dev libncurses-dev libz3-dev pkg-config tzdata zlib1g-dev"

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
    curl https://download.swift.org/swiftly/linux/swiftly-x86_64.tar.gz -o /tmp/swiftly-x86_64.tar.gz && \
    tar xzf /tmp/swiftly-x86_64.tar.gz -C /tmp && \
    /bin/script.original -e -c 'echo "y\n1" | /tmp/swiftly init' && \
    apt-get install $RUNTIME_PACKAGES -y && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* && \
    ln -s /bin/script /bin/swift

COPY script /root/script
