#include "base.h"

void render(word addr)
{
    word i = 0;
    word j = 0;
    for(i = 0; i < 0x05E8; i++)
    {
        j++;
        if((j & 0x001F) == 0x18)
        {
            j+=8;
        }
        *((word *)(0xf820 + j)) = *((word *)(addr + i));
    }
}
void main()
{
    render(0x0E40);
}