FROM esolang/ubuntu-base

ENV DEBIAN_FRONTEND=noninteractive

RUN (curl https://apt.llvm.org/llvm-snapshot.gpg.key | tee /etc/apt/trusted.gpg.d/apt.llvm.org.asc) && \
    # TODO: Update to "resolute" repository after LLVM project releases it.
    (echo "deb http://apt.llvm.org/questing/ llvm-toolchain-questing main" | tee /etc/apt/sources.list.d/llvm.list) && \
    apt-get update -y && \
    apt-get install tzdata -y && \
    apt-get install clang-22 lld-22 -y && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    ln -s /bin/script /bin/cpp-clang

COPY script /root/script
