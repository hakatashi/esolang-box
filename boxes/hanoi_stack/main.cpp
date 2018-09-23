#include <bits/stdc++.h>
#include "stackmachine.hpp"

using namespace std;

typedef long long ll;
typedef unsigned long long ull;


int main(int argc, char const* argv[])
{
  if(argc<2){
    cerr<<"Few args"<<endl;
    return 2;
  }
  FILE* program=fopen(argv[1],"r");
  char buf[4096];
  int n;
  vector<unsigned char> in;
  while((n=getc(stdin))!=EOF){
    in.push_back((char) n);
  }
  stackmachine sm(in);
  sm.push(0,in.size(),2);
  int ip=0;
  unsigned short opcd;
  while(n=fread(&opcd,2,1,program)>0){
    if((opcd&(0b1<<15))!=0){
      int offset=opcd&0b11111111111111;
      offset*=2;
      if((opcd&(0b1<<14))!=1)offset=-offset;
      fseek(program,offset,SEEK_CUR);
    }else if((opcd&(0b01<<14))!=0){
      sm.push((opcd&(0b11<<12))>>12,(opcd&(0b11111111<<4))>>4,0);
    }else if((opcd&(0b001<<13))!=0){
      sm.calc(static_cast<opcode>((opcd&(0b111<<10))>>10),(opcd&(0b11<<8))>>8,(opcd&(0b1<<7))>>7,(opcd&(0b11<<5))>>5);
    }else if((opcd&(0b0001<<12))!=0){
      sm.copy((opcd&(0b11<<10))>>10,(opcd&(0b1<<9))>>9,(opcd&(0b11<<7))>>7);
    }else if((opcd&(0b00001<<11))!=0){
      sm.print((opcd&(0b11<<9))>>9);
    }else if((opcd&(0b000001<<10))!=0){
      bool flag=sm.cmp((opcd&(0b11<<8))>>8,(opcd&(0b11<<6))>>6);
      if(flag)fseek(program,2,SEEK_CUR);
    }else{
      sm.pop((opcd&(0b11<<8))>>8,(opcd&(0b11<<6))>>6);
    }
  }
  return 0;
}
