/*
 * key.h
 *
 *  Created on: 2024年9月16日
 *      Author: 15874
 */
#include "base.h"
#ifndef KEY_H_
#define KEY_H_
typedef struct
{
    byte ki;
    byte ko;
} kiko;
typedef byte bool;
bool scan_key(kiko __near *er8)
{
	byte r1 = 0x01;
	byte r3 = 0x01;
	byte r2;

	while (r3 <= 0x07)
	{
		KeyboardOut = r1;
		r2 = KeyboardIn;

		if (r2 == 0xFF)
		{
			r1 <<= 1;
			r3++;
		}
		else
		{
			er8->ko = r1;
			er8->ki = ~r2;
			return 1;
		}
	}

	return r3 <= 0x07;
}
byte key_debounce(kiko __near *er8)
{
	byte r5 = 0x00;
	byte r6 = 0x01;
	byte r4;

	while (r6 <= 5)
	{
		delay(10);

		KeyboardOut = er8->ko;
		r4 = ~KeyboardIn;

		KeyboardOut = 0;

		if ((r4 & er8->ki) != 0)
		{
			r5++;
			er8->ki &= r4;
		}

		r6++;
	}

	return r5 == 0x05;
}

kiko wait_kiko()
{
	kiko kv;
redo:
	KeyboardOut = 0xff;
	KeyboardInMask = 0xff;
	while (1)
	{
		delay(4000);
		if (InterruptPending0 & 2)
		{
			if (scan_key((kiko __near *)&kv))
			{
				key_debounce((kiko __near *)&kv);
				if (kv.ki != 0)
				{
					return kv;
				}
			}
			goto redo;
		}
	}
}
enum KeyCode_2
{
	Up = 0x80,
	Down,
	Left,
	Right,
	Stdn,
	Ok,
	PgUp,
	PgDn,
	Shift,
	Set,
	Home,
	Back,
	Var,
	Func,
	Ctlg,
	Tools,
	Delete,
	AC
};
const word keymap[] = {
	0x0031,
	0x0034,
	0x0037,
	0x0000,
	0x0000,
	Shift,
	Set,
	0x0000,
	0x0032,
	0x0035,
	0x0038,
	0x0000,
	0x0000,
	Var,
	Back,
	Home,
	0x0033,
	0x0036,
	0x0039,
	0x0000,
	0x0000,
	Func,
	Left,
	0x0000,
	0x002B,
	0x0024,
	Delete,
	0x0000,
	0x0000,
	Down,
	Ok,
	Up,
	0x002D,
	0x0026,
	AC,
	0x0000,
	0x0000,
	Ctlg,
	Right,
	0x0000,
	0x0000,
	0x0000,
	0x0000,
	0x0000,
	0x0000,
	Tools,
	PgDn,
	PgUp,
	Ok,
	0x0000,
	0x0000,
	0x0000,
	0x0030,
	0x0000,
	0x0000,
	0x0000,
};

byte get_msb(byte a){
#pragma asm
    mov r1,#0
loop0721_get_msb:
    add r1,#1
    srl r0,#1
    mov r0,r0
    bne loop0721_get_msb
    mov r0,r1
    add r0,#-1
#pragma endasm
}
word getkeycode()
{
	kiko kv;
	kv = wait_kiko();
	return keymap[(get_msb(kv.ko) << 3) + get_msb(kv.ki)];
}


#endif /* KEY_H_ */
