FROM esolang/build-base

RUN apk add --update-cache tcl expect && \
    mkdir /tmp/install-tcl-lib && \
    wget -qO - https://github.com/tcltk/tcllib/archive/tcllib_1_18.tar.gz | \
    tar -xz -C /tmp/install-tcl-lib --strip-components=1 && \
    tclsh /tmp/install-tcl-lib/installer.tcl -no-html -no-nroff -no-examples -no-gui -no-apps -no-wait -pkg-path /usr/lib/tcllib && \
    rm -rf /var/cache/apk/* && \
    rm -rf /tmp/install-tcl-lib && \
    apk del build-base && \
    ln -s /bin/script /bin/tcl

COPY script /root/script

