#include "base.h"

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
int main()
{
    word base = 0xF820;
    while(1)
    {
        byte pressedbutton = CheckButtons();
        if(pressedbutton == 0xff)
        {
            continue;
        }
		*((byte*)(base)) = pressedbutton;
		base++;
    }
}