#include <vector>
#include <iostream>
using namespace std;
typedef long long ll;
typedef unsigned long long ull;

typedef enum{
  PLU,MIN,MUL,DIV,MOD,OR,AND,XOR
} opcode;

typedef union{
  struct{
    char h,l;
  } bytes;
  short x;
  int ex;
  long long rx;
} reg;

class stackmachine {
  vector<unsigned char> stack[3];
  ull read(int a,int n){
    ull ret=0;
    for (int j = 0; j < (1<<n); j++) {
      ret+=(*(stack[a].end()-1-j))<<(8*j);
    }
    return ret;
  }

public:
  stackmachine(vector<unsigned char> s){
    stack[0]=s;
  }
  void push(unsigned int b,ull a,unsigned int n){
    for (int j = (1<<n)-1; j >= 0; j--) {
      unsigned char tmp=(unsigned char)(a&(0b11111111LL<<(8*j)))>>(8*j);
      stack[b].push_back(tmp);
    }
  }
  void pop(unsigned int a,unsigned int n){
    for (int i = 0; i < (1<<n); i++) {
      stack[a].pop_back();
    }
  }
  void copy(unsigned int a,unsigned int b,unsigned int n){
    if(b>=a){
      b++;
    }
    ull tmp=read(a,n);
    push(b,tmp,n);
  }
  void calc(opcode op,unsigned int a,unsigned int b,unsigned int n){
    if(b>=a){
      b++;
    }
    unsigned int c;
    for (unsigned int i = 0; i < 3; i++) {
      if(a!=i&&b!=i){
        c=i;break;
      }
    }
    ull tmp[2]={0,0},ret=0;
    tmp[0]=read(a,n);
    tmp[1]=read(b,n);
    switch (op) {
      case PLU:
        ret=tmp[0]+tmp[1];
        break;
      case MIN:
        ret=tmp[0]-tmp[1];
        break;
      case MUL:
        ret=tmp[0]*tmp[1];
        break;
      case DIV:
        ret=tmp[0]/tmp[1];
        break;
      case MOD:
        ret=tmp[0]%tmp[1];
        break;
      case AND:
        ret=tmp[0]&tmp[1];
        break;
      case OR:
        ret=tmp[0]|tmp[1];
        break;
      case XOR:
        ret=tmp[0]^tmp[1];
        break;
    }
    push(c,ret,n);
  }
  void print(unsigned int a){
    cout<<stack[a].back();
  }
  bool cmp(unsigned int a,unsigned n){
    return read(a,n)==0;
  }
};
