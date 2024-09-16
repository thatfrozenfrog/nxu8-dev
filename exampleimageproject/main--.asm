;; Compile Options : /TML620906 /ML /SD /Om /Zc /Orp /Famain.asm /Lv 
;; Version Number  : Ver.3.66.2
;; File Name       : main.c

	type (ML620906) 
	model large, near
	$$FCODmain segment code 2h any
	STACKSEG 0400h
CVERSION 3.66.2
CGLOBAL 01H 03H 0000H "render" 08H 02H 00H 00H 83H 0eH 00H 00H 07H
CGLOBAL 01H 03H 0000H "main" 08H 02H 01H 00H 80H 04H 00H 00H 07H
CTYPEDEF 0000H 0000H 42H "byte" 02H 00H 00H
CTYPEDEF 0000H 0000H 42H "word" 02H 00H 08H
CFILE 0001H 0000000BH "base.h"
CFILE 0000H 00000016H "main.c"

	rseg $$FCODmain
CFUNCTION 0

_render	:
CBLOCK 0 1 4

;;{
CLINEA 0000H 0001H 0004H 0001H 0001H
;;*****************************************
;;	register/stack information
;;*****************************************
	_x$6	set	18
	_height$4	set	16
;;*****************************************

	push	lr
	bl	__regpushu8lw
	mov	er8,	er0
CBLOCK 0 2 4
CRET 000CH
CARGUMENT 46H 0002H 0028H "addr" 02H 00H 01H
CARGUMENT 46H 0002H 0025H "width" 02H 00H 01H
CARGUMENT 42H 0002H 0010H "height" 02H 00H 01H
CARGUMENT 42H 0002H 0012H "x" 02H 00H 01H
CLOCAL 46H 0002H 0027H 0002H "i" 02H 00H 08H
CLOCAL 46H 0002H 0026H 0002H "j" 02H 00H 08H
CLOCAL 46H 0002H 002AH 0002H "s" 02H 00H 08H

;;    word j = x;
CLINEA 0000H 0001H 0006H 0005H 000FH
	l	er0,	_x$6[fp]
	mov	er4,	er0	;; _lj$2

;;    word s = width*height;
CLINEA 0000H 0001H 0007H 0005H 001AH
	mov	er0,	er2
	l	er2,	_height$4[fp]
	bl	__imulu8lw
	mov	bp,	er0	;; _ls$4

;;    for(i = 0; i < s; i++)
CLINEA 0000H 0001H 0008H 0005H 001AH
	mov	er6,	#0 	;; _li$0
	bal	_$L6
_$L3 :
CBLOCK 0 3 9

;;        j++;
CLINEA 0000H 0000H 000AH 0009H 000CH
	add	er4,	#1 
	mov	er0,	er4	;; _lj$2

;;        if((j & 0x001F) == 0x18)
CLINEA 0000H 0001H 000BH 0009H 0020H
	and	r0,	#01fh
	and	r1,	#00h
	cmp	r0,	#018h
	cmpc	r1,	#00h
	bne	_$L7
CBLOCK 0 4 12

;;            j += 8 + x;
CLINEA 0000H 0001H 000DH 000DH 0017H
	l	er0,	_x$6[fp]
	add	er0,	er4
	add	er0,	#8 
	mov	er4,	er0	;; _lj$2
CBLOCKEND 0 4 14

;;        }
CLINEA 0000H 0000H 000EH 0009H 0009H
_$L7 :

;;        *((word *)(0xf820 + j)) = *((word *)(addr + i));
CLINEA 0000H 0001H 000FH 0009H 0038H
	mov	er0,	er8
	add	er0,	er6
	l	er0,	[er0]
	st	er0,	0f820h[er4]
CBLOCKEND 0 3 16

;;    for(i = 0; i < s; i++)
CLINEA 0000H 0000H 0008H 0005H 001AH
	add	er6,	#1 
_$L6 :
	cmp	er6,	bp
	blt	_$L3
CBLOCKEND 0 2 17

;;}
CLINEA 0000H 0001H 0011H 0001H 0001H
	b	__regpopu8lw
CBLOCKEND 0 1 17
CFUNCTIONEND 0

CFUNCTION 1

_main	:
CBLOCK 1 1 20

;;{
CLINEA 0000H 0001H 0014H 0001H 0001H
;;*****************************************
;;	register/stack information
;;*****************************************
;;*****************************************

CBLOCK 1 2 20

;;    render(0x0800, 0x18, 0x3f, 0x10);
CLINEA 0000H 0001H 0015H 0005H 0025H
	mov	er0,	#16
	push	er0
	mov	er0,	#63
	push	er0
	mov	er2,	#24
	mov	r0,	#00h
	mov	r1,	#08h
	bl	_render
	add	sp,	#4 
CBLOCKEND 1 2 22

;;}
CLINEA 0000H 0001H 0016H 0001H 0001H
_$$end_of_main :
	bal	$
CBLOCKEND 1 1 22
CFUNCTIONEND 1

	public _render
	public _main
	extrn code : $$start_up

	cseg #00h at 02h
	dw	$$start_up
	extrn code : __imulu8lw
	extrn code : __regpushu8lw
	extrn code : __regpopu8lw

	end
