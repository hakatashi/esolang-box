FROM esolang/build-base

COPY osecpu.patch /tmp/osecpu.patch

RUN cd /tmp && \
    git clone --recursive --depth 1 https://github.com/takeutch-kemeco/osecpu-vm-rev2 && \
    cd osecpu-vm-rev2 && \
    git apply /tmp/osecpu.patch && \
    cd vm && \
    gcc -D__linux__ -lm api.c debug.c decode.c driver.c extend.c float.c integer.c osecpu-vm.c other.c pointer.c tek.c -o osecpu && \
    mv osecpu /root/osecpu && \
    cd ../tol && \
    gcc -o osectols osectols.c
    mv osectols /root/osectols && \
    ln -s /bin/script /bin/osecpu && \
    rm -rf /tmp

COPY script /root/script
