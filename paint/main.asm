;; Compile Options : /TML620906 /ML /SD /Om /Zc /Orp /Famain.asm /Lv 
;; Version Number  : Ver.3.66.2
;; File Name       : main.c

	type (ML620906) 
	model large, near
	$$NINITVAR segment data 2h #0h
	$$NINITTAB segment table 2h any
	$$NTABmain segment table 2h #0h
	$$FCODmain segment code 2h any
	STACKSEG 0400h
CVERSION 3.66.2
CGLOBAL 01H 02H 0000H "CheckButtons" 08H 02H 02H 00H 80H 00H 00H 00H 00H
CGLOBAL 01H 03H 0000H "main" 08H 02H 03H 00H 80H 00H 00H 00H 07H
CGLOBAL 01H 03H 0000H "drawbitmap" 08H 02H 00H 00H 83H 0eH 00H 00H 07H
CGLOBAL 01H 03H 0000H "print" 08H 02H 01H 00H 81H 12H 00H 00H 07H
CENUMTAG 0000H 0000H 0000H 0014H "BUTTON"
CENUMMEM 0000000BH "B_0"
CENUMMEM 0000003FH "B_1"
CENUMMEM 00000037H "B_2"
CENUMMEM 0000002FH "B_3"
CENUMMEM 0000003EH "B_4"
CENUMMEM 00000036H "B_5"
CENUMMEM 0000002EH "B_6"
CENUMMEM 0000003DH "B_7"
CENUMMEM 00000035H "B_8"
CENUMMEM 0000002DH "B_9"
CENUMMEM 00000028H "SP_UP"
CENUMMEM 00000021H "SP_DOWN"
CENUMMEM 00000029H "SP_LEFT"
CENUMMEM 00000020H "SP_RIGHT"
CENUMMEM 00000027H "SP_PLUS"
CENUMMEM 0000001FH "SP_MINUS"
CENUMMEM 00000026H "SP_MUL"
CENUMMEM 0000001EH "SP_DIV"
CENUMMEM 00000039H "SP_OPTN"
CENUMMEM 00000031H "SP_CALC"
CTYPEDEF 0000H 0000H 42H "byte" 02H 00H 00H
CTYPEDEF 0000H 0000H 42H "word" 02H 00H 08H
CGLOBAL 01H 00H 1000H "image_raw" 05H 01H 00H 10H 00H 00H
CGLOBAL 01H 42H 0001H "lastbutton" 02H 00H 00H
CFILE 0001H 0000000BH "base.h"
CFILE 0002H 00000402H "thefont.h"
CFILE 0000H 0000007BH "main.c"

	rseg $$FCODmain
CFUNCTION 0

_drawbitmap	:
CBLOCK 0 1 30

;;{
CLINEA 0000H 0001H 001EH 0001H 0001H
;;*****************************************
;;	register/stack information
;;*****************************************
	_y$2	set	-2
	_width$4	set	16
	_height$6	set	18
;;*****************************************

	push	lr
	add	sp,	#-02
	mov	er10,	er2
	mov	er8,	er0
CBLOCK 0 2 30
CRET 000EH
CARGUMENT 44H 0002H 0028H "ptr" 04H 03H 00H 00H 00H
CARGUMENT 46H 0002H 0029H "offset" 02H 00H 01H
CARGUMENT 42H 0001H 0010H "width" 02H 00H 00H
CARGUMENT 42H 0001H 0012H "height" 02H 00H 00H
CLOCAL 46H 0002H 002AH 0002H "x" 02H 00H 08H
CLOCAL 42H 0002H 0002H 0002H "y" 02H 00H 08H
CLOCAL 46H 0002H 0027H 0002H "i" 02H 00H 08H
CLOCAL 46H 0002H 0026H 0002H "j" 02H 00H 08H

;;	word i = 0;
CLINEA 0000H 0001H 0021H 0002H 000CH
	mov	er0,	#0 
	mov	er6,	#0 	;; _li$4

;;	word j = 0;
CLINEA 0000H 0001H 0022H 0002H 000CH
	mov	er4,	#0 	;; _lj$6

;;	for(y = 0; y < offset; y++)
CLINEA 0000H 0001H 0023H 0002H 001CH
	bal	_$L6
_$L3 :
CBLOCK 0 3 36

;;		++j;
CLINEA 0000H 0001H 0025H 0003H 0006H
	add	er4,	#1 
	mov	er0,	er4	;; _lj$6

;;		if((j&0x1f) == 0x18)
CLINEA 0000H 0001H 0026H 0003H 0016H
	and	r0,	#01fh
	and	r1,	#00h
	cmp	r0,	#018h
	cmpc	r1,	#00h
	bne	_$L7
CBLOCK 0 4 39

;;			j += 0x8;
CLINEA 0000H 0001H 0028H 0004H 000CH
	add	er4,	#8 
CBLOCKEND 0 4 41

;;		}
CLINEA 0000H 0000H 0029H 0003H 0003H
_$L7 :
CBLOCKEND 0 3 42

;;	for(y = 0; y < offset; y++)
CLINEA 0000H 0000H 0023H 0002H 001CH
	l	er0,	_y$2[fp]
	add	er0,	#1 
_$L6 :
	st	er0,	_y$2[fp]

;;	for(y = 0; y < offset; y++)
CLINEA 0000H 0000H 0023H 000DH 0017H
	cmp	er0,	er10
	blt	_$L3

;;	for(y = 0; y < height; y++)
CLINEA 0000H 0001H 002CH 0006H 000BH
	mov	er0,	#0 

;;	for(y = 0; y < height; y++)
CLINEA 0000H 0000H 002CH 000DH 0017H
	bal	_$L14

;;	for(y = 0; y < height; y++)
CLINEA 0000H 0000H 002CH 0019H 001BH
_$L11 :
CBLOCK 0 5 45

;;		for(x = 0; x < width; x++)
CLINEA 0000H 0001H 002EH 0007H 000CH
	mov	bp,	#0 	;; _lx$0

;;		for(x = 0; x < width; x++)
CLINEA 0000H 0000H 002EH 000EH 0017H
	bal	_$L20

;;		for(x = 0; x < width; x++)
CLINEA 0000H 0000H 002EH 0019H 001BH
_$L17 :
CBLOCK 0 6 47

;;			deref(0xf800+j) = ptr[i];
CLINEA 0000H 0001H 0030H 0004H 001CH
	mov	er0,	er8
	add	er0,	er6
	l	r0,	[er0]
	st	r0,	0f800h[er4]

;;			++j;
CLINEA 0000H 0001H 0031H 0004H 0007H
	add	er4,	#1 
	mov	er0,	er4	;; _lj$6

;;			if((j&0x1f) == 0x18)
CLINEA 0000H 0001H 0032H 0004H 0017H
	and	r0,	#01fh
	and	r1,	#00h
	cmp	r0,	#018h
	cmpc	r1,	#00h
	bne	_$L21
CBLOCK 0 7 51

;;				j += 0x8;
CLINEA 0000H 0001H 0034H 0005H 000DH
	add	er4,	#8 
CBLOCKEND 0 7 53

;;			}
CLINEA 0000H 0000H 0035H 0004H 0004H
_$L21 :

;;			++i;
CLINEA 0000H 0001H 0036H 0004H 0007H
	add	er6,	#1 
CBLOCKEND 0 6 55

;;		for(x = 0; x < width; x++)
CLINEA 0000H 0000H 002EH 0019H 001BH
	add	bp,	#1 

;;		for(x = 0; x < width; x++)
CLINEA 0000H 0000H 002EH 000EH 0017H
_$L20 :
	l	r0,	_width$4[fp]
	mov	r1,	#00h
	cmp	bp,	er0
	blt	_$L17

;;		j += 32-width;
CLINEA 0000H 0001H 0038H 0003H 0010H
	mov	r2,	r0
	mov	r3,	#00h
	mov	er0,	#32
	sub	r0,	r2
	subc	r1,	r3
	add	er4,	er0

;;		if((j&0x1f) == 0x18)
CLINEA 0000H 0001H 0039H 0003H 0016H
	mov	er0,	er4
	and	r0,	#01fh
	and	r1,	#00h
	cmp	r0,	#018h
	cmpc	r1,	#00h
	bne	_$L23
CBLOCK 0 8 58

;;			j += 0x8;
CLINEA 0000H 0001H 003BH 0004H 000CH
	add	er4,	#8 
CBLOCKEND 0 8 60

;;		}
CLINEA 0000H 0000H 003CH 0003H 0003H
_$L23 :
CBLOCKEND 0 5 61

;;	for(y = 0; y < height; y++)
CLINEA 0000H 0000H 002CH 0019H 001BH
	l	er0,	_y$2[fp]
	add	er0,	#1 

;;	for(y = 0; y < height; y++)
CLINEA 0000H 0000H 002CH 000DH 0017H
_$L14 :
	st	er0,	_y$2[fp]

;;	for(y = 0; y < height; y++)
CLINEA 0000H 0000H 002CH 000EH 0017H
	l	r0,	_height$6[fp]
	mov	r1,	#00h
	l	er2,	_y$2[fp]
	cmp	er2,	er0
	blt	_$L11
CBLOCKEND 0 2 62

;;}
CLINEA 0000H 0001H 003EH 0001H 0001H
CBLOCKEND 0 1 62
CFUNCTIONEND 0

CFUNCTION 1

_print	:
CBLOCK 1 1 64

;;{
CLINEA 0000H 0001H 0040H 0001H 0001H
;;*****************************************
;;	register/stack information
;;*****************************************
	_i$4	set	-2
;;*****************************************

	push	lr
	mov	r11,	r3
CBLOCK 1 2 64
CRET 000CH
CARGUMENT 44H 0002H 0024H "str" 04H 03H 00H 00H 00H
CARGUMENT 46H 0001H 0016H "x" 02H 00H 00H
CARGUMENT 46H 0001H 001FH "y" 02H 00H 00H
CLOCAL 44H 0002H 002AH 0002H "what" 04H 03H 00H 00H 00H
CLOCAL 46H 0002H 0027H 0002H "curoffset" 02H 00H 08H
CLOCAL 42H 0002H 0002H 0002H "i" 02H 00H 08H

;;	const byte* what = str;
CLINEA 0000H 0001H 0041H 0002H 0018H
	mov	bp,	er0	;; _lwhat$0

;;	word curoffset = (word)x+((word)y<<8)+((word)y<<7);
CLINEA 0000H 0001H 0042H 0002H 0034H
	mov	r1,	r3
	mov	r0,	#00h
	mov	r4,	r2
	mov	r5,	#00h
	mov	er2,	er0
	add	er2,	er4
	mov	r0,	r11
	mov	r1,	#00h
	sllc	r1,	#07h
	sll	r0,	#07h
	add	er0,	er2
	mov	er6,	er0	;; _lcuroffset$2

;;	word i = 0;
CLINEA 0000H 0001H 0043H 0002H 000CH
	mov	er0,	#0 

;;	while(*what)
CLINEA 0000H 0001H 0044H 0002H 000DH
	bal	_$L26
_$L28 :
CBLOCK 1 3 69

;;		drawbitmap(image_raw+((word)(*what)<<4),curoffset,1,16);
CLINEA 0000H 0001H 0047H 0003H 003AH
	mov	r0,	#010h
	push	r0
	mov	r0,	#01h
	push	r0
	mov	er2,	er6
	l	r0,	[bp]
	mov	r1,	#00h
	sllc	r1,	#04h
	sll	r0,	#04h
	mov	r4,	#BYTE1 OFFSET _image_raw
	mov	r5,	#BYTE2 OFFSET _image_raw
	add	er4,	er0
	mov	er0,	er4
	bl	_drawbitmap
	add	sp,	#4 

;;		++curoffset;
CLINEA 0000H 0001H 0048H 0003H 000EH
	add	er6,	#1 

;;		++what;
CLINEA 0000H 0001H 0049H 0003H 0009H
	add	bp,	#1 

;;		++i;
CLINEA 0000H 0001H 004AH 0003H 0006H
	mov	er0,	er8
	add	er0,	#1 
CBLOCKEND 1 3 76

;;	}
CLINEA 0000H 0000H 004CH 0002H 0002H
_$L26 :
	mov	er8,	er0

;;	while(*what)
CLINEA 0000H 0000H 0044H 000EH 0017H
	l	r0,	[bp]
	bne	_$L28
CBLOCKEND 1 2 77

;;}
CLINEA 0000H 0001H 004DH 0001H 0001H
CBLOCKEND 1 1 77
CFUNCTIONEND 1

CFUNCTION 2

_CheckButtons	:
CBLOCK 2 1 82

;;{
CLINEA 0000H 0001H 0052H 0001H 0001H
;;*****************************************
;;	register/stack information
;;*****************************************
;;*****************************************

CBLOCK 2 2 82
CLOCAL 46H 0001H 0017H 0002H "x" 02H 00H 00H
CLOCAL 46H 0001H 0015H 0002H "y" 02H 00H 00H
CLOCAL 46H 0001H 0016H 0002H "i" 02H 00H 00H

;;	byte i = 0;
CLINEA 0000H 0001H 0055H 0002H 000CH
	mov	r2,	#00h	;; _li$4

;;	for(x = 0x80; x != 0; x = x >> 1)
CLINEA 0000H 0001H 0056H 0002H 0022H
	mov	r3,	#080h	;; _lx$0
_$L33 :
CBLOCK 2 3 87

;;		deref(0xf046) = x;
CLINEA 0000H 0001H 0058H 0003H 0014H
	st	r3,	0f046h

;;		for(y = 0x80; y != 0; y = y >> 1)
CLINEA 0000H 0001H 0059H 0003H 0023H
	mov	r1,	#080h	;; _ly$2
_$L39 :
CBLOCK 2 4 90

;;			if((deref(0xf040) & y) == 0)
CLINEA 0000H 0001H 005BH 0004H 001FH
	l	r0,	0f040h
	and	r0,	r1
	bne	_$L43
CBLOCK 2 5 92

;;				if(i != lastbutton)
CLINEA 0000H 0001H 005DH 0005H 0017H
	l	r0,	NEAR _lastbutton
	cmp	r0,	r2
	beq	_$L45
CBLOCK 2 6 94

;;					lastbutton = i;
CLINEA 0000H 0001H 005FH 0006H 0014H
	mov	r0,	r2
	st	r2,	NEAR _lastbutton

;;					return i;
CLINEA 0000H 0001H 0060H 0006H 000EH
CBLOCKEND 2 6 97
CBLOCKEND 2 2 105

;;}
CLINEA 0000H 0001H 0069H 0001H 0001H
	rt

;;				}
CLINEA 0000H 0000H 0061H 0005H 0005H
_$L45 :

;;				return 0xff;
CLINEA 0000H 0001H 0062H 0005H 0010H
	mov	r0,	#0ffh
	rt
CBLOCKEND 2 5 99

;;			}
CLINEA 0000H 0000H 0063H 0004H 0004H
_$L43 :

;;			++i;
CLINEA 0000H 0001H 0064H 0004H 0007H
	add	r2,	#01h
CBLOCKEND 2 4 101

;;		for(y = 0x80; y != 0; y = y >> 1)
CLINEA 0000H 0000H 0059H 0003H 0023H
	srl	r1,	#01h
	mov	r0,	r1	;; _ly$2

;;		for(y = 0x80; y != 0; y = y >> 1)
CLINEA 0000H 0000H 0059H 000EH 0017H
	bne	_$L39
CBLOCKEND 2 3 102

;;	for(x = 0x80; x != 0; x = x >> 1)
CLINEA 0000H 0000H 0056H 0002H 0022H
	srl	r3,	#01h
	mov	r0,	r3	;; _lx$0

;;	for(x = 0x80; x != 0; x = x >> 1)
CLINEA 0000H 0000H 0056H 000EH 0017H
	bne	_$L33

;;	lastbutton = 0x50;
CLINEA 0000H 0001H 0067H 0002H 0013H
	mov	r0,	#050h
	st	r0,	NEAR _lastbutton

;;	return 0xff;
CLINEA 0000H 0001H 0068H 0002H 000DH
	mov	r0,	#0ffh
	rt
CBLOCKEND 2 1 105
CFUNCTIONEND 2

CFUNCTION 3

_main	:
CBLOCK 3 1 109

;;{
CLINEA 0000H 0001H 006DH 0001H 0001H
;;*****************************************
;;	register/stack information
;;*****************************************
;;*****************************************

CBLOCK 3 2 109

;;    while(1)
CLINEA 0000H 0001H 006EH 0005H 000CH
	bal	_$L48
_$L50 :
CBLOCK 3 3 111
CLOCAL 46H 0001H 0018H 0003H "pressedbutton" 02H 00H 00H

;;        byte pressedbutton = CheckButtons();
CLINEA 0000H 0001H 0070H 0009H 002CH
	bl	_CheckButtons
	mov	r4,	r0	;; _lpressedbutton$0

;;        if(pressedbutton == 0xff)
CLINEA 0000H 0001H 0071H 0009H 0021H
	cmp	r0,	#0ffh
	beq	_$L50
CBLOCK 3 4 114

;;            continue;
CLINEA 0000H 0001H 0073H 000DH 0015H
CBLOCKEND 3 4 116

;;        if(pressedbutton == B_0)
CLINEA 0000H 0001H 0075H 0009H 0020H
	cmp	r0,	#0bh
	bne	_$L54
CBLOCK 3 5 118

;;            print("You pressed 0", 0, 0);
CLINEA 0000H 0001H 0077H 000DH 0029H
	mov	r3,	#00h
	mov	r2,	#00h
	mov	r0,	#BYTE1 OFFSET $$S56
	mov	r1,	#BYTE2 OFFSET $$S56
	bl	_print
CBLOCKEND 3 5 120

;;        }
CLINEA 0000H 0000H 0078H 0009H 0009H
_$L54 :

;;        deref(0xE000) = pressedbutton;
CLINEA 0000H 0001H 0079H 0009H 0026H
	st	r4,	0e000h
CBLOCKEND 3 3 122

;;    }
CLINEA 0000H 0000H 007AH 0005H 0005H
_$L48 :

;;    while(1)
CLINEA 0000H 0000H 006EH 000EH 0017H
	bal	_$L50
CBLOCKEND 3 2 123

;;}
CLINEA 0000H 0001H 007BH 0001H 0001H
CBLOCKEND 3 1 123
CFUNCTIONEND 3

	public _CheckButtons
	public _image_raw
	public _lastbutton
	public _main
	public _drawbitmap
	public _print
	extrn code : $$start_up

	cseg #00h at 02h
	dw	$$start_up

	rseg $$NINITTAB
	db	0ffh

	rseg $$NTABmain
_image_raw :
	db	055h
	db	0aah
	db	055h
	db	0aah
	db	055h
	db	0aah
	db	055h
	db	0aah
	db	055h
	db	0aah
	db	055h
	db	0aah
	db	055h
	db	0aah
	db	055h
	db	080h
	db	080h
	db	080h
	db	080h
	db	080h
	db	080h
	db	080h
	db	080h
	db	080h
	db	080h
	db	080h
	db	080h
	db	080h
	db	080h
	db	080h
	db	080h
	db	0ffh
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	0ffh
	db	080h
	db	080h
	db	080h
	db	080h
	db	080h
	db	080h
	db	080h
	db	080h
	db	080h
	db	080h
	db	080h
	db	080h
	db	080h
	db	080h
	db	080h
	db	0ffh
	db	0aah
	db	054h
	db	0aah
	db	054h
	db	0aah
	db	054h
	db	0aah
	db	054h
	db	0aah
	db	054h
	db	0aah
	db	054h
	db	0aah
	db	054h
	db	00h
	db	081h
	db	081h
	db	081h
	db	081h
	db	081h
	db	081h
	db	081h
	db	081h
	db	081h
	db	081h
	db	081h
	db	081h
	db	081h
	db	081h
	db	081h
	db	081h
	db	0ffh
	db	01h
	db	01h
	db	01h
	db	01h
	db	01h
	db	01h
	db	01h
	db	01h
	db	01h
	db	01h
	db	01h
	db	01h
	db	01h
	db	01h
	db	01h
	db	0ffh
	db	081h
	db	081h
	db	081h
	db	081h
	db	081h
	db	081h
	db	081h
	db	081h
	db	081h
	db	081h
	db	081h
	db	081h
	db	081h
	db	081h
	db	081h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	0ffh
	db	080h
	db	080h
	db	080h
	db	080h
	db	080h
	db	080h
	db	080h
	db	080h
	db	080h
	db	080h
	db	080h
	db	080h
	db	080h
	db	080h
	db	080h
	db	0ffh
	db	0ffh
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	0ffh
	db	0ffh
	db	080h
	db	080h
	db	080h
	db	080h
	db	080h
	db	080h
	db	080h
	db	080h
	db	080h
	db	080h
	db	080h
	db	080h
	db	080h
	db	080h
	db	0ffh
	db	01h
	db	01h
	db	01h
	db	01h
	db	01h
	db	01h
	db	01h
	db	01h
	db	01h
	db	01h
	db	01h
	db	01h
	db	01h
	db	01h
	db	01h
	db	0ffh
	db	081h
	db	081h
	db	081h
	db	081h
	db	081h
	db	081h
	db	081h
	db	081h
	db	081h
	db	081h
	db	081h
	db	081h
	db	081h
	db	081h
	db	081h
	db	0ffh
	db	0ffh
	db	01h
	db	01h
	db	01h
	db	01h
	db	01h
	db	01h
	db	01h
	db	01h
	db	01h
	db	01h
	db	01h
	db	01h
	db	01h
	db	01h
	db	0ffh
	db	0ffh
	db	081h
	db	081h
	db	081h
	db	081h
	db	081h
	db	081h
	db	081h
	db	081h
	db	081h
	db	081h
	db	081h
	db	081h
	db	081h
	db	081h
	db	0ffh
	db	01h
	db	01h
	db	02h
	db	02h
	db	04h
	db	04h
	db	08h
	db	08h
	db	010h
	db	010h
	db	020h
	db	020h
	db	040h
	db	040h
	db	080h
	db	080h
	db	080h
	db	080h
	db	040h
	db	040h
	db	020h
	db	020h
	db	010h
	db	010h
	db	08h
	db	08h
	db	04h
	db	04h
	db	02h
	db	02h
	db	01h
	db	01h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	0ffh
	db	0ffh
	db	0ffh
	db	0ffh
	db	0ffh
	db	0ffh
	db	0ffh
	db	0ffh
	db	0fh
	db	0fh
	db	0fh
	db	0fh
	db	0fh
	db	0fh
	db	0fh
	db	0fh
	db	0f0h
	db	0f0h
	db	0f0h
	db	0f0h
	db	0f0h
	db	0f0h
	db	0f0h
	db	0f0h
	db	0ffh
	db	0aah
	db	055h
	db	0aah
	db	055h
	db	0aah
	db	055h
	db	0aah
	db	055h
	db	0aah
	db	055h
	db	0aah
	db	055h
	db	0aah
	db	055h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	0ffh
	db	0ffh
	db	0ffh
	db	0ffh
	db	0ffh
	db	0ffh
	db	0ffh
	db	0ffh
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	03ch
	db	042h
	db	081h
	db	081h
	db	081h
	db	081h
	db	042h
	db	03ch
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	03ch
	db	07eh
	db	0ffh
	db	0ffh
	db	0ffh
	db	0ffh
	db	07eh
	db	03ch
	db	00h
	db	00h
	db	00h
	db	00h
	db	0ffh
	db	0aah
	db	0d5h
	db	0aah
	db	0d5h
	db	0aah
	db	0d5h
	db	0aah
	db	0d5h
	db	0aah
	db	0d5h
	db	0aah
	db	0d5h
	db	0aah
	db	0d5h
	db	080h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	080h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	01h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	080h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	01h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	0ffh
	db	0ffh
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	08h
	db	08h
	db	08h
	db	08h
	db	08h
	db	08h
	db	08h
	db	00h
	db	08h
	db	08h
	db	00h
	db	00h
	db	00h
	db	00h
	db	022h
	db	022h
	db	022h
	db	022h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	012h
	db	012h
	db	012h
	db	07eh
	db	024h
	db	024h
	db	07eh
	db	048h
	db	048h
	db	048h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	08h
	db	03eh
	db	049h
	db	048h
	db	038h
	db	0eh
	db	09h
	db	049h
	db	03eh
	db	08h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	031h
	db	04ah
	db	04ah
	db	034h
	db	08h
	db	08h
	db	016h
	db	029h
	db	029h
	db	046h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	01ch
	db	022h
	db	022h
	db	014h
	db	018h
	db	029h
	db	045h
	db	042h
	db	046h
	db	039h
	db	00h
	db	00h
	db	00h
	db	00h
	db	08h
	db	08h
	db	08h
	db	08h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	04h
	db	08h
	db	08h
	db	010h
	db	010h
	db	010h
	db	010h
	db	010h
	db	010h
	db	08h
	db	08h
	db	04h
	db	00h
	db	00h
	db	00h
	db	00h
	db	020h
	db	010h
	db	010h
	db	08h
	db	08h
	db	08h
	db	08h
	db	08h
	db	08h
	db	010h
	db	010h
	db	020h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	08h
	db	049h
	db	02ah
	db	01ch
	db	02ah
	db	049h
	db	08h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	08h
	db	08h
	db	08h
	db	07fh
	db	08h
	db	08h
	db	08h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	018h
	db	08h
	db	08h
	db	010h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	03ch
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	018h
	db	018h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	02h
	db	02h
	db	04h
	db	08h
	db	08h
	db	010h
	db	010h
	db	020h
	db	040h
	db	040h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	018h
	db	024h
	db	042h
	db	046h
	db	04ah
	db	052h
	db	062h
	db	042h
	db	024h
	db	018h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	08h
	db	018h
	db	028h
	db	08h
	db	08h
	db	08h
	db	08h
	db	08h
	db	08h
	db	03eh
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	03ch
	db	042h
	db	042h
	db	02h
	db	0ch
	db	010h
	db	020h
	db	040h
	db	040h
	db	07eh
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	03ch
	db	042h
	db	042h
	db	02h
	db	01ch
	db	02h
	db	02h
	db	042h
	db	042h
	db	03ch
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	04h
	db	0ch
	db	014h
	db	024h
	db	044h
	db	044h
	db	07eh
	db	04h
	db	04h
	db	04h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	07eh
	db	040h
	db	040h
	db	040h
	db	07ch
	db	02h
	db	02h
	db	02h
	db	042h
	db	03ch
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	01ch
	db	020h
	db	040h
	db	040h
	db	07ch
	db	042h
	db	042h
	db	042h
	db	042h
	db	03ch
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	07eh
	db	02h
	db	02h
	db	04h
	db	04h
	db	04h
	db	08h
	db	08h
	db	08h
	db	08h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	03ch
	db	042h
	db	042h
	db	042h
	db	03ch
	db	042h
	db	042h
	db	042h
	db	042h
	db	03ch
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	03ch
	db	042h
	db	042h
	db	042h
	db	03eh
	db	02h
	db	02h
	db	02h
	db	04h
	db	038h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	018h
	db	018h
	db	00h
	db	00h
	db	00h
	db	018h
	db	018h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	018h
	db	018h
	db	00h
	db	00h
	db	00h
	db	018h
	db	08h
	db	08h
	db	010h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	02h
	db	04h
	db	08h
	db	010h
	db	020h
	db	010h
	db	08h
	db	04h
	db	02h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	07eh
	db	00h
	db	00h
	db	00h
	db	07eh
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	040h
	db	020h
	db	010h
	db	08h
	db	04h
	db	08h
	db	010h
	db	020h
	db	040h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	03ch
	db	042h
	db	042h
	db	02h
	db	04h
	db	08h
	db	08h
	db	00h
	db	08h
	db	08h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	01ch
	db	022h
	db	04ah
	db	056h
	db	052h
	db	052h
	db	052h
	db	04eh
	db	020h
	db	01eh
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	018h
	db	024h
	db	024h
	db	042h
	db	042h
	db	07eh
	db	042h
	db	042h
	db	042h
	db	042h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	07ch
	db	042h
	db	042h
	db	042h
	db	07ch
	db	042h
	db	042h
	db	042h
	db	042h
	db	07ch
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	03ch
	db	042h
	db	042h
	db	040h
	db	040h
	db	040h
	db	040h
	db	042h
	db	042h
	db	03ch
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	078h
	db	044h
	db	042h
	db	042h
	db	042h
	db	042h
	db	042h
	db	042h
	db	044h
	db	078h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	07eh
	db	040h
	db	040h
	db	040h
	db	07ch
	db	040h
	db	040h
	db	040h
	db	040h
	db	07eh
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	07eh
	db	040h
	db	040h
	db	040h
	db	07ch
	db	040h
	db	040h
	db	040h
	db	040h
	db	040h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	03ch
	db	042h
	db	042h
	db	040h
	db	040h
	db	04eh
	db	042h
	db	042h
	db	046h
	db	03ah
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	042h
	db	042h
	db	042h
	db	042h
	db	07eh
	db	042h
	db	042h
	db	042h
	db	042h
	db	042h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	03eh
	db	08h
	db	08h
	db	08h
	db	08h
	db	08h
	db	08h
	db	08h
	db	08h
	db	03eh
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	01fh
	db	04h
	db	04h
	db	04h
	db	04h
	db	04h
	db	04h
	db	044h
	db	044h
	db	038h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	042h
	db	044h
	db	048h
	db	050h
	db	060h
	db	060h
	db	050h
	db	048h
	db	044h
	db	042h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	040h
	db	040h
	db	040h
	db	040h
	db	040h
	db	040h
	db	040h
	db	040h
	db	040h
	db	07eh
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	042h
	db	042h
	db	066h
	db	066h
	db	05ah
	db	05ah
	db	042h
	db	042h
	db	042h
	db	042h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	042h
	db	062h
	db	062h
	db	052h
	db	052h
	db	04ah
	db	04ah
	db	046h
	db	046h
	db	042h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	03ch
	db	042h
	db	042h
	db	042h
	db	042h
	db	042h
	db	042h
	db	042h
	db	042h
	db	03ch
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	07ch
	db	042h
	db	042h
	db	042h
	db	07ch
	db	040h
	db	040h
	db	040h
	db	040h
	db	040h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	03ch
	db	042h
	db	042h
	db	042h
	db	042h
	db	042h
	db	042h
	db	05ah
	db	066h
	db	03ch
	db	03h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	07ch
	db	042h
	db	042h
	db	042h
	db	07ch
	db	048h
	db	044h
	db	044h
	db	042h
	db	042h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	03ch
	db	042h
	db	042h
	db	040h
	db	030h
	db	0ch
	db	02h
	db	042h
	db	042h
	db	03ch
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	07fh
	db	08h
	db	08h
	db	08h
	db	08h
	db	08h
	db	08h
	db	08h
	db	08h
	db	08h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	042h
	db	042h
	db	042h
	db	042h
	db	042h
	db	042h
	db	042h
	db	042h
	db	042h
	db	03ch
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	041h
	db	041h
	db	041h
	db	022h
	db	022h
	db	022h
	db	014h
	db	014h
	db	08h
	db	08h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	042h
	db	042h
	db	042h
	db	042h
	db	05ah
	db	05ah
	db	066h
	db	066h
	db	042h
	db	042h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	042h
	db	042h
	db	024h
	db	024h
	db	018h
	db	018h
	db	024h
	db	024h
	db	042h
	db	042h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	041h
	db	041h
	db	022h
	db	022h
	db	014h
	db	08h
	db	08h
	db	08h
	db	08h
	db	08h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	07eh
	db	02h
	db	02h
	db	04h
	db	08h
	db	010h
	db	020h
	db	040h
	db	040h
	db	07eh
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	0eh
	db	08h
	db	08h
	db	08h
	db	08h
	db	08h
	db	08h
	db	08h
	db	08h
	db	08h
	db	08h
	db	0eh
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	040h
	db	040h
	db	020h
	db	010h
	db	010h
	db	08h
	db	08h
	db	04h
	db	02h
	db	02h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	070h
	db	010h
	db	010h
	db	010h
	db	010h
	db	010h
	db	010h
	db	010h
	db	010h
	db	010h
	db	010h
	db	070h
	db	00h
	db	00h
	db	00h
	db	018h
	db	024h
	db	042h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	07fh
	db	00h
	db	00h
	db	020h
	db	010h
	db	08h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	03ch
	db	042h
	db	02h
	db	03eh
	db	042h
	db	042h
	db	046h
	db	03ah
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	040h
	db	040h
	db	040h
	db	05ch
	db	062h
	db	042h
	db	042h
	db	042h
	db	042h
	db	062h
	db	05ch
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	03ch
	db	042h
	db	040h
	db	040h
	db	040h
	db	040h
	db	042h
	db	03ch
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	02h
	db	02h
	db	02h
	db	03ah
	db	046h
	db	042h
	db	042h
	db	042h
	db	042h
	db	046h
	db	03ah
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	03ch
	db	042h
	db	042h
	db	07eh
	db	040h
	db	040h
	db	042h
	db	03ch
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	0ch
	db	010h
	db	010h
	db	010h
	db	07ch
	db	010h
	db	010h
	db	010h
	db	010h
	db	010h
	db	010h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	02h
	db	03ah
	db	044h
	db	044h
	db	044h
	db	038h
	db	020h
	db	03ch
	db	042h
	db	042h
	db	03ch
	db	00h
	db	00h
	db	00h
	db	040h
	db	040h
	db	040h
	db	05ch
	db	062h
	db	042h
	db	042h
	db	042h
	db	042h
	db	042h
	db	042h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	08h
	db	08h
	db	00h
	db	018h
	db	08h
	db	08h
	db	08h
	db	08h
	db	08h
	db	08h
	db	03eh
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	04h
	db	04h
	db	00h
	db	0ch
	db	04h
	db	04h
	db	04h
	db	04h
	db	04h
	db	04h
	db	04h
	db	048h
	db	030h
	db	00h
	db	00h
	db	00h
	db	040h
	db	040h
	db	040h
	db	044h
	db	048h
	db	050h
	db	060h
	db	050h
	db	048h
	db	044h
	db	042h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	018h
	db	08h
	db	08h
	db	08h
	db	08h
	db	08h
	db	08h
	db	08h
	db	08h
	db	08h
	db	03eh
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	076h
	db	049h
	db	049h
	db	049h
	db	049h
	db	049h
	db	049h
	db	049h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	05ch
	db	062h
	db	042h
	db	042h
	db	042h
	db	042h
	db	042h
	db	042h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	03ch
	db	042h
	db	042h
	db	042h
	db	042h
	db	042h
	db	042h
	db	03ch
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	05ch
	db	062h
	db	042h
	db	042h
	db	042h
	db	042h
	db	062h
	db	05ch
	db	040h
	db	040h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	03ah
	db	046h
	db	042h
	db	042h
	db	042h
	db	042h
	db	046h
	db	03ah
	db	02h
	db	02h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	05ch
	db	062h
	db	042h
	db	040h
	db	040h
	db	040h
	db	040h
	db	040h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	03ch
	db	042h
	db	040h
	db	030h
	db	0ch
	db	02h
	db	042h
	db	03ch
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	010h
	db	010h
	db	010h
	db	07ch
	db	010h
	db	010h
	db	010h
	db	010h
	db	010h
	db	0ch
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	042h
	db	042h
	db	042h
	db	042h
	db	042h
	db	042h
	db	046h
	db	03ah
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	042h
	db	042h
	db	042h
	db	024h
	db	024h
	db	024h
	db	018h
	db	018h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	041h
	db	049h
	db	049h
	db	049h
	db	049h
	db	049h
	db	049h
	db	036h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	042h
	db	042h
	db	024h
	db	018h
	db	018h
	db	024h
	db	042h
	db	042h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	042h
	db	042h
	db	042h
	db	042h
	db	042h
	db	026h
	db	01ah
	db	02h
	db	02h
	db	03ch
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	07eh
	db	02h
	db	04h
	db	08h
	db	010h
	db	020h
	db	040h
	db	07eh
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	0ch
	db	010h
	db	010h
	db	08h
	db	08h
	db	010h
	db	020h
	db	010h
	db	08h
	db	08h
	db	010h
	db	010h
	db	0ch
	db	00h
	db	00h
	db	08h
	db	08h
	db	08h
	db	08h
	db	08h
	db	08h
	db	08h
	db	08h
	db	08h
	db	08h
	db	08h
	db	08h
	db	08h
	db	08h
	db	00h
	db	00h
	db	00h
	db	030h
	db	08h
	db	08h
	db	010h
	db	010h
	db	08h
	db	04h
	db	08h
	db	010h
	db	010h
	db	08h
	db	08h
	db	030h
	db	00h
	db	00h
	db	00h
	db	031h
	db	049h
	db	046h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	01h
	db	01h
	db	03h
	db	03h
	db	07h
	db	07h
	db	0fh
	db	0fh
	db	01fh
	db	01fh
	db	03fh
	db	03fh
	db	07fh
	db	07fh
	db	0ffh
	db	00h
	db	080h
	db	080h
	db	0c0h
	db	0c0h
	db	0e0h
	db	0e0h
	db	0f0h
	db	0f0h
	db	0f8h
	db	0f8h
	db	0fch
	db	0fch
	db	0feh
	db	0feh
	db	0ffh
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	0ffh
	db	0ffh
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	0ffh
	db	0ffh
	db	0ffh
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	0ffh
	db	0ffh
	db	0ffh
	db	0ffh
	db	0ffh
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	0ffh
	db	0ffh
	db	0ffh
	db	0ffh
	db	0ffh
	db	0ffh
	db	00h
	db	00h
	db	00h
	db	00h
	db	0ffh
	db	0ffh
	db	0ffh
	db	0ffh
	db	0ffh
	db	0ffh
	db	0ffh
	db	0ffh
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	01h
	db	03h
	db	07h
	db	0fh
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	080h
	db	0c0h
	db	0e0h
	db	0f0h
	db	0f0h
	db	0e0h
	db	0c0h
	db	080h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	0fh
	db	07h
	db	03h
	db	01h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	018h
	db	018h
	db	018h
	db	018h
	db	018h
	db	018h
	db	018h
	db	01fh
	db	01fh
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	01fh
	db	01fh
	db	018h
	db	018h
	db	018h
	db	018h
	db	018h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	0f8h
	db	0f8h
	db	018h
	db	018h
	db	018h
	db	018h
	db	018h
	db	018h
	db	018h
	db	018h
	db	018h
	db	018h
	db	018h
	db	018h
	db	018h
	db	0f8h
	db	0f8h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	018h
	db	018h
	db	018h
	db	018h
	db	018h
	db	018h
	db	018h
	db	0ffh
	db	0ffh
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	018h
	db	018h
	db	018h
	db	018h
	db	018h
	db	018h
	db	018h
	db	01fh
	db	01fh
	db	018h
	db	018h
	db	018h
	db	018h
	db	018h
	db	018h
	db	018h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	0ffh
	db	0ffh
	db	018h
	db	018h
	db	018h
	db	018h
	db	018h
	db	018h
	db	018h
	db	018h
	db	018h
	db	018h
	db	018h
	db	018h
	db	018h
	db	018h
	db	0f8h
	db	0f8h
	db	018h
	db	018h
	db	018h
	db	018h
	db	018h
	db	018h
	db	018h
	db	018h
	db	018h
	db	018h
	db	018h
	db	018h
	db	018h
	db	018h
	db	0ffh
	db	0ffh
	db	018h
	db	018h
	db	018h
	db	018h
	db	018h
	db	018h
	db	018h
	db	0ffh
	db	00h
	db	07eh
	db	0ffh
	db	0ffh
	db	0ffh
	db	0ffh
	db	0ffh
	db	0ffh
	db	0ffh
	db	0ffh
	db	0ffh
	db	0ffh
	db	07eh
	db	00h
	db	0ffh
	db	0ffh
	db	00h
	db	00h
	db	00h
	db	00h
	db	07eh
	db	0ffh
	db	0ffh
	db	0ffh
	db	0ffh
	db	0ffh
	db	0ffh
	db	0ffh
	db	07eh
	db	00h
	db	0ffh
	db	0e0h
	db	018h
	db	04h
	db	02h
	db	02h
	db	01h
	db	01h
	db	01h
	db	01h
	db	01h
	db	01h
	db	02h
	db	02h
	db	04h
	db	018h
	db	0e0h
	db	07h
	db	018h
	db	020h
	db	040h
	db	040h
	db	080h
	db	080h
	db	080h
	db	080h
	db	080h
	db	080h
	db	040h
	db	040h
	db	020h
	db	018h
	db	07h
	db	0e0h
	db	0f8h
	db	0fch
	db	0feh
	db	0feh
	db	0ffh
	db	0ffh
	db	0ffh
	db	0ffh
	db	0ffh
	db	0ffh
	db	0feh
	db	0feh
	db	0fch
	db	0f8h
	db	0e0h
	db	07h
	db	01fh
	db	03fh
	db	07fh
	db	07fh
	db	0ffh
	db	0ffh
	db	0ffh
	db	0ffh
	db	0ffh
	db	0ffh
	db	07fh
	db	07fh
	db	03fh
	db	01fh
	db	07h
	db	088h
	db	022h
	db	088h
	db	022h
	db	088h
	db	022h
	db	088h
	db	022h
	db	088h
	db	022h
	db	088h
	db	022h
	db	088h
	db	022h
	db	088h
	db	022h
	db	080h
	db	00h
	db	00h
	db	00h
	db	08h
	db	00h
	db	00h
	db	00h
	db	080h
	db	00h
	db	00h
	db	00h
	db	08h
	db	00h
	db	00h
	db	00h
	db	0e0h
	db	0f8h
	db	0fch
	db	0feh
	db	0feh
	db	0ffh
	db	0ffh
	db	0ffh
	db	0ffh
	db	0ffh
	db	0ffh
	db	0ffh
	db	0ffh
	db	0ffh
	db	0ffh
	db	0ffh
	db	07h
	db	01fh
	db	03fh
	db	07fh
	db	07fh
	db	0ffh
	db	0ffh
	db	0ffh
	db	0ffh
	db	0ffh
	db	0ffh
	db	0ffh
	db	0ffh
	db	0ffh
	db	0ffh
	db	0ffh
	db	0ffh
	db	0ffh
	db	0ffh
	db	0ffh
	db	0ffh
	db	0ffh
	db	0ffh
	db	0ffh
	db	0ffh
	db	0ffh
	db	0ffh
	db	07fh
	db	07fh
	db	03fh
	db	01fh
	db	07h
	db	0ffh
	db	0ffh
	db	0ffh
	db	0ffh
	db	0ffh
	db	0ffh
	db	0ffh
	db	0ffh
	db	0ffh
	db	0ffh
	db	0ffh
	db	0feh
	db	0feh
	db	0fch
	db	0f8h
	db	0e0h
	db	0c0h
	db	030h
	db	0ch
	db	03h
	db	0c0h
	db	030h
	db	0ch
	db	03h
	db	0c0h
	db	030h
	db	0ch
	db	03h
	db	0c0h
	db	030h
	db	0ch
	db	03h
	db	011h
	db	011h
	db	022h
	db	022h
	db	044h
	db	044h
	db	088h
	db	088h
	db	011h
	db	011h
	db	022h
	db	022h
	db	044h
	db	044h
	db	088h
	db	088h
	db	00h
	db	00h
	db	00h
	db	00h
	db	08h
	db	08h
	db	00h
	db	08h
	db	08h
	db	08h
	db	08h
	db	08h
	db	08h
	db	08h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	08h
	db	08h
	db	03eh
	db	049h
	db	048h
	db	048h
	db	049h
	db	03eh
	db	08h
	db	08h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	0eh
	db	010h
	db	010h
	db	010h
	db	07ch
	db	010h
	db	010h
	db	010h
	db	03eh
	db	061h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	042h
	db	03ch
	db	024h
	db	042h
	db	042h
	db	024h
	db	03ch
	db	042h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	041h
	db	022h
	db	014h
	db	08h
	db	07fh
	db	08h
	db	07fh
	db	08h
	db	08h
	db	08h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	08h
	db	08h
	db	08h
	db	08h
	db	00h
	db	00h
	db	08h
	db	08h
	db	08h
	db	08h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	03ch
	db	042h
	db	040h
	db	03ch
	db	042h
	db	042h
	db	03ch
	db	02h
	db	042h
	db	03ch
	db	00h
	db	00h
	db	024h
	db	024h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	03ch
	db	042h
	db	099h
	db	0a5h
	db	0a1h
	db	0a1h
	db	0a5h
	db	099h
	db	042h
	db	03ch
	db	00h
	db	00h
	db	00h
	db	00h
	db	01ch
	db	02h
	db	01eh
	db	022h
	db	01eh
	db	00h
	db	03eh
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	012h
	db	012h
	db	024h
	db	024h
	db	048h
	db	024h
	db	024h
	db	012h
	db	012h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	07eh
	db	02h
	db	02h
	db	02h
	db	00h
	db	00h
	db	0ffh
	db	0aah
	db	0d4h
	db	0aah
	db	0d4h
	db	0aah
	db	0d4h
	db	0aah
	db	0d4h
	db	0aah
	db	0d4h
	db	0aah
	db	0d4h
	db	0aah
	db	0d4h
	db	080h
	db	00h
	db	00h
	db	00h
	db	00h
	db	03ch
	db	042h
	db	0b9h
	db	0a5h
	db	0a5h
	db	0b9h
	db	0a9h
	db	0a5h
	db	042h
	db	03ch
	db	00h
	db	00h
	db	00h
	db	00h
	db	07eh
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	018h
	db	024h
	db	024h
	db	018h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	08h
	db	08h
	db	08h
	db	07fh
	db	08h
	db	08h
	db	08h
	db	00h
	db	07fh
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	038h
	db	044h
	db	04h
	db	018h
	db	020h
	db	040h
	db	07ch
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	038h
	db	044h
	db	04h
	db	038h
	db	04h
	db	044h
	db	038h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	04h
	db	08h
	db	010h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	042h
	db	042h
	db	042h
	db	042h
	db	042h
	db	042h
	db	066h
	db	059h
	db	040h
	db	080h
	db	00h
	db	00h
	db	00h
	db	00h
	db	03fh
	db	07ah
	db	07ah
	db	07ah
	db	03ah
	db	0ah
	db	0ah
	db	0ah
	db	0ah
	db	0ah
	db	0ah
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	018h
	db	018h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	08h
	db	030h
	db	00h
	db	00h
	db	00h
	db	010h
	db	030h
	db	050h
	db	010h
	db	010h
	db	010h
	db	07ch
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	01ch
	db	022h
	db	022h
	db	022h
	db	01ch
	db	00h
	db	03eh
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	048h
	db	048h
	db	024h
	db	024h
	db	012h
	db	024h
	db	024h
	db	048h
	db	048h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	022h
	db	062h
	db	024h
	db	028h
	db	028h
	db	012h
	db	016h
	db	02ah
	db	04eh
	db	042h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	022h
	db	062h
	db	024h
	db	028h
	db	028h
	db	014h
	db	01ah
	db	022h
	db	044h
	db	04eh
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	062h
	db	012h
	db	024h
	db	018h
	db	068h
	db	012h
	db	016h
	db	02ah
	db	04eh
	db	042h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	010h
	db	010h
	db	00h
	db	010h
	db	010h
	db	020h
	db	040h
	db	042h
	db	042h
	db	03ch
	db	00h
	db	00h
	db	030h
	db	0ch
	db	00h
	db	00h
	db	018h
	db	024h
	db	024h
	db	042h
	db	042h
	db	07eh
	db	042h
	db	042h
	db	042h
	db	042h
	db	00h
	db	00h
	db	0ch
	db	030h
	db	00h
	db	00h
	db	018h
	db	024h
	db	024h
	db	042h
	db	042h
	db	07eh
	db	042h
	db	042h
	db	042h
	db	042h
	db	00h
	db	00h
	db	018h
	db	024h
	db	00h
	db	00h
	db	018h
	db	024h
	db	024h
	db	042h
	db	042h
	db	07eh
	db	042h
	db	042h
	db	042h
	db	042h
	db	00h
	db	00h
	db	032h
	db	04ch
	db	00h
	db	00h
	db	018h
	db	024h
	db	024h
	db	042h
	db	042h
	db	07eh
	db	042h
	db	042h
	db	042h
	db	042h
	db	00h
	db	00h
	db	024h
	db	024h
	db	00h
	db	00h
	db	018h
	db	024h
	db	024h
	db	042h
	db	042h
	db	07eh
	db	042h
	db	042h
	db	042h
	db	042h
	db	00h
	db	00h
	db	018h
	db	024h
	db	018h
	db	00h
	db	018h
	db	024h
	db	024h
	db	042h
	db	042h
	db	07eh
	db	042h
	db	042h
	db	042h
	db	042h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	01fh
	db	028h
	db	048h
	db	048h
	db	07fh
	db	048h
	db	048h
	db	048h
	db	048h
	db	04fh
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	03ch
	db	042h
	db	042h
	db	040h
	db	040h
	db	040h
	db	040h
	db	042h
	db	042h
	db	03ch
	db	08h
	db	030h
	db	030h
	db	0ch
	db	00h
	db	00h
	db	07eh
	db	040h
	db	040h
	db	040h
	db	07ch
	db	040h
	db	040h
	db	040h
	db	040h
	db	07eh
	db	00h
	db	00h
	db	0ch
	db	030h
	db	00h
	db	00h
	db	07eh
	db	040h
	db	040h
	db	040h
	db	07ch
	db	040h
	db	040h
	db	040h
	db	040h
	db	07eh
	db	00h
	db	00h
	db	018h
	db	024h
	db	00h
	db	00h
	db	07eh
	db	040h
	db	040h
	db	040h
	db	07ch
	db	040h
	db	040h
	db	040h
	db	040h
	db	07eh
	db	00h
	db	00h
	db	024h
	db	024h
	db	00h
	db	00h
	db	07eh
	db	040h
	db	040h
	db	040h
	db	07ch
	db	040h
	db	040h
	db	040h
	db	040h
	db	07eh
	db	00h
	db	00h
	db	018h
	db	06h
	db	00h
	db	00h
	db	03eh
	db	08h
	db	08h
	db	08h
	db	08h
	db	08h
	db	08h
	db	08h
	db	08h
	db	03eh
	db	00h
	db	00h
	db	0ch
	db	030h
	db	00h
	db	00h
	db	03eh
	db	08h
	db	08h
	db	08h
	db	08h
	db	08h
	db	08h
	db	08h
	db	08h
	db	03eh
	db	00h
	db	00h
	db	018h
	db	024h
	db	00h
	db	00h
	db	03eh
	db	08h
	db	08h
	db	08h
	db	08h
	db	08h
	db	08h
	db	08h
	db	08h
	db	03eh
	db	00h
	db	00h
	db	024h
	db	024h
	db	00h
	db	00h
	db	03eh
	db	08h
	db	08h
	db	08h
	db	08h
	db	08h
	db	08h
	db	08h
	db	08h
	db	03eh
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	078h
	db	044h
	db	042h
	db	042h
	db	0f2h
	db	042h
	db	042h
	db	042h
	db	044h
	db	078h
	db	00h
	db	00h
	db	032h
	db	04ch
	db	00h
	db	00h
	db	042h
	db	062h
	db	062h
	db	052h
	db	052h
	db	04ah
	db	04ah
	db	046h
	db	046h
	db	042h
	db	00h
	db	00h
	db	030h
	db	0ch
	db	00h
	db	00h
	db	03ch
	db	042h
	db	042h
	db	042h
	db	042h
	db	042h
	db	042h
	db	042h
	db	042h
	db	03ch
	db	00h
	db	00h
	db	0ch
	db	030h
	db	00h
	db	00h
	db	03ch
	db	042h
	db	042h
	db	042h
	db	042h
	db	042h
	db	042h
	db	042h
	db	042h
	db	03ch
	db	00h
	db	00h
	db	018h
	db	024h
	db	00h
	db	00h
	db	03ch
	db	042h
	db	042h
	db	042h
	db	042h
	db	042h
	db	042h
	db	042h
	db	042h
	db	03ch
	db	00h
	db	00h
	db	032h
	db	04ch
	db	00h
	db	00h
	db	03ch
	db	042h
	db	042h
	db	042h
	db	042h
	db	042h
	db	042h
	db	042h
	db	042h
	db	03ch
	db	00h
	db	00h
	db	024h
	db	024h
	db	00h
	db	00h
	db	03ch
	db	042h
	db	042h
	db	042h
	db	042h
	db	042h
	db	042h
	db	042h
	db	042h
	db	03ch
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	042h
	db	024h
	db	018h
	db	024h
	db	042h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	02h
	db	03ah
	db	044h
	db	046h
	db	04ah
	db	04ah
	db	052h
	db	052h
	db	062h
	db	022h
	db	05ch
	db	040h
	db	00h
	db	030h
	db	0ch
	db	00h
	db	00h
	db	042h
	db	042h
	db	042h
	db	042h
	db	042h
	db	042h
	db	042h
	db	042h
	db	042h
	db	03ch
	db	00h
	db	00h
	db	0ch
	db	030h
	db	00h
	db	00h
	db	042h
	db	042h
	db	042h
	db	042h
	db	042h
	db	042h
	db	042h
	db	042h
	db	042h
	db	03ch
	db	00h
	db	00h
	db	018h
	db	024h
	db	00h
	db	00h
	db	042h
	db	042h
	db	042h
	db	042h
	db	042h
	db	042h
	db	042h
	db	042h
	db	042h
	db	03ch
	db	00h
	db	00h
	db	024h
	db	024h
	db	00h
	db	00h
	db	042h
	db	042h
	db	042h
	db	042h
	db	042h
	db	042h
	db	042h
	db	042h
	db	042h
	db	03ch
	db	00h
	db	00h
	db	0ch
	db	030h
	db	00h
	db	00h
	db	041h
	db	041h
	db	022h
	db	022h
	db	014h
	db	08h
	db	08h
	db	08h
	db	08h
	db	08h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	040h
	db	040h
	db	078h
	db	044h
	db	042h
	db	042h
	db	044h
	db	078h
	db	040h
	db	040h
	db	040h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	038h
	db	044h
	db	044h
	db	048h
	db	058h
	db	044h
	db	042h
	db	042h
	db	052h
	db	04ch
	db	00h
	db	00h
	db	00h
	db	00h
	db	030h
	db	0ch
	db	00h
	db	00h
	db	03ch
	db	042h
	db	02h
	db	03eh
	db	042h
	db	042h
	db	046h
	db	03ah
	db	00h
	db	00h
	db	00h
	db	00h
	db	0ch
	db	030h
	db	00h
	db	00h
	db	03ch
	db	042h
	db	02h
	db	03eh
	db	042h
	db	042h
	db	046h
	db	03ah
	db	00h
	db	00h
	db	00h
	db	00h
	db	018h
	db	024h
	db	00h
	db	00h
	db	03ch
	db	042h
	db	02h
	db	03eh
	db	042h
	db	042h
	db	046h
	db	03ah
	db	00h
	db	00h
	db	00h
	db	00h
	db	032h
	db	04ch
	db	00h
	db	00h
	db	03ch
	db	042h
	db	02h
	db	03eh
	db	042h
	db	042h
	db	046h
	db	03ah
	db	00h
	db	00h
	db	00h
	db	00h
	db	024h
	db	024h
	db	00h
	db	00h
	db	03ch
	db	042h
	db	02h
	db	03eh
	db	042h
	db	042h
	db	046h
	db	03ah
	db	00h
	db	00h
	db	00h
	db	018h
	db	024h
	db	018h
	db	00h
	db	00h
	db	03ch
	db	042h
	db	02h
	db	03eh
	db	042h
	db	042h
	db	046h
	db	03ah
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	03eh
	db	049h
	db	09h
	db	03fh
	db	048h
	db	048h
	db	049h
	db	03eh
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	03ch
	db	042h
	db	040h
	db	040h
	db	040h
	db	040h
	db	042h
	db	03ch
	db	08h
	db	030h
	db	00h
	db	00h
	db	030h
	db	0ch
	db	00h
	db	00h
	db	03ch
	db	042h
	db	042h
	db	07eh
	db	040h
	db	040h
	db	042h
	db	03ch
	db	00h
	db	00h
	db	00h
	db	00h
	db	0ch
	db	030h
	db	00h
	db	00h
	db	03ch
	db	042h
	db	042h
	db	07eh
	db	040h
	db	040h
	db	042h
	db	03ch
	db	00h
	db	00h
	db	00h
	db	00h
	db	018h
	db	024h
	db	00h
	db	00h
	db	03ch
	db	042h
	db	042h
	db	07eh
	db	040h
	db	040h
	db	042h
	db	03ch
	db	00h
	db	00h
	db	00h
	db	00h
	db	024h
	db	024h
	db	00h
	db	00h
	db	03ch
	db	042h
	db	042h
	db	07eh
	db	040h
	db	040h
	db	042h
	db	03ch
	db	00h
	db	00h
	db	00h
	db	00h
	db	030h
	db	0ch
	db	00h
	db	00h
	db	018h
	db	08h
	db	08h
	db	08h
	db	08h
	db	08h
	db	08h
	db	03eh
	db	00h
	db	00h
	db	00h
	db	00h
	db	0ch
	db	030h
	db	00h
	db	00h
	db	018h
	db	08h
	db	08h
	db	08h
	db	08h
	db	08h
	db	08h
	db	03eh
	db	00h
	db	00h
	db	00h
	db	00h
	db	018h
	db	024h
	db	00h
	db	00h
	db	018h
	db	08h
	db	08h
	db	08h
	db	08h
	db	08h
	db	08h
	db	03eh
	db	00h
	db	00h
	db	00h
	db	00h
	db	024h
	db	024h
	db	00h
	db	00h
	db	018h
	db	08h
	db	08h
	db	08h
	db	08h
	db	08h
	db	08h
	db	03eh
	db	00h
	db	00h
	db	00h
	db	00h
	db	032h
	db	0ch
	db	014h
	db	022h
	db	02h
	db	03eh
	db	042h
	db	042h
	db	042h
	db	042h
	db	042h
	db	03ch
	db	00h
	db	00h
	db	00h
	db	00h
	db	032h
	db	04ch
	db	00h
	db	00h
	db	05ch
	db	062h
	db	042h
	db	042h
	db	042h
	db	042h
	db	042h
	db	042h
	db	00h
	db	00h
	db	00h
	db	00h
	db	030h
	db	0ch
	db	00h
	db	00h
	db	03ch
	db	042h
	db	042h
	db	042h
	db	042h
	db	042h
	db	042h
	db	03ch
	db	00h
	db	00h
	db	00h
	db	00h
	db	0ch
	db	030h
	db	00h
	db	00h
	db	03ch
	db	042h
	db	042h
	db	042h
	db	042h
	db	042h
	db	042h
	db	03ch
	db	00h
	db	00h
	db	00h
	db	00h
	db	018h
	db	024h
	db	00h
	db	00h
	db	03ch
	db	042h
	db	042h
	db	042h
	db	042h
	db	042h
	db	042h
	db	03ch
	db	00h
	db	00h
	db	00h
	db	00h
	db	032h
	db	04ch
	db	00h
	db	00h
	db	03ch
	db	042h
	db	042h
	db	042h
	db	042h
	db	042h
	db	042h
	db	03ch
	db	00h
	db	00h
	db	00h
	db	00h
	db	024h
	db	024h
	db	00h
	db	00h
	db	03ch
	db	042h
	db	042h
	db	042h
	db	042h
	db	042h
	db	042h
	db	03ch
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	018h
	db	00h
	db	00h
	db	07eh
	db	00h
	db	00h
	db	018h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	00h
	db	02h
	db	03ch
	db	046h
	db	04ah
	db	04ah
	db	052h
	db	052h
	db	062h
	db	03ch
	db	040h
	db	00h
	db	00h
	db	00h
	db	030h
	db	0ch
	db	00h
	db	00h
	db	042h
	db	042h
	db	042h
	db	042h
	db	042h
	db	042h
	db	046h
	db	03ah
	db	00h
	db	00h
	db	00h
	db	00h
	db	0ch
	db	030h
	db	00h
	db	00h
	db	042h
	db	042h
	db	042h
	db	042h
	db	042h
	db	042h
	db	046h
	db	03ah
	db	00h
	db	00h
	db	00h
	db	00h
	db	018h
	db	024h
	db	00h
	db	00h
	db	042h
	db	042h
	db	042h
	db	042h
	db	042h
	db	042h
	db	046h
	db	03ah
	db	00h
	db	00h
	db	00h
	db	00h
	db	024h
	db	024h
	db	00h
	db	00h
	db	042h
	db	042h
	db	042h
	db	042h
	db	042h
	db	042h
	db	046h
	db	03ah
	db	00h
	db	00h
	db	00h
	db	00h
	db	0ch
	db	030h
	db	00h
	db	00h
	db	042h
	db	042h
	db	042h
	db	042h
	db	042h
	db	026h
	db	01ah
	db	02h
	db	02h
	db	03ch
	db	00h
	db	00h
	db	00h
	db	040h
	db	040h
	db	040h
	db	05ch
	db	062h
	db	042h
	db	042h
	db	042h
	db	042h
	db	062h
	db	05ch
	db	040h
	db	040h
	db	00h
	db	00h
	db	024h
	db	024h
	db	00h
	db	00h
	db	042h
	db	042h
	db	042h
	db	042h
	db	042h
	db	026h
	db	01ah
	db	02h
	db	02h
	db	03ch
	db	00h
$$S56 :
	DB	"You pressed 0", 00H

	rseg $$NINITVAR
_lastbutton :
	ds	01h

	rseg $$NINITTAB
	align

	rseg $$NINITVAR
	align

	end
