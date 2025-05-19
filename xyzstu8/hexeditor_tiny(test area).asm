type(ML620906)
model	large
romwindow 0, 0cfffh

dw	0EFFCh
dw	start

char_bitmap:
	db	01110000b, 00110001b, 11000110b, 00011000b, 01100011b, 01110100b
	db	01110000b, 10000100b, 00010000b, 01000010b, 00001000b, 00100011b
	db	11111000b, 00010000b, 00010001b, 00010001b, 01100010b, 01110100b
	db	01110000b, 00110001b, 00000110b, 00010011b, 01100010b, 01110100b
	db	00010000b, 11100010b, 01001011b, 10100101b, 10001100b, 00010001b
	db	01110000b, 00110001b, 10000100b, 11101000b, 00100001b, 11111100b
	db	01110000b, 00110001b, 01000110b, 00001111b, 00100001b, 00110010b
	db	00100000b, 10000100b, 00001000b, 00100001b, 01000010b, 11111100b
	db	01110000b, 00110001b, 01000110b, 00010111b, 01100011b, 01110100b
	db	01100000b, 00100010b, 10000100b, 00010111b, 01100011b, 01110100b
	db	10001000b, 00110001b, 11111110b, 00011000b, 10010101b, 00100010b
	db	11110000b, 00110001b, 01000110b, 00011111b, 01100011b, 11110100b
	db	01110000b, 00010001b, 01000010b, 00001000b, 01100001b, 01110100b
	db	11100000b, 00110010b, 11000110b, 00011000b, 10100011b, 11100100b
	db	11111000b, 00010000b, 01000010b, 00001111b, 00100001b, 11111100b
	db	10000000b, 00010000b, 01000010b, 00001111b, 00100001b, 11111100b

print_char:
	push	qr8
	push	xr4
	mov	fp,	er0
	srlc	r14,	#3
	srl	r15,	#3
	add	r15,	#0F8h
	mov	r1,	r0
	add	r1,	#-2
	mov	r4,	psw
	mov	er6,	#6
	mul	er6,	r2
	add	r6,	#byte1 offset char_bitmap
	lea	[er6]
	l	xr8,	[ea+]
	l	er12,	[ea]
	mov	r2,	#0Ah
print_loop:
	l	r6,	[fp]
	sllc	r7,	r0
	mov	r6,	r13
	srl	r6,	#1
	xor	r6,	r3
	srlc	r6,	#2
	srl	r7,	#2
	lea	[fp]
	tb	r4.2
	beq	skip_ea_increment
	l	r5,	[ea+]
skip_ea_increment:
	l	r5,	[ea]
	sll	r5,	r1
	srlc	r5,	r1
	srlc	r6,	r1
	st	r6,	[fp]
	st	r5,	[ea]
	sllc	r13,	#5
	sllc	r12,	#5
	sllc	r11,	#5
	sllc	r10,	#5
	sllc	r9,	#5
	sll	r8,	#5
	add	fp,	#20h
	add	r2,	#-1
	bne	print_loop
	pop	xr4
	pop	qr8
	rt

print_byte:
	push	lr
	push	xr0
	srl	r2,	#4
	bl	print_char
	pop	xr0
	add	r0,	#6
	and	r2,	#0Fh
	bl	print_char
	pop	pc

is_key_pressed:
	st	r1,	KOD0
	mov	r2,	#0
	mov	r3,	#10h
wait_loop:
	add	er2,	#-1
	bne	wait_loop
	l	r1,	KID
	and	r0,	r1
	rt

start:
	mov	r0,	#3
	st	r0,	0F03Dh
	mov	r3,	#20h
init_loop:
	add	er2,	#-1
	bne	init_loop
	mov	r0,	#15h
	st	r0,	0F031h
	mov	r0,	#12h
	st	r0,	0F032h
	lea	0F800h
	mov	r3,	#4
clear_screen_loop:
	st	er4,	[ea+]
	add	er2,	#-1
	bne	clear_screen_loop
	mov	r13,	#0F0h
	bal	post_addr_change
scan_key:
	mov	r2,	#1
key_scan_loop:
	st	r2,	KOD0
	mov	r2,	r2
	beq	repaint
	l	r0,	KID
	xor	r0,	#0FFh
	bne	test_key
	sll	r2,	#1
	bal	key_scan_loop
test_key:
	mov	r1,	r2
	push	er0
	bl	is_key_pressed
	pop	er0
	bne	repaint
	mov	er4,	er0
	mov	r2,	#0
	mov	r3,	#-3
decode_key_loop_1:
	add	r2,	#1
	srl	r1,	#1
	bnc	decode_key_loop_1
decode_key_loop_2:
	add	r3,	#3
	srl	r0,	#1
	bnc	decode_key_loop_2
	cmp	r3,	#6
	bgt	L1
	cmp	r2,	#3
	bgt	repaint
	add	r2,	r3
	bal	num_input
L1:
	cmp	r3,	#12
	bne	L2
	add	r2,	#9
	and	r2,	#0Fh
num_input:
	mov	r10,	r10
	bne	write_addr
	mov	r11,	r11
	bne	write
	mov	r11,	#1
	mov	r8,	r2
	bal	repaint
write:
	sll	r8,	#4
	or	r8,	r2
	st	r8,	[bp]
	bal	post_addr_change
write_addr:
	st	r2,	[fp]
	add	fp,	#1
	mov	r14,	r14
	bne	repaint
	l	er12,	-04h[fp]
	l	er10,	-02h[fp]
	sll	r12,	#4
	or	r13,	r12
	sll	r10,	#4
	or	r11,	r10
	mov	r12,	r11
	bal	post_addr_change
L2:
	cmp	r3,	#18
	bne	repaint
	cmp	r2,	#1
	beq	enter_addr_mode
	cmp	r2,	#3
	beq	left
	cmp	r2,	#5
	bne	repaint
	add	bp,	#1
	bal	post_addr_change
left:
	add	bp,	#-1
post_addr_change:
	mov	fp,	sp
	mov	er10,	#0
	st	er10,	[fp]
	st	er10,	02h[fp]
	bal	repaint
enter_addr_mode:
	mov	r10,	#0FFh
repaint:
	mov	r0,	#0
	mov	r1,	#1
	mov	r2,	r13
	mov	r3,	#0
	bl	print_byte
	mov	r0,	#0Ch
	mov	r1,	#1
	mov	r2,	r12
	bl	print_byte
	mov	r0,	#20h
	mov	r1,	#1
	l	r2,	[bp]
	mov	r3,	r10
	xor	r3,	#0FFh
	bl	print_byte
	mov	r0,	#0
	mov	er6,	sp
addr_print_loop:
	mov	r1,	#20h
	l	r2,	[er6]
	mov	r3,	r10
	bl	print_char
	add	r0,	#6
	add	er6,	#1
	mov	r6,	r6
	bne	addr_print_loop
	mov	er0,	er4
	beq	scan_key
	bl	is_key_pressed
	beq	repaint
	mov	er4,	#0
	bal	scan_key
