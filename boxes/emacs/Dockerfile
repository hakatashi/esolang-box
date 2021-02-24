FROM esolang/ubuntu-base

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
    apt-get install -y tzdata && \
    apt-get install emacs-nox -y && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
RUN mv /bin/emacs /bin/emacs-original && ln -s /bin/script /bin/emacs

COPY execute-macro.el /root/execute-macro.el
COPY script /root/script
