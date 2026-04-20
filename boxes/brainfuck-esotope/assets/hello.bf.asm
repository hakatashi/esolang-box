p[0] = 1;
p[1] = 0;
p[3] = 0;
p[4] = 0;
while (p[0]) {
	p[0] -= 2;
	--p[1];
	while (p[1]) {
		++p[3];
		p[4] -= 5;
		++p;
	}
	p[0] -= 2;
	p[-1] -= 3;
	--p;
}
--p[1];
PUTC(p[1]);
++p[4];
PUTC(p[4]);
PUTC(p[6]);
PUTC(p[6]);
p[6] += 3;
while (p[6]) {
	PUTC(p[6]);
	++p;
}
PUTC(p[2]);
p[2] += 3;
PUTC(p[2]);
p[2] -= 6;
PUTC(p[2]);
--p[0];
PUTC(p[0]);
++p[4];
PUTC(p[4]);
