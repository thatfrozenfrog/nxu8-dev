#include "base.h"

// Assuming 'word' is defined in base.h as a 16-bit unsigned integer
// If not, you might want to define it as: typedef unsigned short word;

// Global variables for width and height
word width;
word height;

void render(word addr, word x)
{
    word i = 0;
    word j = x;
    word s = width * height;
    for (i = 0; i < s; i++)
    {
        j++;
        if ((j & 0x001F) == 0x18)
        {
            j += 8 + x;
        }
        *((word *)(0xf820 + j)) = *((word *)(addr + i));
    }
}

void main()
{
    width = 0x18;
    height = 0x3f;
    render(0x0E40, 10);
}