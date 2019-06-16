FROM esolang/ubuntu-base

RUN (curl https://apt.llvm.org/llvm-snapshot.gpg.key | apt-key add -) && \
    (echo "deb http://apt.llvm.org/bionic/ llvm-toolchain-bionic main" | tee /etc/apt/sources.list.d/llvm-6.0.list) && \
    apt-get update -y && \
    apt-get install clang-9 lld-9 -y && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    ln -s /bin/script /bin/cpp-clang

COPY script /root/script
