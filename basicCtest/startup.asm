type(ML620906)
model large
romwindow 0, 0cfffH

rel_code segment code

extrn   code: _main
;extrn 	code: _TM0
public  $$start_up
_$$SP	EQU	0F000h

cseg at 0:0h

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
dw 	_INT
dw	_TM0INT

rseg rel_code

_BRK:
	b _main
	mov	psw,	#3
	brk

_INT:
	rti

_TM0INT:
	push	elr,epsw,ea
	ei
	push	qr0
	push	qr8
	mov r1, #0D8h
	st r1, 0D810h
;	bl _TM0
	pop	qr8
	pop	qr0
	pop	pc,psw,ea



$$start_up:
	bl	_reset_lr
	mov	r0,	#0
	st	r0,	DSR
	bl	_init_SFR
	mov	r0,	#0C8h
	mov	r1,	#5
	bl	_timer
	bl	_reset_SFR

	bl _near_ram_clear


	b	_entry

;----------------------------;
; Near Data memory zero clear;
;----------------------------;
NEAR_RAM_START data 0D000h
NEAR_RAM_END   data 0EFFFh
_near_ram_clear:

	mov er0, #0
	mov er2, #0
	mov er4, #0
	mov er6, #0

	mov r8, #BYTE1 NEAR_RAM_START
	mov r9, #BYTE2 NEAR_RAM_START
	lea [er8]

_near_ram_loop:
	st qr0, [ea+]
	add er8, #8
	cmp r9, #BYTE2 (NEAR_RAM_END+1)
	cmpc r8, #BYTE1 (NEAR_RAM_END+1)
	bne _near_ram_loop

	rt


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


cseg	#3	at	0000h
_entry:
	b _main


cseg	#2	at	01314h
_filler:
	l er2, 0D110h
	st er0, 0D100h
	rt
