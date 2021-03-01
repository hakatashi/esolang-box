2 getchar
3 jz 6
3 putchar
4 push
4 dup
4 sub
5 jz 2

DAASSS$ jz 6 (-1, -3)
SS$ jz 2 (-1, -5)
DDWWW$ getchar (1, -2)
DD$ putchar (3, -2)
DWWW$ push N (4, 1)
AAWWW$ dup (2, 4)
AAAAAAS$ sub (-4, 3)
DDDDSSS$ (0, 0)

i (1, -2)
jo (-1, -3), (3, -2)
pds (4, 1), (2, 4) (-4, 3)
j (-1, -5)

    | d
s   |
    |
    |   p
----@----
    |   
    |i o
   6|
    |
   2|
