org 0xD730
home:
	adr_of y
	er14 = adr_of x
	call 0x2F5F0
x:
	adr_of [-2] reset
	0x0000
	adr_of [-16] home
	0x0000
	0x00000000
	pop xr0
y:
	0x00000000
	[er8] += er2,pop xr8
	0x00000000

reset_key:
	er8 = er0
	setlr
	DI,RT
	er0 - er2_eq,r0 = 1,rt
	er2 = adr_arith [-2] other_key_1 - adr_arith [-2] reset, 0x00
	r1 = 0,rt
	er0 *= r2,er2 = er0,er0 += er4,rt
	er6 = er0,er0 = er8,pop qr8
	0x0000000000000000
	sp = er6,pop er8
	adr_of [-16] home
reset:
	xr4 = 0x0000, adr_of [-2] key_up
	er2 = er0,er0 += er4,rt
	[er8] = er2,pop xr8
	0x00000000
	sp = er6,pop er8
other_key_1:
	er6 = adr_of [-2] restore
	sp = er6,pop er8

key_up:
	er8 = er0
	er2 = 0x80, 0x04	# R2 = KI = 80, R3 = KO = 04
	er0 - er2_eq,r0 = 1,rt
	r1 = 0,rt
	er4 = adr_of [-2] key_down
	er2 = adr_arith [-2] up - adr_arith [-2] key_down, 0x00
	er0 *= r2,er2 = er0,er0 += er4,rt
	er6 = er0,er0 = er8,pop qr8
	0x0000000000000000
	sp = er6,pop er8

key_down:
	er8 = er0
	er2 = 0x40, 0x08	# R2 = KI = 40, R3 = KO = 08
	er0 - er2_eq,r0 = 1,rt
	r1 = 0,rt
	er4 = adr_of [-2] key_left
	er2 = adr_arith [-2] down - adr_arith [-2] key_left, 0x00
	er0 *= r2,er2 = er0,er0 += er4,rt
	er6 = er0,er0 = er8,pop qr8
	0x0000000000000000
	sp = er6,pop er8
# press key [up]
up:
	qr0 = 0x0000, 0xFF00, 0x0000, adr_of [-2] count
	sp = er6,pop er8

	
key_left:
	er8 = er0
	er2 = 0x40, 0x04	# R2 = KI = 40, R3 = KO = 04
	er0 - er2_eq,r0 = 1,rt
	r1 = 0,rt
	er4 = adr_of [-2] key_right
	er2 = adr_arith [-2] left - adr_arith [-2] key_right, 0x00
	er0 *= r2,er2 = er0,er0 += er4,rt
	er6 = er0,er0 = er8,pop qr8
	0x0000000000000000
	sp = er6,pop er8
# press key [down]
down:
	qr0 = 0x0000, 0x0100, 0x0000, adr_of [-2] count
	sp = er6,pop er8
	
key_right:
	er8 = er0
	er2 = 0x80, 0x08	# R2 = KI = 80, R3 = KO = 08
	er0 - er2_eq,r0 = 1,rt
	r1 = 0,rt
	er4 = adr_of [-2] key_equal
	er2 = adr_arith [-2] right - adr_arith [-2] key_equal, 0x00
	er0 *= r2,er2 = er0,er0 += er4,rt
	er6 = er0,er0 = er8,pop qr8
	0x0000000000000000
	sp = er6,pop er8
# press key [left]
left:
	qr0 = 0x0000, 0xFFFF, 0x0000, adr_of [-2] count
	sp = er6,pop er8
	
key_equal:
	er8 = er0
	er2 = 0x01, 0x40	# R2 = KI = 01, R3 = KO = 40
	er0 - er2_eq,r0 = 1,rt
	r1 = 0,rt
	er4 = adr_of [-2] key_del
	er2 = adr_arith [-2] equal - adr_arith [-2] key_del, 0x00
	er0 *= r2,er2 = er0,er0 += er4,rt
	er6 = er0,er0 = er8,pop qr8
	0x0000000000000000
	sp = er6,pop er8
# press key [right]
right:
	qr0 = 0x0000, 0x0001, 0x0000, adr_of [-2] count
	sp = er6,pop er8

key_del:
	er8 = er0
	er2 = 0x04, 0x08	# R2 = KI = 04, R3 = KO = 08
	er0 - er2_eq,r0 = 1,rt
	r1 = 0,rt
	er4 = adr_of [-2] key_ac
	er2 = adr_arith [-2] del - adr_arith [-2] key_ac, 0x00
	er0 *= r2,er2 = er0,er0 += er4,rt
	er6 = er0,er0 = er8,pop qr8
	0x0000000000000000
	sp = er6,pop er8
# press key [equal]
equal:
	er2 = 0xD722
	er0 = [er2],r2 = 9,rt
	er2 = 0x00, 0x00
	er6 = adr_of [-2] pixel
	sp = er6,pop er8

key_ac:
	er8 = er0
	er2 = 0x04, 0x10	# R2 = KI = 04, R3 = KO = 10
	er0 - er2_eq,r0 = 1,rt
	r1 = 0,rt
	er4 = adr_of [-2] key_0
	er2 = adr_arith [-2] ac - adr_arith [-2] key_0, 0x00
	er0 *= r2,er2 = er0,er0 += er4,rt
	er6 = er0,er0 = er8,pop qr8
	0x0000000000000000
	sp = er6,pop er8
# press key [del]
del:
	er2 = 0xD722
	er0 = [er2],r2 = 9,rt
	er2 = 0x01, 0x00
	er6 = adr_of [-2] pixel
	sp = er6,pop er8

key_0:
	er8 = er0
	er2 = 0x10, 0x40	# R2 = KI = 10, R3 = KO = 40
	er0 - er2_eq,r0 = 1,rt
	r1 = 0,rt
	er4 = adr_of [-2] other_key_2
	er2 = adr_arith [-2] 0 - adr_arith [-2] other_key_2, 0x00
	er0 *= r2,er2 = er0,er0 += er4,rt
	er6 = er0,er0 = er8,pop qr8
	0x0000000000000000
	sp = er6,pop er8
# press key [ac]
ac:
	buffer_clear
	render.ddd4
	er6 = adr_of [-2] restore
	sp = er6,pop er8

other_key_2:
	er6 = adr_of [-2] restore
	sp = er6,pop er8
# press key [0]
0:
	xr0 = 0xD722, 0x00, 0x00
	[er0] = er2,rt

count:
	er8 = 0xD722
	[er8] += er2,pop xr8
	0x00000000
pixel:
	pixel_draw
	render.ddd4

restore:
	setlr
	DI,RT
	xr0 = adr_of length, 0x01, 0x00
	[er0] = er2,rt
	qr0 = pr_length, 0xE5E0, adr_of home, adr_of home
	0x8932
length:
	0x0008
	0x0000
set_sp:
	sp = er6,pop er8