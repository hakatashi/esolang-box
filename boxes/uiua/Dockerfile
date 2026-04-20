FROM esolang/build-base

RUN apk add --update curl libffi-dev && \
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y --no-modify-path && \
    /root/.cargo/bin/cargo install uiua && \
    mv /root/.cargo/bin/uiua /usr/local/bin/uiua && \
    rm -rf /root/.cargo /root/.rustup /var/cache/apk/* /tmp/* && \
    ln -s /bin/script /bin/uiua

COPY script /root/script
