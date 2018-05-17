FROM esolang/ubuntu-base

RUN (curl https://apt.llvm.org/llvm-snapshot.gpg.key | apt-key add -) && \
    (echo "deb http://apt.llvm.org/xenial/ llvm-toolchain-xenial-6.0 main" | tee /etc/apt/sources.list.d/llvm-6.0.list) && \
	apt-get update -y && \
	apt-get install clang-6.0 lld-6.0 -y && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    ln -s /bin/script /bin/cpp-clang

COPY script /root/script
