// Compiler: CC8 (C Compiler for U8)
// Target: Casio fx-580 (or similar) calculator
// Target CPU: nXU8 (Casio's custom CPU architecture)
// Architecture: 8-bit RISC architecture with a 16-bit instruction set
// Memory: 64KB RAM, 256KB ROM
// Display: 192x64 pixel LCD screen

#include "Casio/types.h"
#include "Casio/functions.h"
#include "Casio/keys.h"

/*
 *
 * DATA SECTION
 *
*/

extern void d_player();

/*
 *
 * CODE SECTION
 *
*/

#pragma Segcode "maincode"
#pragma Segcode 0x3:0x0FC0

__asm("cseg #3 at 0FC0h")

#define HW_STATUS_BAR ((volatile byte *)0xF800) // from 0 to 22, skip 14 and 20

void main(void){
	byte *player[8];
	byte px = (192-8)/2;
	byte py = 2;
	byte yv = 0;
	word *kiko = (volatile word *)0xD180;
	byte i;
	byte jump_lock;  // prevents continuous jump when holding key

	init_screen();
	memcpy_seg3((word __near)d_player, player, 8);
	
	do {
		buffer_clear();
		init_screen();
		for (i = 50; i < 58; i++) {
			line_draw(0, i, 192, i);
		}

		render_bitmap(px, py, 8, 8, player);
		py += yv;
		yv += 1;

		render_ddd4();
		*kiko = 0xFFFF;
		getscancode_nodelay(kiko);
		// reset jump lock when jump key is released
		if (*kiko != 0x0204 && *kiko != 0x0404 && *kiko != 0x0104) jump_lock = 0;

		if (get_pixel(px, py + 8)) {
			yv = 0;
			while (get_pixel(px, py + 7)) {
				py--;
			}

			// single jump when key first pressed
			if (!jump_lock && (*kiko == 0x0204 || *kiko == 0x0404 || *kiko == 0x0104)) {
				yv = -7;
				jump_lock = 1;
			}
		}


		switch (*kiko) {
			case 0x0102:
				px -= 4;
				break;
			case 0x0402:
				px += 4;
				break;
			case 0x0204:

				break;
			case 0x0104:

				px -= 4;

				break;
			case 0x0404:

				px += 4;
				break;

			default:
				break;
		}

		//delay(100);
		
	} while (1);
}

byte get_pixel(word x, word y)
{

    return(deref(((word)y<<5)+(x>>3)+0xF800)&(0x80>>(x&7)))?1:0;
}

void debugOutputString(const char *s){
	#pragma asm
		lea [er0]
	loop7:
		l r0,r2:[ea+]
		st r0,6:0721h
		bne loop7
		rt
	#pragma endasm

}

void memcpy_seg3(word src, word dest, word len){
	#pragma asm
		pop er4
		lea [er2]
	loop6:
		l r6, 3:[er0]
		add er0, #1
		st r6, [ea+]
		add er4, #-1
		bne loop6
		push er4
		rt
	#pragma endasm
}
