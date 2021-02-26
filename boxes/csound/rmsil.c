#include <stdio.h>

#define B_SIL 0x80

int main(void) {
  size_t i;
  int in_c;
  size_t sil_runlength = 0;

  while((in_c = getchar()) != EOF) {
    if(in_c == B_SIL) {
      sil_runlength++;
    } else {
      for(i=0; i<sil_runlength; i++) {
        putchar(B_SIL);
      }
      sil_runlength = 0;
      putchar(in_c);
    }
  }
}
