;; Compile Options : /TML620906 /ML /SD /Om /Zc /Orp /Famain.asm /Lv 
;; Version Number  : Ver.3.66.2
;; File Name       : main.c

	type (ML620906) 
	model large, near
	$$FCODmain segment code 2h any
	STACKSEG 0400h
CVERSION 3.66.2
CGLOBAL 01H 03H 0000H "render" 08H 02H 00H 00H 81H 0eH 00H 00H 07H
CGLOBAL 01H 03H 0000H "main" 08H 02H 01H 00H 80H 00H 00H 00H 07H
CTYPEDEF 0000H 0000H 42H "byte" 02H 00H 00H
CTYPEDEF 0000H 0000H 42H "word" 02H 00H 08H
CGLOBAL 00H 42H 0002H "width" 02H 00H 08H
CGLOBAL 00H 42H 0002H "height" 02H 00H 08H
CFILE 0001H 0000000BH "base.h"
CFILE 0000H 0000001FH "main.c"

	rseg $$FCODmain
CFUNCTION 0

_render	:
CBLOCK 0 1 11

;;{
CLINEA 0000H 0001H 000BH 0001H 0001H
;;*****************************************
;;	register/stack information
;;*****************************************
;;*****************************************

	push	lr
	bl	__regpushu8lw
	mov	er10,	er2
	mov	er8,	er0
CBLOCK 0 2 11
CRET 000CH
CARGUMENT 46H 0002H 0028H "addr" 02H 00H 01H
CARGUMENT 46H 0002H 0029H "x" 02H 00H 01H
CLOCAL 46H 0002H 0027H 0002H "i" 02H 00H 08H
CLOCAL 46H 0002H 0026H 0002H "j" 02H 00H 08H
CLOCAL 46H 0002H 002AH 0002H "s" 02H 00H 08H

;;    word j = x;
CLINEA 0000H 0001H 000DH 0005H 000FH
	mov	er4,	er2	;; _lj$2

;;    word s = width * height;
CLINEA 0000H 0001H 000EH 0005H 001CH
	l	er0,	NEAR _height
	l	er2,	NEAR _width
	bl	__imulu8lw
	mov	bp,	er0	;; _ls$4

;;    for (i = 0; i < s; i++)
CLINEA 0000H 0001H 000FH 0005H 001BH
	mov	er6,	#0 	;; _li$0
	bal	_$L6
_$L3 :
CBLOCK 0 3 16

;;        j++;
CLINEA 0000H 0000H 0011H 0009H 000CH
	add	er4,	#1 
	mov	er0,	er4	;; _lj$2

;;        if ((j & 0x001F) == 0x18)
CLINEA 0000H 0001H 0012H 0009H 0021H
	and	r0,	#01fh
	and	r1,	#00h
	cmp	r0,	#018h
	cmpc	r1,	#00h
	bne	_$L7
CBLOCK 0 4 19

;;            j += 8 + x;
CLINEA 0000H 0001H 0014H 000DH 0017H
	mov	er0,	er10
	add	er0,	er4
	add	er0,	#8 
	mov	er4,	er0	;; _lj$2
CBLOCKEND 0 4 21

;;        }
CLINEA 0000H 0000H 0015H 0009H 0009H
_$L7 :

;;        *((word *)(0xf820 + j)) = *((word *)(addr + i));
CLINEA 0000H 0001H 0016H 0009H 0038H
	mov	er0,	er8
	add	er0,	er6
	l	er0,	[er0]
	st	er0,	0f820h[er4]
CBLOCKEND 0 3 23

;;    for (i = 0; i < s; i++)
CLINEA 0000H 0000H 000FH 0005H 001BH
	add	er6,	#1 
_$L6 :
	cmp	er6,	bp
	blt	_$L3
CBLOCKEND 0 2 24

;;}
CLINEA 0000H 0001H 0018H 0001H 0001H
	b	__regpopu8lw
CBLOCKEND 0 1 24
CFUNCTIONEND 0

CFUNCTION 1

_main	:
CBLOCK 1 1 27

;;{
CLINEA 0000H 0001H 001BH 0001H 0001H
;;*****************************************
;;	register/stack information
;;*****************************************
;;*****************************************

CBLOCK 1 2 27

;;    width = 0x18;
CLINEA 0000H 0001H 001CH 0005H 0011H
	mov	er0,	#24
	st	er0,	NEAR _width

;;    height = 0x3f;
CLINEA 0000H 0001H 001DH 0005H 0012H
	mov	er0,	#63
	st	er0,	NEAR _height

;;    render(0x0E40, 10);
CLINEA 0000H 0001H 001EH 0005H 0017H
	mov	er2,	#10
	mov	r0,	#040h
	mov	r1,	#0eh
	bl	_render
CBLOCKEND 1 2 31

;;}
CLINEA 0000H 0001H 001FH 0001H 0001H
_$$end_of_main :
	bal	$
CBLOCKEND 1 1 31
CFUNCTIONEND 1

	public _render
	public _main
	_width comm data 02h #00h
	_height comm data 02h #00h
	extrn code : $$start_up

	cseg #00h at 02h
	dw	$$start_up
	extrn code : __imulu8lw
	extrn code : __regpushu8lw
	extrn code : __regpopu8lw

	end
