type(ML620906)
model	large
romwindow 0, 0cfffh

_clear_DDD4			EQU 0:8C60H
_line_print			EQU 0:8F7EH
_render_DDD4		EQU 0:947CH
_render_stat_bar 	EQU 0:94FEH
_delay				EQU 0:9F3AH
_shutdown			EQU 0:9EE8H
_enter				EQU 0:0AC30H
_leave				EQU 0:0AC38H
_hex_byte			EQU 2:4010H
_convert_keycode	EQU 2:9892H
_display_menu		EQU 2:0AD4CH
_display_settings	EQU 2:0D5B8H
_get_keycode		EQU 2:0F5E8H

press_ac_str		EQU 1B18H
keytable			EQU 83DAH
startup_str_1		EQU 30F00H
startup_str_1_len	EQU 13H
;cseg	#0	at	0000h
cseg	#3	at	1000h

public  $$start_up
_$$SP	EQU	0F000h

dw	_$$SP
dw	$$start_up
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
	b _main
	mov	psw,	#3
	brk

_INT:
	rti

$$start_up:
	bl	_reset_lr
	mov	r0,	#0
	st	r0,	DSR
	bl	_init_SFR
	mov	r0,	#0C8h
	mov	r1,	#5
	bl	_timer
	bl	_reset_SFR
	b	_entry

_reset_lr:
	rt

_init_SFR:
	push	lr
	mov	r0,	#31h
	st	r0,	FCON
	mov	r0,	#17h
	st	r0,	BLKCON0

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
	rt

_init_screen:
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

_entry:
	b _main
	
_render:
	push	xr4
	mov	er2,	er0 ;er2: Base
	mov	er4,	#0 ;er4: screen counter
	mov	er6,	#0 ;er6: base counter
	

_$L3:
	add	er4,	#1 ;add screen counter
	mov	er0,	er4
	
	and	r0,	#01fh	;Compare if end of screen, then skip
	and	r1,	#00h
	cmp	r0,	#018h
	cmpc	r1,	#00h
	bne	_$L7	;If not end, skip next code
	add	er4,	#8 ;Adding screen counter

_$L7:
	mov	er0,	er2
	add	er0,	er6 ;Adding base with offset
	l	er0,	r8:[er0] ;Read, can add seg here
	st	er0,	0f820h[er4] ;Store er0 at F820 with offset counter
	
	add	er6,	#1 ;Adding base counter
	cmp	r6,	#0e8h	
	cmpc	r7,	#05h ;Check end of screen
	blt	_$L3 ;If not, loop back
	pop	xr4
	rt ;END OF RENDER
	
_main:	
	mov	r0,	#040h
	mov	r1,	#0eh
	mov r8, #03h
	bl	_render
	b _main

	