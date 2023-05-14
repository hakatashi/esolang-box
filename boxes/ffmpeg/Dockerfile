FROM esolang/base

RUN apk add --update ffmpeg

RUN mv /usr/bin/ffmpeg /usr/bin/ffmpeg-original && \
    ln -s /bin/script /bin/ffmpeg

COPY script /root/script
