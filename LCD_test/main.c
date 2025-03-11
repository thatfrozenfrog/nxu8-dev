/*
 * main.c
 *
 *  Created on: 12 Sep 2024
 */

#include "base.h"
#include "LCD/LCDConfig.h"
#include "LCD/LCDPaint.h"

#include <stdio.h>

typedef unsigned char uint8_t;
typedef unsigned short uint16_t;
void main() {

	memset(0xD000,0x00,0x15D3);
	memset(0xf800,0x00,0x800);

    
}