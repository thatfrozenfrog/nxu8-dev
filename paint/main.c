#include "base.h"
#include "thefont.h"
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
    SP_CALC = 0x31
};


void drawbitmap(const byte* ptr, word offset, byte width, byte height)
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
			deref(0xf800+j) = ptr[i];
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
void print(const byte* str, byte x, byte y)
{
	const byte* what = str;
	word curoffset = (word)x+((word)y<<8)+((word)y<<7);
	word i = 0;
	while(*what)
	{

		drawbitmap(image_raw+((word)(*what)<<4),curoffset,1,16);
		++curoffset;
		++what;
		++i;
		//++i;
	}
}


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


void main()
{
    while(1)
    {
        byte pressedbutton = CheckButtons();
        if(pressedbutton == 0xff)
        {
            continue;
        }
        if(pressedbutton == B_0)
        {
            print("You pressed 0", 0, 0);
        }
        deref(0xE000) = pressedbutton;
    }
}