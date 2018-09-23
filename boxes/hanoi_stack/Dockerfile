FROM esolang/build-base

RUN git clone https://github.com/JP3BGY/Hanoi_Stack/ /tmp/Hanoi_Stack --depth 1 && \
	cd /tmp/Hanoi_Stack && \
	g++ main.cpp -o /usr/bin/hanoi_stack && \
	ln -s /bin/script /bin/hanoi_stack

COPY script /root/script
