FROM esolang/python3

RUN rm /bin/python3 && \
    git clone --depth 1 https://github.com/GuyJoKing/Backhand.git ~/Backhand && \
    ln -s /bin/script /bin/backhand

COPY script /root/script
