FROM esolang/elixir

RUN rm /bin/elixir && \
    git clone --depth 1 https://github.com/Adriandmen/05AB1E.git ~/05AB1E && \
    cd 05AB1E && \
    (yes | PATH=/usr/bin:$PATH mix local.hex) && \
    PATH=/usr/bin:$PATH mix deps.get && \
    (yes | PATH=/usr/bin:$PATH MIX_ENV=prod mix escript.build) && \
    ln -s /bin/script /bin/05ab1e

COPY script /root/script
