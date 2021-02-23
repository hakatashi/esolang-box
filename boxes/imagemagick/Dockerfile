FROM esolang/ubuntu-base

RUN apt update && apt-get install -y build-essential wget && \
    wget https://www.imagemagick.org/download/ImageMagick.tar.gz && \
    tar xf ImageMagick.tar.gz
RUN cd ImageMagick-7* && \
    ./configure && make && make install && ldconfig /usr/local/lib

RUN ln -s /bin/script /bin/imagemagick && \
    ln -s /bin/script /bin/magick

COPY script /root/script
