FROM esolang/build-base

RUN cd /tmp && \
    curl -m $TIMEOUT http://legacy.python.org/download/releases/src/python1.0.1.tar.gz -LO && \
    tar xzf python1.0.1.tar.gz && \
    cd python-1.0.1 && \
    sed -i 's/\bgetline\b/my_getline/' Objects/fileobject.c && \
    sed -i 's/\bposix_close\b/my_posix_close/' Modules/posixmodule.c && \
    sed -i '1s/^/#include <sys\/wait.h>\n/' Modules/posixmodule.c && \
    sed -i '1s/^/#include <time.h>\n/' Modules/timemodule.c && \
    sed -i 's/writeobject(v, f, PRINT_RAW)/printobject(v, f, PRINT_RAW)/' Python/bltinmodule.c && \
    sed -i 's/#define staticforward extern/#define staticforward static/' Include/object.h && \
    echo '/* use system strerror */' > Python/strerror.c && \
    ./configure && \
    make OPT="-O -std=gnu89 -w" && \
    mv python /usr/bin/python && \
    rm -rf /var/cache/apk/* /tmp/* && \
    ln -s /bin/script /bin/python1

COPY script /root/script
