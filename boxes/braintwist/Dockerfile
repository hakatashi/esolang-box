FROM esolang/golang

RUN go install github.com/nakario/braintwist/cmd/braintwist@latest && \
    ln -s /bin/script /bin/braintwist

COPY script /root/script
