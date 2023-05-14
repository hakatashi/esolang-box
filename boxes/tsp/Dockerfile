FROM esolang/golang

RUN go install github.com/nakario/tsp/cmd/tsp@latest && \
    ln -s /bin/script /bin/tsp

COPY script /root/script
