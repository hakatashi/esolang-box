FROM esolang/ubuntu-base
RUN curl https://sh.rustup.rs -sSf | \
            sh -s -- --default-toolchain nightly -y
RUN apt-get update
RUN apt-get install git -y
RUN git clone --depth 1 https://github.com/moratorium08/moo /root/moo
WORKDIR /root/moo
ENV PATH=/root/.cargo/bin:$PATH
RUN cargo build --release
RUN cp target/release/stst /usr/bin/moo
RUN ln -s /bin/script /bin/standback
COPY script /root/script
