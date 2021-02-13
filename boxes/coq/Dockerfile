FROM esolang/ocaml

ENV BUILD_PACKAGES="opam m4 make ocaml-findlib build-base" \
    RUNTIME_PACKAGES="musl-dev" \
    PATH=/root/.opam/4.10.0/bin:$PATH

RUN rm /bin/ocaml && \
    apk add --update $BUILD_PACKAGES $RUNTIME_PACKAGES && \
    opam init -y --disable-sandboxing && \
    opam switch -j4 create 4.10.0 ocaml-base-compiler.4.10.0 && \
    opam repo add coq-released https://coq.inria.fr/opam/released && \
    opam install -j4 -v -y coq-io-system && \
    apk del $BUILD_PACKAGES && \
    rm -rf /var/cache/apk/* /tmp/* && \
    ln -s /bin/script /bin/coq

COPY script /root/script
COPY tail.v /root/tail.v
