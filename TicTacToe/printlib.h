#include "thefont.h"
#include "base.h"
word print(const byte* str, byte x, byte y)
{
	const byte* what = str;
	word curoffset = (word)x+((word)y<<8)+((word)y<<7);
	//derefw(0xB510) = (word)(what);
	word i = 0;
	while(*what)
	{
		//deref(0xB500+i) = *what;

		drawbitmap(image_raw+((word)(*what)<<4),curoffset,1,16);
		++curoffset;
		++what;
		++i;
		//++i;
	}
	return i;
}

char printdwordbuf[5] = "\x00\x00\x00\x00";

void PrintWord(word num, byte x, byte y)
{
	byte luup = 0;
	byte* out = &printdwordbuf[3];
	for(luup = 0; luup < 3; luup++)
	{
		if((num&0xf) > 0x9)
		{
			*out = 'a'+(num&0xf)-0xa;
		}
		else
		{
			*out = '0'+(num&0xf);
		}
		num = num>>4;
		if(!num)
		{
			print(out,x,y);
			return;
		}
		out--;
	}
	if((num&0xf) > 0x9)
	{
		*out = 'a'+(num&0xf)-0xa;
	}
	else
	{
		*out = '0'+(num&0xf);
	}
	print(out,x,y);
}