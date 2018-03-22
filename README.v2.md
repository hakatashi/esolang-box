# esolang-box

## Notes about some languages

### Brainfuck (bfi)

Unlike `Brainfuck (esotope)`, this execution simulates the `brainfuck` behavior of [Anarchy Golf](http://golf.shinh.org/l.rb?bf).

To achieve this, I have patched a tricky line to the original code.

```patch
--- BFI.c
+++ BFI.c
@@ -46,6 +46,7 @@
   int pc, args, xc, prog_len, l = 0;
   int x[32768];
   int p[32768];
+  int xxx[1] = {'['};

   FILE *stream, *fopen();

```
