FROM esolang/ubuntu-base

RUN apt-get update && \
    apt-get install emacs-nox -y && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    ln -s /bin/script /bin/emacs

COPY execute-macro.el /root/execute-macro.el
COPY script /root/script
