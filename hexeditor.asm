def d_E660 dest
def 2F5F0 getkey

org 0xE330
home:
    adr y
    pop er14 (adr x)
    getkey
x:
    hex 00 00 00 00
y:
    hex 00 00 00 00 00 00 00 00
	pop xr0 (adr y DA 83)
	setlr
	DI,RT
	cvt_keycode

key_greater:
	er8 = er0
	pop er2 (2F 00)
	er0 - er2_gt,r0 = 0|r0 = 1,rt
	pop er2 (20 00)
	er0 *= r2,er2 = er0,er0 += er4,rt
	pop er2 (13 00)
	pop er4 (adr key_less -2)
	er0 *= r2,er2 = er0,er0 += er4,rt
	er6 = er0,er0 = er8,pop qr8 (00 00 00 00 00 00 00 00)
	sp = er6,pop er8

key_less:
	er8 = er0
	pop er2 (40 00)
	er2 - er0_gt,r0 = 0|r0 = 1,rt
	pop er2 (adr_arith [-2]key_left [-2]k_typing 00)
	pop er4 (adr k_typing -2)
	er0 *= r2,er2 = er0,er0 += er4,rt
	er6 = er0,er0 = er8,pop qr8 (00 00 00 00 00 00 00 00)
	sp = er6,pop er8 (adr modifier)
	
k_typing:
	pop er2 (00 00)
	[er8] += er2,pop xr8 (adr value 0F 00)
	er2 += er8,rt
	call 0x161CC	;R1 = 0FH, R0 &= 0FH, R1 -= R10_EQ,RT
	er10 = er2,rt
	er2 = er0,er0 += er4,rt
	er0 = er10,pop xr8 (00 00 00 00)
	[er0] = r2
	pop er2 (adr value)
	er0 - er2_gt,r0 = 0|r0 = 1,rt
	pop er2 (adr_arith [-2]jump_out [-2]cont 00)
	pop er4 (adr cont -2)
	er0 *= r2,er2 = er0,er0 += er4,rt
	er6 = er0,er0 = er8,pop qr8 (00 00 00 00 00 00 00 00)
	sp = er6,pop er8 (adr addr)
cont:
	pop er2 (00 00)
	[er8] += er2,pop xr8 (adr store 00 00)
	[er8] = er2,pop xr8 (00 00 02 00)
	pop er6 (01 00)
	call 0x10E80	;POP EA, R6 -= 1,_NE, POP XR4
	adr value		;EA
	hex 00 00		;ER4
	adr then -2		;ER6
	pop er12
store:
	hex 00 00
	call 0x16EBC	;R0 = [EA+], R0 << 4, R10 -= 1_EQ, R1 = [EA+], R0 |= R1,...
	hex 00 00
	sp = er6,pop er8 (adr modifier)

jump_out:
	pop er2 (01 00)
	[er8] += er2,pop xr8 (00 00 00 00)
	pop er6 (adr delay -2)
	sp = er6,pop er8

key_left:
	er8 = er0
	setlr
	DI,RT
	pop er2 (1F FC)
	er0 - er2_eq,r0 = 1|r0 = 0,rt
	pop er2 (adr_arith [-2]k_left [-2]key_right 00)
	pop er4 (adr key_right -2)
	er0 *= r2,er2 = er0,er0 += er4,rt
	er6 = er0,er0 = er8,pop qr8 (00 00 00 00 00 00 00 00)
	sp = er6,pop er8

key_right:
	er8 = er0
	pop er2 (1E FC)
	er0 - er2_eq,r0 = 1|r0 = 0,rt
	pop er2 (adr_arith [-2]k_right [-2]key_ac 00)
	pop er4 (adr key_ac -2)
	er0 *= r2,er2 = er0,er0 += er4,rt
	er6 = er0,er0 = er8,pop qr8 (00 00 00 00 00 00 00 00)
	sp = er6,pop er8

key_ac:
	er8 = er0
	pop er2 (26 FC)
	er0 - er2_eq,r0 = 1|r0 = 0,rt
	pop er2 (adr_arith [-2]k_ac [-2]other_key 00)
	pop er4 (adr other_key -2)
	er0 *= r2,er2 = er0,er0 += er4,rt
	er6 = er0,er0 = er8,pop qr8 (00 00 00 00 00 00 00 00)
	sp = er6,pop er8

other_key:
	pop er6 (adr restore -2)
	sp = er6,pop er8 (adr addr)

k_left:
	pop er2 (FF FF)
	[er8] += er2,pop xr8 (00 00 00 00)
	pop er6 (adr next -2)
	sp = er6,pop er8 (adr addr)

k_right:
	pop er2 (01 00)
	[er8] += er2,pop xr8 (00 00 00 00)
	pop er6 (adr next -2)
	sp = er6,pop er8 (adr addr)

k_ac:
	pop er2 (00 00)
	[er8] += er2,pop xr8 (00 00 00 00)
	er0 = er2,rt
	er6 = er0,er0 = er8,pop qr8 (00 00 00 00 00 00 00 00)
	sp = er6,pop er8 (adr modifier)

then:
	pop er2 (00 00)
	[er8] = er2,pop xr8 (00 00 00 00)
next:
	pop er0 (adr addr +1)
	r0 = [er0]
	hex_byte
	pop er4 (adr string_1 +13)
	setlr
	DI,RT
	[er4] = er0,pop er0,rt (adr addr)
	r0 = [er0]
	hex_byte
	pop er4 (adr string_1 +15)
	[er4] = er0,pop er0,rt (adr addr)
	er0 = [er0],pop xr8,rt (00 00 00 00)
	r0 = [er0]
	hex_byte
	pop er4 (adr string_2 +12)
	[er4] = er0,pop er0,rt (00 00)
	pop xr0 (DDD4 0600)
	memzero
	pop xr0 (05 05 adr string_1)
	line_print
	render.ddd4
	pop xr0 (05 25 adr string_2)
	line_print
	render.ddd4

delay:
	pop xr8 (00 05 01 00)

restore:
	er0 = er8
	delay
	DI,RT
	pop er8 (adr length)
	pop er2 (01 00)
	[er8] = er2,pop xr8
	hex 00 00 00 00
	pop qr0 (adr home adr dest pr_length adr home)
	hex F8 4B
length:
	hex 08 00 00 00
set_sp:
	sp = er6,pop er8

addr:
	hex 52 D5

modifier:
	hex 00 00

value:
	hex 00 00

string_1:
	hex F4 60 F4 48 61 20 63 68 F4 7F 3A 20 00 00 00 00
	hex 00	;end string
string_2:
	hex 47 69 F4 71 20 74 72 F4 48 3A 20 00 00
	hex 00	;end string