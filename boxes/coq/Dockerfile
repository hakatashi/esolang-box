FROM esolang/ocaml

ENV BUILD_PACKAGES="opam m4 make build-base gmp-dev bash linux-headers" \
    RUNTIME_PACKAGES="musl-dev gmp-dev perl findutils" \
    OCAML_VERSION=4.14.2 \
    PATH=/root/.opam/4.14.2/bin:$PATH

RUN rm /bin/ocaml && \
    apk add --update $BUILD_PACKAGES $RUNTIME_PACKAGES && \
    opam init -y --disable-sandboxing && \
    opam switch -j4 create ${OCAML_VERSION} ocaml-base-compiler.${OCAML_VERSION} && \
    opam repo add rocq-released https://rocq-prover.org/opam/released && \
    opam install -j4 -y rocq-core.9.2.0 rocq-stdlib && \
    apk del $BUILD_PACKAGES && \
    rm -rf /var/cache/apk/* /tmp/* && \
    ln -s /bin/script /bin/coq

COPY script /root/script
