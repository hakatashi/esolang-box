FROM esolang/build-base

COPY main.cpp /tmp/main.cpp
COPY stackmachine.hpp /tmp/stackmachine.hpp

RUN cd /tmp && \
    g++ main.cpp -o /usr/bin/hanoi_stack && \
    rm -rf /tmp && \
	ln -s /bin/script /bin/hanoi_stack

COPY script /root/script
