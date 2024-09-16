;; Compile Options : /TML620906 /ML /SD /Om /Zc /Orp /Famain.asm /Lv 
;; Version Number  : Ver.3.66.2
;; File Name       : main.c

	type (ML620906) 
	model large, near
	$$FCODmain segment code 2h any
	STACKSEG 0400h
CVERSION 3.66.2
CGLOBAL 01H 03H 0000H "cpy" 08H 02H 00H 00H 83H 08H 00H 00H 07H
CGLOBAL 01H 03H 0000H "main" 08H 02H 01H 00H 80H 02H 00H 00H 01H
CTYPEDEF 0000H 0000H 42H "byte" 02H 00H 00H
CTYPEDEF 0000H 0000H 42H "word" 02H 00H 08H
CTYPEDEF 0000H 0000H 42H "uint24_t" 02H 00H 02H
CTYPEDEF 0000H 0000H 42H "uint16_t" 02H 00H 08H
CFILE 0001H 0000000BH "base.h"
CFILE 0000H 0000002FH "main.c"

location	EQU	0D0F5H
location2	EQU	0D0F7H
location3	EQU	0F816H
	rseg $$FCODmain
CFUNCTION 0

__regpushu8lw :
	PUSH QR8
	PUSH XR4
	MOV ER14, SP
	RT

__regpopu8lw :
	MOV SP, ER14
	POP XR4
	POP QR8
	POP PC



renderddd4 :
	PUSH LR
	PUSH XR4
	PUSH QR8
	MOV R0, #0D4H
	MOV R1, #0DDH
l_00A :
	PUSH ER0
	MOV R2, #00H
	MOV R3, #0F8H
	MOV R0, #40H
l_012 :
	POP EA
	L XR4, [EA+]
	L QR8, [EA+]
	PUSH EA
	LEA [ER2]
	ST XR4, [EA+]
	ST QR8, [EA+]
	ADD ER2, #0CH
	POP EA
 	L XR4, [EA+]
	L QR8, [EA+]
	PUSH EA
	LEA [ER2]
	ST XR4, [EA+]
	ST QR8, [EA+]
	ADD ER2, #14H
	ADD R0, #-1H
	BNE l_012
	POP ER0
	BL f_0B060
	POP QR8
	POP XR4
	POP PC

f_0B060 :
	L R0, location
	BNE l_012
	TB location2.0
	BEQ l_012
	MOV R0, #01H
	ST R0, location3

_cpy	:
CBLOCK 0 1 35

;;{
CLINEA 0000H 0001H 0023H 0001H 0001H
;;*****************************************
;;	register/stack information
;;*****************************************
	_length$4	set	16
;;*****************************************

	push	lr
	bl	__regpushu8lw
	mov	er8,	er0
	mov	er10,	er2
CBLOCK 0 2 35
CRET 000CH
CARGUMENT 46H 0002H 0028H "org" 02H 00H 01H
CARGUMENT 46H 0002H 0029H "dst" 02H 00H 01H
CARGUMENT 42H 0002H 0010H "length" 02H 00H 01H
CLOCAL 46H 0002H 0026H 0002H "i" 02H 00H 08H

;;    for (i = 0; i < length; i++)
CLINEA 0000H 0001H 0025H 0005H 0020H
	mov	er4,	#0 	;; _li$0
	bal	_$L6
_$L3 :
CBLOCK 0 3 38

;;        *((word *)((char *)dst + i)) = *((word *)((char *)org + i));
CLINEA 0000H 0001H 0027H 0009H 0044H
	mov	er0,	er8
	add	er0,	er4
	mov	er2,	er0
	mov	er0,	er10
	add	er0,	er4
	l	er2,	3:[er2]
	st	er2,	[er0]
CBLOCKEND 0 3 40

;;    for (i = 0; i < length; i++)
CLINEA 0000H 0000H 0025H 0005H 0020H
	add	er4,	#1 
_$L6 :
	l	er2,	_length$4[fp]
	cmp	er4,	er2
	blt	_$L3
CBLOCKEND 0 2 41

;;}
CLINEA 0000H 0001H 0029H 0001H 0001H
	b	__regpopu8lw
CBLOCKEND 0 1 41
CFUNCTIONEND 0

CFUNCTION 1

_main	:
CBLOCK 1 1 44

;;{
CLINEA 0000H 0001H 002CH 0001H 0001H
;;*****************************************
;;	register/stack information
;;*****************************************
;;*****************************************

CBLOCK 1 2 44

;;    cpy(0x0E40, 0xE700, 0x05e8);
CLINEA 0000H 0001H 002DH 0005H 0020H
	mov	r0,	#0e8h
	mov	r1,	#05h
	push	er0
	mov	r2,	#0d4h
	mov	r3,	#0ddh
	mov	r0,	#040h
	mov	r1,	#0eh
	bl	_cpy
	add	sp,	#2 

;;    return 0;
CLINEA 0000H 0001H 002EH 0005H 000DH
CBLOCKEND 1 2 47

;;}
CLINEA 0000H 0000H 002FH 0001H 0001H
	bl renderddd4
	b _main
_$$end_of_main :
	bal	$
CBLOCKEND 1 1 47
CFUNCTIONEND 1

	public _cpy
	public _main
	extrn code : $$start_up

	cseg #00h at 02h
	dw	$$start_up

	end

