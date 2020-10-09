FROM esolang/build-base

RUN cd /home && \
    apk --no-cache add --update gfortran zlib-dev bzip2-dev xz-dev pcre-dev curl-dev perl && \
    curl -O https://cran.rstudio.com/src/base/R-latest.tar.gz && \
    tar -xzvf R-latest.tar.gz && \
    rm R-latest.tar.gz && \
    cd R* && \
    ./configure --prefix=/home/R --enable-memory-profiling --with-blas --with-lapack --with-readline=no --with-x=no --with-pcre1 --disable-java && \
    make && \
    make install && \
    ln -s /bin/script /bin/r && \
    ln -s /home/R/bin/Rscript /bin/Rscript && \
    cd .. && \
    rm -rf R-*

COPY script /root/script

