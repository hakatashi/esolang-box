FROM esolang/golang

RUN go install github.com/michaelmacinnis/oh@latest && \
    ln -s /bin/script /bin/oh

COPY script /root/script
