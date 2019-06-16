FROM esolang/python3

RUN rm /bin/python3 && \
    git clone --depth 1 https://github.com/splcurran/Gaia.git ~/Gaia && \
    ln -s /bin/script /bin/gaia

COPY script /root/script
