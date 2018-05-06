FROM esolang/build-base

ENV BUILD_PACKAGES="" \
    RUNTIME_PACKAGES="python3 libbsd-dev"

RUN apk add --update $BUILD_PACKAGES $RUNTIME_PACKAGES && \
    git clone --depth 1 https://github.com/db314159/Spl.git ~/Spl && \
    sed -i 's/or trimmed == "openyourmind"/or trimmed == "openthymind"/' ~/Spl/splc.py && \
    rm -rf /var/cache/apk/* /tmp/* && \
    ln -s /bin/script /bin/spl

COPY script /root/script
