FROM esolang/ubuntu-base

RUN apt-get -y update && \
    apt-get install -y git && \
    # Install Foundry (forge + cast)
    curl -L "https://github.com/foundry-rs/foundry/releases/download/nightly/foundry_nightly_linux_amd64.tar.gz" \
    -o /tmp/foundry.tar.gz && \
    tar xz -C /usr/local/bin -f /tmp/foundry.tar.gz forge cast && \
    rm /tmp/foundry.tar.gz && \
    # Set up forge project template with forge-std
    mkdir -p /forge-template/lib && \
    git clone --depth=1 https://github.com/foundry-rs/forge-std.git /forge-template/lib/forge-std && \
    printf '[profile.default]\nsrc = "src"\nout = "out"\nlibs = ["lib"]\n' > /forge-template/foundry.toml && \
    mkdir -p /forge-template/src /forge-template/script && \
    # Pre-download solc by building a dummy project
    echo 'pragma solidity ^0.8.13; contract C {}' > /forge-template/src/Dummy.sol && \
    cd /forge-template && \
    forge build && \
    rm -rf /forge-template/src/Dummy.sol /forge-template/out /tmp/* /var/lib/apt/lists/* && \
    ln -s /bin/script /bin/solidity

COPY script /root/script
