DWWW$ (1, 3) dup
W$ (1, 4) dup
W$ (2, 5)
W$
DS$
S$
S$
DW$
W$
D$
WWD$ (5, 7) dup
WDD$ (7, 8) dup odd
ASSSSSS
ASSSSSSSSSSSSSSSSSSS
DWWWWWWWWWWWWWWWWWWW$ (6, 2) push 47 even odd
AAAAS
ASSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS
DWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWW$ (2, 1) push 119 odd odd
DDDDWWWW
ASSSS
DWWWW$ (6, 5) push 18 odd even
DSS
ASSS
DWWW$ (7, 3) push 11 even odd
DDDWWWW
ASSSSS
DWWWWW$ (10, 7) push 19 odd odd
ASSSSS
ASSDWW$ (9, 2) push 12 odd even
WWWW
ASDW$ (9, 6) push 8 odd even
DSS
ASSS
DWWW$ (10, 4) push 11 even odd
AASS
ASDW$ (8, 2) push 8 even even
DDDS
ASSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS
DWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWW$ (11, 1) push 86 even even
A
ASDW$ (10, 1) push 5 odd odd
AAAAAAAAAAAAAAAAWW $(-6, 3) sub
AW$
AWW$
AW$
AW$
SSS$
ASSS$
D$
DW$
D$
SSD$ (-7, 1) sub odd
SSDDDDDDDDDDDDDDD$ (8, -1) putchar
D$
DSS$
AS$
S$
AW$
AWW$
ASS$
DSS$
DDSS$
DS$
WWW$
WWWD$ (11, -3) putchar
AAAWWWWWWWW
ASSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS
DWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWW$ (8, 5) push 75 odd odd
AAAAAAAASSSSS$ (0, 0)

###############################

p
dd
ddd
dddd
dpsop
sopsdo
opsopsd
opsoopso
psopsopso
pso

H 72
e 101
l 108
l 108
o 111
, 44
  32
w 119
o 111
r 114
l 108
d 100
! 33

2 push 119 / 119
3-12 dup * 10 / 119, ..9.., 119
13 push 47 / 119, ..9.., 119, 47
14 sub / 119, ..8.., 119, 72
15 putchar -> "H" / 119, ..8.., 119
16 push 18 / 119, ..8.., 119, 18
17 sub / 119, ..7.., 119, 101
18 putchar -> "e" / 119, ..7.., 119
19 push 11 / 119, ..7.., 119, 11
20 sub / 119, ..6.., 119, 108
21 dup / 119, ..6.., 119, 108, 108
22,23 putchar * 2 -> "ll" / 119, ..6.., 119
24 push 8
25 sub
26 putchar -> "o" / 119, ..5.., 119
27 push 75
28 sub
29 dup / 119, ..4.., 119, 44, 44
30 putchar -> ","
31 push 12
32 sub / 119, ..4.., 119, 32
33 putchar -> " "
34 putchar -> "w" / 119, ..3.., 119
35 push 8
36 sub
37 putchar -> "o" / ..2..
38 push 5
39 sub
40 putchar -> "r" / ..1..
41 push 11
42 sub
43 putchar -> "l" / 119, 119
44 push 19
45 sub
46 putchar -> "d" / 119
47 push 86
48 sub
49 putchar -> "!" / ()
