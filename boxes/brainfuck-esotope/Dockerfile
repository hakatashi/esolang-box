FROM esolang/rust

RUN apk add --update cargo && \
    git clone --depth 1 https://github.com/lifthrasiir/esotope-bfc.git ~/esotope-bfc && \
    cd ~/esotope-bfc && cargo build --release && \
    mv ~/esotope-bfc/target/release/esotope-bfc /usr/local/bin/esotope-bfc && \
    rm -rf ~/esotope-bfc ~/.cargo /var/cache/apk/* /tmp/* && \
    ln -s /bin/script /bin/brainfuck-esotope

COPY script /root/script
COPY disasm /root/disasm
