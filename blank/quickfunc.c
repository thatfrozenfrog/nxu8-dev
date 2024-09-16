#include "base.h"
#ifdef __INTELLISENSE__
#define __near
#endif
typedef unsigned char byte;
typedef unsigned short uint16_t;

char hello[] = "SuwakOS v2.1";
char* addr = hello;
void copytox(word addr, char* where) {
    return;
}


void main(void) {
    copytox(0xE700, addr);
}

