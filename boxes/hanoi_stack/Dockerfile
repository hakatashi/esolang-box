FROM esolang/build-base

COPY main.cpp ~/main.cpp
COPY stackmachine.hpp ~/stackmachine.hpp

RUN g++ ~/main.cpp -o ~/hanoi_stack && ln -s /bin/script /bin/hanoi_stack

COPY script /root/script
