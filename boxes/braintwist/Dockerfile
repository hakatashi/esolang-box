FROM esolang/golang

RUN go get github.com/nakario/braintwist/cmd/braintwist && \
    ln -s /bin/script /bin/braintwist

COPY script /root/script
