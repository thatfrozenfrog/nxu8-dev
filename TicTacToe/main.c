/*
 * main.c
 *
 *  Created on: 12 Sep 2024
 */

#include "base.h"
#include "suwa.h"
#include "printlib.h"
#include <stdio.h>
#include <string.h>
#include "tictactoe.h"


typedef unsigned char uint8_t;
typedef unsigned short uint16_t;

byte posy = 0;
byte posx = 0;


enum BUTTON
{
	B_0 = 0xb,
	B_1 = 0x3f,
	B_2 = 0x37,
	B_3 = 0x2f,
	B_4 = 0x3e,
	B_5 = 0x36,
	B_6 = 0x2e,
	B_7 = 0x3d,
	B_8 = 0x35,
	B_9 = 0x2d,

	SP_UP = 0x28,
	SP_DOWN = 0x21,
	SP_LEFT = 0x29,
	SP_RIGHT = 0x20,
	SP_PLUS = 0x27,
	SP_MINUS = 0x1F,
    SP_MUL = 0x26,
    SP_DIV = 0x1E,
    SP_OPTN = 0x39,
    SP_CALC = 0x31,
	SP_EQU = 0x0F
};



byte lastbutton = 0xff;
byte CheckButtons()
{
	byte x;
	byte y;
	byte i = 0;
	for(x = 0x80; x != 0; x = x >> 1)
	{
		deref(0xf046) = x;
		for(y = 0x80; y != 0; y = y >> 1)
		{
			if((deref(0xf040) & y) == 0)
			{
				if(i != lastbutton)
				{
					lastbutton = i;
					return i;
				}
				return 0xff;
			}
			++i;
		}
	}
	lastbutton = 0x50;
	return 0xff;
}

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


void drawbitmap(const byte* ptr, word offset, byte width, byte height)
{
    word x;
    word y;
    word i = 0;
    word j = 0;
    deref(0xF037) = 0;
    for(y = 0; y < offset; y++)
    {
        ++j;
        if((j&0x1f) == 0x18)
        {
            j += 0x8;
        }
    }

    for(y = 0; y < height; y++)
    {
        for(x = 0; x < width; x++)
        {
            deref(0xf820+j) = ptr[i];
            ++j;
            if((j&0x1f) == 0x18)
            {
                j += 0x8;
            }
            ++i;
        }
        j += 32-width;
        if((j&0x1f) == 0x18)
        {
            j += 0x8;
        }
    }
}

void invertbitmap( word offset, byte width, byte height)
{
    word x;
    word y;
    word i = 0;
    word j = 0;
    for(y = 0; y < offset; y++)
    {
        ++j;
        if((j&0x1f) == 0x18)
        {
            j += 0x8;
        }
    }

    for(y = 0; y < height; y++)
    {
        for(x = 0; x < width; x++)
        {
            deref(0xf820+j) = (~deref(0xF820+j));
            ++j;
            if((j&0x1f) == 0x18)
            {
                j += 0x8;
            }
            ++i;
        }
        j += 32-width;
        if((j&0x1f) == 0x18)
        {
            j += 0x8;
        }
    }
}


void set_bits(uint8_t *mem_address, int start_bit, int num_bits, byte color, byte invert) {
    // Tính byte và bit offset ban đầu và cuối
    int start_byte = start_bit / 8;
    int start_offset = start_bit % 8;

    int end_bit = start_bit + num_bits - 1;
    int end_byte = end_bit / 8;
    int end_offset = end_bit % 8;
    int i;
    uint8_t mask, start_mask, end_mask;
    // Tạo giá trị cho `color_mask` dựa trên `color`
    // Nếu `color` là 1, mask sẽ là 0xFF, nếu `color` là 0, mask sẽ là 0x00
    byte color_mask = color ? 0xFF : 0x00;

    // Trường hợp chỉ nằm trong 1 byte
    if (start_byte == end_byte) {
        // Tạo mask cho bit trong byte đầu tiên
        mask = ((1 << num_bits) - 1) << (8 - start_offset - num_bits);
        if (invert) {
            *(mem_address + start_byte) ^= mask;  // XOR để invert bit
        } else {
            *(mem_address + start_byte) = (*(mem_address + start_byte) & ~mask) | (color_mask & mask);  // OR để đặt bit với màu sắc
        }
    } else {
        // Xử lý byte đầu tiên với mask (các bit từ start_offset đến hết byte)
        start_mask = 0xFF >> start_offset;
        if (invert) {
            *(mem_address + start_byte) ^= start_mask;  // XOR để invert bit
        } else {
            *(mem_address + start_byte) = (*(mem_address + start_byte) & ~start_mask) | (color_mask & start_mask);  // OR để đặt bit với màu sắc
        }

        // Xử lý các byte ở giữa (toàn bộ bit là color hoặc invert)
        for (i = start_byte + 1; i < end_byte; i++) {
            if (invert) {
                *(mem_address + i) ^= 0xFF;  // XOR toàn bộ byte để invert
            } else {
                *(mem_address + i) = color_mask;  // Đặt toàn bộ byte thành `color`
            }
        }

        // Xử lý byte cuối với mask (các bit từ đầu byte đến end_offset)
        end_mask = ~(0xFF >> (end_offset + 1));
        if (invert) {
            *(mem_address + end_byte) ^= end_mask;  // XOR để invert bit
        } else {
            *(mem_address + end_byte) = (*(mem_address + end_byte) & ~end_mask) | (color_mask & end_mask);  // OR để đặt bit với màu sắc
        }
    }
}

void renderRLE(const byte* ptr, int length, int x, int y){
	uint8_t *mem_address = (uint8_t *)0xF820 + y * 0x20;
    int i = 0;
    uint8_t line = 0;
    int j = x;  // Pixel offset within the line
    uint8_t color = 1;
	for (i = 0; i <= length; i++) {
		if (ptr[i] == 0xFF) {
			// Line break: move to the next line
			line++;
			j = x;  // Reset horizontal position to the start of the line
			color = 1;

		} else {

			// Determine the color (alternates every byte)
			 // 1 for black, 0 for white (or inverted)


			// Call the function to set the bits on the current line
			set_bits(mem_address + line * 0x20, j, ptr[i], color, 0);

			if (color == 0){
				color = 1;
			} else {
				color = 0;
			}
			j = j + ptr[i];

			// Advance the horizontal offset by the number of bits drawn
		}
	}
}


void render_rect(int x1, int y1, int x2, int y2, byte color, byte invert) {
	uint8_t *mem_address = (uint8_t *)0xF820;
	int i;
	int y;
	for (i = y1; i <= y2; i++) {
		y = i - y1;
		set_bits(mem_address + i * 0x20, x1, x2 - x1, color, invert);
	}

}

void invert_line(const word line)
{
	word i = 0;
	word j = 0;
	word offset = (line<<9);
	for(i = 0; i < 512; i++) //used to be 512
	{
		deref(0xF820+i+offset) = (~deref(0xF820+i+offset));
	}
}



void main() {
	char screen[] = "Tic Tac Toe";
	int l,i;
	uint8_t *mem_address = (uint8_t *)0xF820;
	posx = 1; posy = 1;
	memset(0xD000,0x00,0x15D3);
	memset(0xf800,0x00,0x800);


	deref(0xF020) = 0xFF;
	deref(0xF021) = 0xFF;
	deref(0xF025) = 0x01;
	__asm ("mov psw, #0h");
	__asm ("EI");
	deref(0xF010) = 0x20; //Enable TM0INT


	drawstage();
	while (1) {

		byte pressedbutton = CheckButtons();
		if (pressedbutton != 0xFF){
			deref(0xD170) = pressedbutton;
		}
		switch (pressedbutton) {
			case 0xFF:
				delay(100);
				break;
			case SP_RIGHT:
				posx++;
				drawstage();
				break;
			case SP_LEFT:
				posx--;
				drawstage();
				break;
			case SP_UP:
				posy--;
				drawstage();
				break;
			case SP_DOWN:
				posy++;
				drawstage();
				break;

			case SP_EQU:
				break;

		}

		deref(0xD181) = posx;


	}
}





void drawstage(void){
	//Confine the x value
	if (posx > 3) {
		posx = 1;
	} else if (posx < 1) {
		posx = 3;
	}
	if (posy > 3) {
		posy = 1;
	} else if (posy < 1) {
		posy = 3;
	}
	drawbitmap(board1,0x08,0x8,0x3F);
	drawbitmap(cross,0x08,0x3,21);
	render_rect(45 + posx * 20, 1 + (posy - 1) * 21, 66 + posx*20, 20 + (posy-1) * 21, 1, 1);

	delay(4);
	/*
		render_rect(65, 1, 85, 21, 1, 1);
		render_rect(86, 1, 106, 21, 1, 1);
		render_rect(107, 1, 126, 21, 1, 1);

		render_rect(65, 23, 85, 42, 1, 1);
		render_rect(86, 23, 106, 42, 1, 1);
		render_rect(107, 23, 126, 42, 1, 1);

		render_rect(65, 44, 85, 61, 1, 1);
		render_rect(86, 44, 106, 61, 1, 1);
		render_rect(107, 44, 126, 61, 1, 1);
	 */
}

