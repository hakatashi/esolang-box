#include <stdio.h>
int main() {
  int c;
  while ((c=getchar())!=EOF) {
    printf("\\x%x",(char)c);
  }
  return 0;
}
