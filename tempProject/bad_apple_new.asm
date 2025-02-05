;bad apple for ML620Q906
;84 * 63 resolution, 7.5 fps

type(ML620906)
model large

_$$SP	EQU	0F000h

dw	_$$SP
dw	_START
dw	_BRK
dw	_INT
dw	_INT
dw	_INT
dw	_INT
dw	_INT
dw	_INT
dw	_INT
dw	_INT
dw	_INT
dw	_INT
dw	_INT
dw	_INT
dw	_INT
dw	_INT
dw	_INT
dw	_INT
dw	_INT
dw	_INT
dw	_INT

_BRK:
	mov	psw,	#3
	brk

_INT:
	rti

;simplified boot routine
_START:
	bl	_reset_lr
	mov	r0,	#0
	st	r0,	DSR
	bl	_init_SFR
	mov	r0,	#0C8h
	mov	r1,	#5
	bl	_timer
	bl	_reset_SFR
	b	_start_playing

_reset_lr:
	rt

_init_SFR:
	push	lr
	mov	r0,	#31h
	st	r0,	FCON
	mov	r0,	#17h
	st	r0,	BLKCON0

;this is used in the startup code of casio calcs
;not sure what this is for
	mov	r0,	#32h
_$init_clock:
	add	r0,	#-1h
	bne	_$init_clock
	lea	IE0
	mov	er0,	#20h
	st	er0,	[ea+]
	st	r1,	[ea]
	mov	r0,	#7h
	st	r0,	0F03Dh
	mov	r0,	#50h
	mov	r1,	#0
	bl	_timer
	bl	_init_screen
	bl	_init_port1
	bl	_init_port0
	bl	_init_p00
	mov	er0,	#0
	st	r0,	KIMASK
	st	er0,	KOD
	pop	pc

_timer:
	sb	XTM0
	rb	XTM1
	rb	DTM0
	di
	mov	er2,	#1
	st	er2,	TM0CON
	mov	er2,	#0
	st	er2,	TM0C
	st	er2,	IRQ0
	st	r2,	IRQ2
	sb	ETM0
	st	er0,	TM0D
	mov	r0,	#1
	st	r0,	TM0CON1
_stop:
	mov	r0,	#50h
	mov	r1,	#0A0h
	st	r0,	STPACP
	st	r1,	STPACP
	mov	r0,	#2
	st	r0,	SBYCON
	nop
	nop
;we wont need TM0INT when playing the video
	rt

_init_screen:
;copying casio's code
	mov	r0,	#4
	st	r0,	0F030h
	mov	r0,	#7
	st	r0,	0F033h
	mov	r0,	#9
	st	r0,	0F034h
	mov	r0,	#17h
	st	r0,	0F035h
	mov	er0,	#1
	st	r0,	0F036h
	st	r1,	0F039h
	mov	r0,	#17h
	st	r0,	0F031h
	mov	r0,	#12h
	st	r0,	0F032h
	rt

_init_port1:
	lea	P1D
	mov	r0,	#0
	mov	r1,	#7Fh
	st	er0,	[ea+]
	st	er0,	[ea+]
	st	r0,	[ea]
	rt

_init_port0:
	lea	P0D
	mov	er0,	#0
	mov	er2,	#7
	st	er0,	[ea+]
	st	er2,	[ea+]
	st	r2,	[ea]
	rt

_init_p00:
	mov	r0,	#0
	st	r0,	KICON
	mov	r0,	#80h
	mov	r1,	#0FFh
	st	er0,	KOMASK
	rt

_reset_SFR:
	mov	r0,	#1
	st	r0,	FCON
	mov	r0,	#4
	st	r0,	0F030h
	mov	r0,	#3
	st	r0,	0F033h
	mov	r0,	#9
	st	r0,	0F034h
	mov	r0,	#17h
	st	r0,	0F035h
	mov	er0,	#1
	st	r0,	0F036h
	st	r1,	0F039h
	mov	r0,	#15h
	st	r0,	0F031h
	rt


;---------------------
;Start of Video Player
;---------------------

_render:
	;use D000 as buffer
	push	xr4
	push	qr8
	push	ea
	mov	r0,	#0
	mov	r1,	#0D0h
	push	er0
	mov	r2,	#0
	mov	r3,	#0F8h
	mov	r0,	#40h
_$render_loop:
	pop	ea
	l	xr4,	[ea+]
	l	qr8,	[ea+]
	push	ea
	lea	[er2]
	st	xr4,	[ea+]
	st	qr8,	[ea+]
	add	er2,	#0Ch
	pop	ea
	l	xr4,	[ea+]
	l	qr8,	[ea+]
	push	ea
	lea	[er2]
	st	xr4,	[ea+]
	st	qr8,	[ea+]
	add	er2,	#14h
	add	r0,	#-1
	bne	_$render_loop
	pop	er0
	pop	ea
	pop	qr8
	pop	xr4
	rt

_clear_buffer:
	push	qr8
	mov	er8,	#0
	bal	_$fill_buffer_entry

_fill_buffer:
	push	qr8
	mov	r8,	#0FFh
	mov	r9,	r8
_$fill_buffer_entry:
	mov	er10,	er8
	mov	er12,	er8
	mov	er14,	er8
	lea	0D000h
	mov	r0,	#0C0h
_$fill_buffer_loop:
	st	qr8,	[ea+]
	add	r0,	#-1
	bne	_$fill_buffer_loop
	pop	qr8
	rt

_erase_pixel:
	mov	r2,	#01h
	bal	_$draw_pixel
_paint_pixel:
	mov	r2,	#00h
_$draw_pixel:
	push	xr4
	mov	r6,	r2
	mov	r3,	#80h
	srl	r3,	r0
	mov	r4,	r1
	mov	r1,	#00h
	srl	r0,	#3
	mov	r2,	#18h
	mul	er4,	r2
	add	er4,	er0
	mov	r0,	#0
	mov	r1,	#0D0h
	add	er4,	er0
	l	r0,	[er4]
	cmp	r6,	#00h
	bne	_$erase_pixel
	or	r0,	r3
	bal	_$store_to_pixel
_$erase_pixel:
	xor	r3,	#0FFh
	and	r0,	r3
_$store_to_pixel:
	st	r0,	[er4]
	pop	xr4
_$draw_pixel_leave:
	rt

_shutdown:
	bl	_clear_buffer
	mov	er0,	#3
	st	r0,	0F031h
	st	r1,	0F03Dh
	st	r1,	0F00Ah
	lea	IE0
	mov	er2,	#0
	st	er2,	[ea+]
	st	r2,	[ea]
	bl	_stop
	brk

_start_playing:
	mov	r0,	#1
	st	r0,	SEGCON
	bl	_fill_buffer
	lea	_delay_array
;compressed video data begins at 1:0000
	mov	er4,	#0
	mov	r6,	#1
_$frame_loop:
	l	er0,	5:[ea+]
	bl	_timer
	bl	_paint_frame
	mov	r0,	r0
	bne	_$frame_loop
	bl	_shutdown
	brk

;r6-seg er4-addr er8-pos r7-counter r12-color r13-color_invert_flag r10-last_count r11-remain_bits er14-pointer_to_last_frame
_paint_frame:
	push	lr
	mov	r14,	#0
	mov	r15,	#0D6h
;initial position
	mov	r8,	#36h
	mov	r9,	#1
;handle first byte
	mov	r10,	#0
	mov	r11,	#1
	l	r7,	r6:[er4]
	beq	_$end
	mov	r12,	r7
	and	r7,	#7Fh
	srl	r12,	#7		;get first pixel color
	mov	r13,	#0
	bal	_$L4
_$loop1:
	and	r11,	#7
	beq	_$L5
	bl	_inc_addr
	l	r3,	r6:[er4]
	mov	r7,	r3
	srl	r7,	r11
	or	r7,	r10
	add	r11,	#1
	mov	r2,	#0
	srlc	r2,	r11
	mov	r10,	r2
	rb	r10.7
	bal	_$L4
_$L5:
	l	r7,	r6:[er4]
	and	r7,	#7Fh
	mov	r11,	#1
_$L4:
	xor	r12,	r13
	cmp	r7,	#07Fh
	beq	_$L3
	mov	r13,	#1
	bal	_$loop2
_$L3:
	mov	r13,	#0
_$loop2:
;tell if the pixel needs repaint
	l	r2,	[fp]
	cmp	r2,	r12
	beq	_$L1
	st	r12,	[fp]
	mov	er0,	er8
	mov	r12,	r12
	beq	_$erase
	bl	_paint_pixel
	bal	_$L1
_$erase:
	bl	_erase_pixel
_$L1:
	add	fp,	#1
	add	r8,	#1
	cmp	r8,	#8Ah
	blt	_$L2
	mov	r8,	#36h
	add	r9,	#1
	cmp	r9,	#3Fh
	bgt	_$render
_$L2:
	add	r7,	#-1
	bne	_$loop2
	bal	_$loop1
_$render:
	bl	_render
	mov	r0,	#1
	bal	_$ret
_$end:
	mov	r0,	#0
_$ret:
	bl	_inc_addr
	pop	pc

_inc_addr:
	add	er4,	#1
	addc	r6,	#0
	cmp	r6,	#4
	bne	_$inc_ret
;start addr of video data in seg0(seg5)
	mov	r6,	#5
	mov	r4,	#(offset _data)&0FFh
	mov	r5,	#(offset _data)>>8
_$inc_ret:
	rt

_data:
	ds	0E848h

_delay_array:
	ds	0CE4h
