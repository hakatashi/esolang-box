FROM esolang/ubuntu-base

ENV BUILD_PACKAGES="git" \
    RUNTIME_PACKAGES=""

RUN apt-get update && \
    apt-get install $RUNTIME_PACKAGES $BUILD_PACKAGES -y && \
    cd /tmp && \
	(curl https://sh.rustup.rs -sSf | sh -s -- --default-toolchain nightly-2018-12-19 -y) && \
    git clone --depth 1 https://github.com/moratorium08/moo && \
    cd moo && \
    /root/.cargo/bin/cargo build --release && \
    cp target/release/stst /usr/bin/moo && \
    /root/.cargo/bin/rustup self uninstall -y && \
    apt-get purge $BUILD_PACKAGES -y && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* && \
    ln -s /bin/script /bin/moo

COPY script /root/script
