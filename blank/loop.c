#include "base.h"
#ifdef __INTELLISENSE__
#define __near
#endif
typedef unsigned char byte;
typedef unsigned short uint16_t;
typedef unsigned long uint24_t;
  
/*
void set_pixel(byte x, byte y) {
    return;
}
int abs(int x) {
    if (x < 0) {
        return -x;
    } else {
        return x;
    }
}
void plot_line (byte x0, byte y0, byte x1, byte y1)
{
//Assuming that x1, y1 > x0, y0
  int dx =  abs (x1 - x0), sx = x0 < x1 ? 1 : -1;
  int dy = -abs (y1 - y0), sy = y0 < y1 ? 1 : -1;

  int err = dx + dy, e2;

  for (;;){
    set_pixel (x0,y0);
    if (x0 == x1 && y0 == y1) break;
    e2 = 2 * err;
    if (e2 >= dy) { err += dy; x0 += sx; }
    if (e2 <= dx) { err += dx; y0 += sy; }
  }
}
void main(void)
{
    plot_line(0x05,0x01,0xC0,0xC1);
}
*/
void blank(byte a, byte b, byte c, byte d) {
    return;
}
void ss (word k) {
    return;
}

void loop(word start, word line) {
    word i = 0;
    for(i = 0; i < line * 4; i += 4)
    {
        byte a = deref(start + i);
        byte b = deref(start + i + 1);
        byte c = deref(start + i + 2);
        byte d = deref(start + i + 3);
        blank(a,b,c,d);
    }
}

void main(void)
{
    loop(0xD900, 0x000C);
}