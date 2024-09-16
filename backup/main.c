#include "base.h"
#ifdef __INTELLISENSE__
#define __near
#endif
typedef unsigned short uint16_t;

int compare(uint16_t passlen)
{
    word i;
    for (i = 0; i < passlen; i++)
    {
        // Fixed syntax for dereferencing and added parentheses
        if (*((word *)((char *)0xD500 + i)) != *((word *)((char *)0xD600 + i)))
        {
            return 0; // Added semicolon
        }
    }
    return 1; // Added semicolon
}

void main(void)
{
    compare(5);
}