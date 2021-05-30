FROM esolang/golang

RUN go get -u github.com/nakario/tsp/cmd/tsp && \
    ln -s /bin/script /bin/tsp

COPY script /root/script
