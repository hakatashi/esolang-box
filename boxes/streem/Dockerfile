FROM esolang/build-base

RUN cd /tmp && \
    git clone --depth 1 https://github.com/matz/streem.git && \
    cd streem && \
    sed -i 's/extern node\* node_pattern_new();/extern node* node_pattern_new(node_type type);/' src/node.h && \
    sed -i 's/node_pattern_new()/node_pattern_new(NODE_PARRAY)/g' src/parse.y && \
    make -j$(nproc) CDEFS="-DNO_QSORT_R -DNO_LOCKFREE_QUEUE" && \
    mv bin/streem /usr/bin/streem && \
    rm -rf /var/cache/apk/* /tmp/* && \
    ln -s /bin/script /bin/streem

COPY script /root/script
