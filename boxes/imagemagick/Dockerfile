FROM esolang/ubuntu-base

RUN apt-get update && \
    apt-get install -y build-essential wget && \
    cd /tmp && \
    wget https://download.imagemagick.org/archive/ImageMagick.tar.gz && \
    tar xf ImageMagick.tar.gz && \
    cd ImageMagick-7* && \
    ./configure && \
    make && \
    make install && \
    ldconfig /usr/local/lib && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* && \
    ln -s /bin/script /bin/imagemagick

COPY script /root/script
