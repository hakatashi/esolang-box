FROM esolang/build-base

COPY main.cpp /tmp/main.cpp
COPY stackmachine.hpp /tmp/stackmachine.hpp

RUN git clone https://github.com/JP3BGY/Hanoi_Stack/ ~/Hanoi_Stack&&g++ ~/Hanoi_Stack/main.cpp -o ~/Hanoi_Stack/hanoi_stack && ln -s /bin/script /bin/hanoi_stack

COPY script /root/script
