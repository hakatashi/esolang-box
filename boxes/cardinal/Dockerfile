FROM esolang/python3

RUN curl -m $TIMEOUT https://gist.github.com/kurgm/c5d7eedcd773d707d98cfaf363926274/raw/560d5d94534cb8f512077d3d69ee2abef8bebf35/cardinal.py -L -o ~/cardinal.py && \
    ln -s /bin/script /bin/cardinal && \
    rm /bin/python3

COPY script /bin/script

