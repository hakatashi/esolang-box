FROM esolang/python3

RUN git clone --depth 1 https://github.com/Nazek42/arcyou.git ~/arcyou && \
    sed -i 's/from collections import Hashable/from collections.abc import Hashable/' arcyou/function.py && \
    ln -s /bin/script /bin/arcyou

COPY script /root/script
