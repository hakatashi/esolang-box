FROM esolang/rust
 RUN apk add --no-cache cargo
 RUN git clone --depth 1 https://github.com/moratorium08/moo /root/moo
 WORKDIR /root/moo
 RUN cargo build --release
 RUN cp target/release/stst /usr/bin/moo
 RUN ln -s /bin/script /bin/standback
 COPY script /root/script
