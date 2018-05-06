FROM esolang/python3

RUN curl -m $TIMEOUT https://gist.github.com/anonymous/6392418/raw/3b16018cb47f2f9ad1fa085c155cc5c0dc448b2d/fish.py -L -o ~/fish.py

COPY script /bin/script

RUN ln -s /bin/script /bin/fish && \
    chmod 744 /bin -R
