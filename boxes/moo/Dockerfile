FROM esolang/ubuntu-base

ENV DEBIAN_FRONTEND=noninteractive
ENV BUILD_PACKAGES="git" \
    RUNTIME_PACKAGES="rustc cargo"

RUN apt-get update && \
    apt-get install -y tzdata && \
    apt-get install $RUNTIME_PACKAGES $BUILD_PACKAGES -y && \
    git clone --depth 1 https://github.com/moratorium08/moo && \
    cd moo && \
    cargo build --release && \
    cp target/release/stst /usr/bin/moo && \
    apt-get purge $BUILD_PACKAGES -y && \
    apt-get autoremove -y && \
    apt-get clean

# due to esolang-box's specification, move original moo to moo-interpreter
RUN rm -rf /var/lib/apt/lists/* /tmp/* && \
    mv /usr/bin/moo /usr/bin/moo-interpreter && \
    ln -s -f /bin/script /bin/moo

COPY script /root/script
