/*
 * main.c
 *
 *  Created on: 21 Jan 2025
 *      Author: suika
 */

#include "base.h"
#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#include "LCD/LCDConfig.h"
#include "LCD/LCDPaint.h"

void delay(ushort after_ticks)
{
    if ((FCON & 2) != 0)
        FCON &= 0xfd;
    __DI();
    Timer0Interval = after_ticks;
    Timer0Counter = 0;
    Timer0Control = 0x0101;
    InterruptPending_W0 = 0;
    StopAcceptor = 0x50;
    StopAcceptor = 0xa0;
    StopControl = 2;
    __asm("nop");
    __asm("nop");
    __EI();
}





void main() {
	memset(0xD000,0x00,0x15D3);
	memset(0xDDD4,0xff,0x800);

	render_copy(0xDDD4);


}
