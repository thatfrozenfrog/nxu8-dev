#include "base.h"
#ifdef __INTELLISENSE__
#define __near
#endif
typedef unsigned char byte;
typedef unsigned short uint16_t;
// Short = signed word
// word = unsigned 2 bytes
// byte = unsigned char
// char = signed 2 nibbles
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
/*
void blank(byte a, byte b, byte c, byte d) {
    return;
}
void ss (word k) {
    return;
}

void loop(word start, byte l) {

    word i = 0;
    word line = 0x00 << 8 | l;
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
    loop(0xD800, 0x0C);
}
*/

/*
public static (double, double, double) RotateY(double x, double y, double z, double angle)
{
    double newY = y * Math.Cos(angle) - z * Math.Sin(angle);
    double newZ = y * Math.Sin(angle) + z * Math.Cos(angle);
    return (x, newY, newZ);
}

public static (double, double, double) RotateX(double x, double y, double z, double angle)
{
    double newX = x * Math.Cos(angle) - z * Math.Sin(angle);
    double newZ = x * Math.Sin(angle) + z * Math.Cos(angle);
    return (newX, y, newZ);
}

public static (double, double, double) RotateZ(double x, double y, double z, double angle)
{
    double newX = x * Math.Cos(angle) - y * Math.Sin(angle);
    double newY = x * Math.Sin(angle) + y * Math.Cos(angle);
    return (newX, newY, z);
}

public static (double, double, double) _3Dto2D(double x, double y, double z, double fov, double dist)
{
    double f = fov / (z + dist);
    double newX = x * f;
    double newY = y * f;
    return (newX, newY, z);
}
*/
const word sin_table[] = {
0,27,29,5,-24,-31,-9,21,32,13,-17,-32,-17,13,32,21,-9,-31,-24,5,29,27,0,-27,-29,-4,24,31,9,-21,-32,-13,18,32,17,-14,-32,-21,9,31,24,-5,-29,-27,1,27,29,4,-25,-31,-8,21,32,13,-18,-32,-17,14,32,20,-10,-31,-24,5,29,26,-1,-27,-29,-4,25,30,8,-22,-32,-12,18,32,16,-14,-32,-20,10,31,23,-6,-30,-26,1,28,29,3,-25,-30,-8,22,31,12,-18,-32,-16,14,32,20,-10,-31,-23,6,30,26,-1,-28,-28,-3,25,30,8,-22,-31,-12,19,32,16,-15,-32,-20,11,31,23,-6,-30,-26,2,28,28,3,-25,-30,-7,22,31,12,-19,-32,-16,15,32,19,-11,-31,-23,6,30,26,-2,-28,-28,-3,25,30,7,-22,-31,-11,19,32,15,-15,-32,-19,11,31,23,-7,-30,-26,2,28,28,2,-26,-30,-7,23,31,11,-19,-32,-15,15,32,19,-11,-31,-22,7,30,25,-3,-28,-28,-2,26,30,6,-23,-31,-11,19,32,15,-16,-32,-19,12,31,22,-7,-30,-25,3,28,28,2,-26,-30,-6,23,31,11,-20,-32,-15,16,32,19,-12,-31,-22,8,30,25,-3,-28,-28,-1,26,30,6,-23,-31,-10,20,32,14,-16,-32,-18,12,31,22,-8,-30,-25,3,29,28,1,-26,-30,-6,23,31,10,-20,-32,-14,16,32,18,-12,-32,-22,8,30,25,-4,-29,-27,-1,26,29,5,-24,-31,-10,20,32,14,-17,-32,-18,13,32,21,-8,-31,-25,4,29,27,1,-27,-29,-5,24,31,9,-21,-32,-14,17,32,18,-13,-32,-21,9,31,24,-4,-29,-27,0,27,29,5,-24,-31,-9,21,32,13,-17,-32,-17,13,32,21,-9,-31,-24,5,29,27,0,-27,-29,-5,24
};
const word cos_table[] = {
32,17,-13,-32,-21,9,31,24,-5,-29,-27,0,27,29,4,-24,-31,-9,21,32,13,-18,-32,-17,14,32,21,-9,-31,-24,5,29,27,0,-27,-29,-4,24,31,9,-21,-32,-13,18,32,17,-14,-32,-20,10,31,24,-5,-29,-27,1,27,29,4,-25,-30,-8,22,32,13,-18,-32,-17,14,32,20,-10,-31,-24,5,29,26,-1,-27,-29,-4,25,30,8,-22,-32,-12,18,32,16,-14,-32,-20,10,31,23,-6,-30,-26,1,28,29,3,-25,-30,-8,22,31,12,-18,-32,-16,15,32,20,-10,-31,-23,6,30,26,-2,-28,-28,-3,25,30,7,-22,-31,-12,19,32,16,-15,-32,-20,11,31,23,-6,-30,-26,2,28,28,3,-25,-30,-7,22,31,11,-19,-32,-16,15,32,19,-11,-31,-23,7,30,26,-2,-28,-28,-2,26,30,7,-23,-31,-11,19,32,15,-15,-32,-19,11,31,23,-7,-30,-26,2,28,28,2,-26,-30,-7,23,31,11,-19,-32,-15,16,32,19,-11,-31,-22,7,30,25,-3,-28,-28,-2,26,30,6,-23,-31,-11,20,32,15,-16,-32,-19,12,31,22,-7,-30,-25,3,28,28,2,-26,-30,-6,23,31,10,-20,-32,-15,16,32,18,-12,-31,-22,8,30,25,-3,-29,-28,-1,26,30,6,-23,-31,-10,20,32,14,-16,-32,-18,12,32,22,-8,-30,-25,4,29,27,1,-26,-29,-5,24,31,10,-20,-32,-14,17,32,18,-13,-32,-22,8,30,25,-4,-29,-27,-1,27,29,5,-24,-31,-10,20,32,14,-17,-32,-18,13,32,21,-9,-31,-24,4,29,27,0,-27,-29,-5,24,31,9,-21,-32,-14,17,32,18,-13,-32,-21,9,31,24,-4,-29,-27,0,27,29,5,-24,-31,-9,21,32,13,-17,-32,-17,13,32,21
};

char sinlookup(byte rad) {
    return sin_table[rad];
}

void main(void) {
    byte val = deref(0xD800);
    deref(0xD810) = sinlookup(val);
    deref(0xD822) = deref(0xD820) - deref(0xD821);
}