FROM esolang/ruby

RUN rm /bin/ruby && \
    git clone --depth 1 https://github.com/toyukan6/Arithmetic.git ~/Arithmetic && \
    ln -s /bin/script /bin/arithmetic

COPY script /root/script
