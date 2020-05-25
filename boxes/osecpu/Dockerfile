FROM esolang/build-base

RUN cd /tmp && \
    git clone --recursive --depth 1 https://github.com/takeutch-kemeco/osecpu-vm-rev2

COPY osecpu.patch /tmp/osecpu.patch

RUN cd /tmp/osecpu-vm-rev2/vm/ && \
    mv driver.c driver.orig.c && \
    tr -d '\r' <  driver.orig.c > driver.c

RUN cd /tmp/osecpu-vm-rev2/vm/ && \
    mv debug.c debug.orig.c && \
    tr -d '\r' <  debug.orig.c > debug.c

RUN cd /tmp/osecpu-vm-rev2/ && git apply /tmp/osecpu.patch

RUN cd /tmp/osecpu-vm-rev2/vm && \
    gcc -D__linux__ -lm -o osecpu api.c  debug.c  decode.c  driver.c  extend.c  float.c  integer.c  osecpu-vm.c  other.c  pointer.c  tek.c && \
    mv osecpu /bin/osecpu

RUN rm -rf /tmp

COPY script /root/script
