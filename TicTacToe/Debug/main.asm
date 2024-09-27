;; Compile Options : /TML620906 /ML /far /SD /Oa /Om /W 1 /Fa.\ /Zs 
;; Version Number  : Ver.3.66.2
;; File Name       : main.c

	type (ML620906) 
	model large, far
	$$FINITVARmain segment data 2h any
	$$FINITTABmain segment table 2h any
	$$init_info segment table 2h any
	$$CheckButtons$main segment code 2h any
	$$PrintWord$main segment code 2h any
	$$TABboard1$main segment table 2h any
	$$TABcircle$main segment table 2h any
	$$TABcross$main segment table 2h any
	$$TABimage_raw$main segment table 2h any
	$$TABplayerx$main segment table 2h any
	$$TABplayery$main segment table 2h any
	$$TABsuwa$main segment table 2h any
	$$checkWin$main segment code 2h any
	$$delay$main segment code 2h any
	$$drawbitmap$main segment code 2h any
	$$drawstage$main segment code 2h any
	$$flipcell$main segment code 2h any
	$$get_tile$main segment code 2h any
	$$invert_line$main segment code 2h any
	$$invertbitmap$main segment code 2h any
	$$main$main segment code 2h any
	$$print$main segment code 2h any
	$$renderRLE$main segment code 2h any
	$$render_rect$main segment code 2h any
	$$set_bits$main segment code 2h any
	$$set_tile$main segment code 2h any
	STACKSEG 0400h
CVERSION 3.66.2
CGLOBAL 01H 03H 0000H "PrintWord" 08H 02H 02H 00H 83H 16H 00H 00H 07H
CGLOBAL 01H 02H 0000H "CheckButtons" 08H 02H 75H 00H 82H 06H 00H 00H 00H
CGLOBAL 01H 03H 0000H "checkWin" 08H 02H 87H 00H 83H 0aH 00H 00H 01H
CGLOBAL 01H 03H 0000H "main" 08H 02H 81H 00H 82H 32H 00H 00H 07H
CGLOBAL 01H 03H 0000H "drawstage" 08H 02H 86H 00H 83H 14H 00H 00H 07H
CGLOBAL 01H 03H 0000H "invert_line" 08H 02H 7EH 00H 83H 08H 00H 00H 07H
CGLOBAL 01H 03H 0000H "drawbitmap" 08H 02H 79H 00H 83H 10H 00H 00H 07H
CGLOBAL 01H 02H 0000H "print" 08H 02H 00H 00H 83H 1aH 00H 00H 08H
CGLOBAL 01H 03H 0000H "delay" 08H 02H 76H 00H 80H 00H 00H 00H 07H
CGLOBAL 01H 03H 0000H "invertbitmap" 08H 02H 7AH 00H 83H 0eH 00H 00H 07H
CGLOBAL 01H 03H 0000H "set_bits" 08H 02H 7BH 00H 83H 20H 00H 00H 07H
CGLOBAL 01H 02H 0000H "get_tile" 08H 02H 7FH 00H 83H 06H 00H 00H 00H
CGLOBAL 01H 03H 0000H "set_tile" 08H 02H 80H 00H 80H 04H 00H 00H 07H
CGLOBAL 01H 03H 0000H "flipcell" 08H 02H 85H 00H 81H 10H 00H 00H 07H
CGLOBAL 01H 03H 0000H "renderRLE" 08H 02H 7CH 00H 83H 22H 00H 00H 07H
CGLOBAL 01H 03H 0000H "render_rect" 08H 02H 7DH 00H 83H 16H 00H 00H 07H
CSTRUCTTAG 0000H 0000H 0001H 000CH 00000024H "_Notag"
CSTRUCTMEM 62H 00000002H 00000000H "_Mode" 02H 00H 08H
CSTRUCTMEM 63H 00000002H 00000002H "_Handle" 02H 00H 08H
CSTRUCTMEM 62H 00000003H 00000004H "_Buf" 04H 03H 04H 00H 00H
CSTRUCTMEM 62H 00000003H 00000008H "_Bend" 04H 03H 04H 00H 00H
CSTRUCTMEM 62H 00000003H 0000000CH "_Next" 04H 03H 04H 00H 00H
CSTRUCTMEM 62H 00000003H 00000010H "_Rend" 04H 03H 04H 00H 00H
CSTRUCTMEM 62H 00000003H 00000014H "_Rsave" 04H 03H 04H 00H 00H
CSTRUCTMEM 62H 00000003H 00000018H "_Wend" 04H 03H 04H 00H 00H
CSTRUCTMEM 62H 00000002H 0000001CH "_Back" 05H 01H 02H 00H 00H 00H
CSTRUCTMEM 62H 00000001H 0000001EH "_Cbuf" 02H 00H 00H
CSTRUCTMEM 62H 00000001H 0000001FH "_Nback" 02H 00H 00H
CSTRUCTMEM 63H 00000003H 00000020H "_Tmpnam" 04H 03H 04H 00H 00H
CSTRUCTTAG 0000H 0000H 0000H 0001H 00000004H "_Notag"
CSTRUCTMEM 62H 00000004H 00000000H "_Off" 02H 00H 02H
CENUMTAG 0000H 0000H 0002H 0015H "BUTTON"
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
CENUMMEM 0000000FH "SP_EQU"
CTYPEDEF 0000H 0000H 63H "_Ptrdifft" 02H 00H 01H
CTYPEDEF 0000H 0000H 63H "sword" 02H 00H 08H
CTYPEDEF 0000H 0000H 62H "ushort" 02H 00H 08H
CTYPEDEF 0000H 0000H 62H "byte" 02H 00H 00H
CTYPEDEF 0000H 0000H 62H "_Sizet" 02H 00H 01H
CTYPEDEF 0000H 0000H 62H "size_t" 02H 00H 01H
CTYPEDEF 0000H 0000H 62H "uint8_t" 02H 00H 00H
CTYPEDEF 0000H 0000H 63H "fpos_t" 04H 00H 05H 00H 00H
CTYPEDEF 0000H 0000H 62H "word" 02H 00H 08H
CTYPEDEF 0000H 0000H 63H "FILE" 04H 00H 05H 01H 00H
CTYPEDEF 0000H 0000H 62H "uint16_t" 02H 00H 08H
CGLOBAL 01H 20H 01F8H "board1" 05H 01H 0F8H 01H 00H 00H
CGLOBAL 01H 20H 006FH "cross" 05H 01H 6FH 00H 00H 00H
CGLOBAL 01H 20H 1000H "image_raw" 05H 01H 00H 10H 00H 00H
CGLOBAL 01H 20H 0064H "circle" 05H 01H 64H 00H 00H 00H
CGLOBAL 01H 62H 0001H "lastbutton" 02H 00H 00H
CGLOBAL 01H 63H 0005H "printdwordbuf" 05H 01H 05H 00H 00H 00H
CGLOBAL 00H 62H 0001H "oldx" 02H 00H 00H
CGLOBAL 00H 62H 0001H "oldy" 02H 00H 00H
CGLOBAL 01H 62H 0001H "posx" 02H 00H 00H
CGLOBAL 01H 62H 0001H "posy" 02H 00H 00H
CGLOBAL 01H 20H 025CH "suwa" 05H 01H 5CH 02H 00H 00H
CGLOBAL 01H 20H 01DBH "playerx" 05H 01H 0DBH 01H 00H 00H
CGLOBAL 01H 20H 01DDH "playery" 05H 01H 0DDH 01H 00H 00H
CFILE 0001H 00000070H "..\\base.h"
CFILE 0002H 0000004FH "..\\suwa.h"
CFILE 0003H 00000038H "..\\printlib.h"
CFILE 0004H 00000403H "..\\thefont.h"
CFILE 0005H 00000105H "E:\\LAPIS\\LEXIDE\\BuildTools\\Ver.20231124\\Inc\\U16\\stdio.h"
CFILE 0006H 0000007AH "E:\\LAPIS\\LEXIDE\\BuildTools\\Ver.20231124\\Inc\\U16\\yvals.h"
CFILE 0007H 000000C9H "E:\\LAPIS\\LEXIDE\\BuildTools\\Ver.20231124\\Inc\\U16\\string.h"
CFILE 0008H 00000066H "..\\tictactoe.h"
CFILE 0009H 0000008AH "..\\screen.h"
CFILE 0000H 000001E2H "..\\main.c"

	rseg $$print$main
CFUNCTION 0

_print	:
CBLOCK 0 1 4

;;{
CLINEA 0003H 0001H 0004H 0001H 0001H
	push	lr
	bl	__regpushu8lw
	add	sp,	#-08
	mov	r11,	r3
CBLOCK 0 2 4
CRET 0014H
CARGUMENT 64H 0003H 1624H "str" 04H 03H 00H 00H 00H
CARGUMENT 46H 0001H 001FH "x" 02H 00H 00H
CARGUMENT 42H 0001H 0010H "y" 02H 00H 00H
CLOCAL 60H 0003H 0004H 0002H "what" 04H 03H 00H 00H 00H
CLOCAL 42H 0002H 0006H 0002H "curoffset" 02H 00H 08H
CLOCAL 42H 0002H 0008H 0002H "i" 02H 00H 08H

;;	const byte* what = str;
CLINEA 0003H 0001H 0005H 0002H 0018H
	st	er0,	-4[fp]
	st	r2,	-2[fp]

;;	word curoffset = (word)x+((word)y<<8)+((word)y<<7);
CLINEA 0003H 0001H 0006H 0002H 0034H
	l	r0,	16[fp]
	mov	r1,	#00h
	mov	r3,	r0
	mov	r2,	#00h
	mov	r4,	r11
	mov	r5,	#00h
	add	er2,	er4
	sllc	r1,	#07h
	sll	r0,	#07h
	add	er0,	er2
	st	er0,	-6[fp]

;;	word i = 0;
CLINEA 0003H 0001H 0008H 0002H 000CH
	mov	er0,	#0 

;;	while(*what)
CLINEA 0003H 0001H 0009H 0002H 000DH
	bal	_$L1
_$L3 :
CBLOCK 0 3 10

;;		drawbitmap(image_raw+((word)(*what)<<4),curoffset,1,16);
CLINEA 0003H 0001H 000DH 0003H 003AH
	mov	er0,	#16
	push	er0
	mov	er0,	#1 
	push	er0
	l	er0,	-6[fp]
	push	er0
	l	r0,	-2[fp]
	l	r0,	r0:[bp]
	mov	r1,	#00h
	sllc	r1,	#04h
	sll	r0,	#04h
	mov	er2,	er0
	mov	r0,	#BYTE1 OFFSET _image_raw
	mov	r1,	#BYTE2 OFFSET _image_raw
	add	er0,	er2
	mov	r2,	#SEG _image_raw
	bl	_drawbitmap
	add	sp,	#6 

;;		++curoffset;
CLINEA 0003H 0001H 000EH 0003H 000EH
	l	er0,	-6[fp]
	add	er0,	#1 
	st	er0,	-6[fp]

;;		++what;
CLINEA 0003H 0001H 000FH 0003H 0009H
	l	er0,	-4[fp]
	add	er0,	#1 
	st	er0,	-4[fp]

;;		++i;
CLINEA 0003H 0001H 0010H 0003H 0006H
	l	er0,	-8[fp]
	add	er0,	#1 
CBLOCKEND 0 3 18

;;	}
CLINEA 0003H 0000H 0012H 0002H 0002H
_$L1 :
	st	er0,	-8[fp]

;;	while(*what)
CLINEA 0003H 0000H 0009H 0000H 0000H
	l	bp,	-4[fp]
	l	r0,	-2[fp]
	l	r0,	r0:[bp]
	bne	_$L3

;;	return i;
CLINEA 0003H 0001H 0013H 0002H 000AH
	l	er0,	-8[fp]
CBLOCKEND 0 2 20

;;}
CLINEA 0003H 0000H 0014H 0001H 0001H
	b	__regpopu8lw
CBLOCKEND 0 1 20
CFUNCTIONEND 0


	rseg $$PrintWord$main
CFUNCTION 2

_PrintWord	:
CBLOCK 2 1 25

;;{
CLINEA 0003H 0001H 0019H 0001H 0001H
	push	lr
	bl	__regpushu8lw
	add	sp,	#-06
	mov	er8,	er0
	mov	r11,	r3
	mov	r10,	r2
CBLOCK 2 2 25
CRET 0012H
CARGUMENT 46H 0002H 0028H "num" 02H 00H 01H
CARGUMENT 46H 0001H 001EH "x" 02H 00H 00H
CARGUMENT 46H 0001H 001FH "y" 02H 00H 00H
CLOCAL 42H 0001H 0001H 0002H "luup" 02H 00H 00H
CLOCAL 62H 0003H 0006H 0002H "out" 04H 03H 00H 00H 00H

;;	byte luup = 0;
CLINEA 0003H 0001H 001AH 0002H 000FH
	mov	r0,	#00h
	st	r0,	-1[fp]

;;	byte* out = &printdwordbuf[3];
CLINEA 0003H 0001H 001BH 0002H 001FH
	mov	r0,	#BYTE1 OFFSET (_printdwordbuf+03h)
	mov	r1,	#BYTE2 OFFSET (_printdwordbuf+03h)
	mov	r2,	#SEG _printdwordbuf
	st	er0,	-6[fp]
	st	r2,	-4[fp]

;;	for(luup = 0; luup < 3; luup++)
CLINEA 0003H 0000H 001CH 0002H 0020H
_$L9 :
CBLOCK 2 3 29

;;		if((num&0xf) > 0x9)
CLINEA 0003H 0000H 001EH 0000H 0000H
	mov	er0,	er8
	and	r0,	#0fh
	and	r1,	#00h
	mov	er2,	er0

;;		if((num&0xf) > 0x9)
CLINEA 0003H 0001H 001EH 0003H 0015H
	cmp	r0,	#09h
	cmpc	r1,	#00h
	ble	_$L13
CBLOCK 2 4 31

;;			*out = 'a'+(num&0xf)-0xa;
CLINEA 0003H 0001H 0020H 0004H 001CH
	mov	r0,	r2
	add	r0,	#057h
CBLOCKEND 2 4 33
	bal	_$L15
_$L13 :

;;		else
CLINEA 0003H 0000H 0022H 0003H 0006H
CBLOCK 2 5 35

;;			*out = '0'+(num&0xf);
CLINEA 0003H 0001H 0024H 0004H 0018H
	mov	r0,	r2
	add	r0,	#030h
CBLOCKEND 2 5 37

;;		}
CLINEA 0003H 0000H 0025H 0003H 0003H
_$L15 :
	l	bp,	-6[fp]
	l	r1,	-4[fp]
	st	r0,	r1:[bp]

;;		num = num>>4;
CLINEA 0003H 0001H 0026H 0003H 000FH
	srlc	r8,	#04h
	srl	r9,	#04h

;;		if(!num)
CLINEA 0003H 0000H 0027H 0003H 000AH
	mov	er8,	er8
	bne	_$L16
CBLOCK 2 6 40

;;			print(out,x,y);
CLINEA 0003H 0001H 0029H 0004H 0012H
	push	r11
	mov	r3,	r10
	l	er0,	-6[fp]
	l	r2,	-4[fp]
	bl	_print

;;			return;
CLINEA 0003H 0001H 002AH 0004H 000AH
	bal	_$L6
CBLOCKEND 2 6 43

;;		}
CLINEA 0003H 0000H 002BH 0003H 0003H
_$L16 :

;;		out--;
CLINEA 0003H 0000H 002CH 0003H 0008H
	l	er0,	-6[fp]
	add	er0,	#-1
	st	er0,	-6[fp]
CBLOCKEND 2 3 45

;;	for(luup = 0; luup < 3; luup++)
CLINEA 0003H 0000H 001CH 0002H 0020H
	lea	-1[fp]
	inc	[ea]
	l	r0,	-1[fp]
	cmp	r0,	#03h
	blt	_$L9

;;	if((num&0xf) > 0x9)
CLINEA 0003H 0000H 002EH 0000H 0000H
	mov	er0,	er8
	and	r0,	#0fh
	and	r1,	#00h
	mov	er2,	er0

;;	if((num&0xf) > 0x9)
CLINEA 0003H 0001H 002EH 0002H 0014H
	cmp	r0,	#09h
	cmpc	r1,	#00h
	ble	_$L20
CBLOCK 2 7 47

;;		*out = 'a'+(num&0xf)-0xa;
CLINEA 0003H 0001H 0030H 0003H 001BH
	mov	r0,	r2
	add	r0,	#057h
CBLOCKEND 2 7 49
	bal	_$L22
_$L20 :

;;	else
CLINEA 0003H 0000H 0032H 0002H 0005H
CBLOCK 2 8 51

;;		*out = '0'+(num&0xf);
CLINEA 0003H 0001H 0034H 0003H 0017H
	mov	r0,	r2
	add	r0,	#030h
CBLOCKEND 2 8 53

;;	}
CLINEA 0003H 0000H 0035H 0002H 0002H
_$L22 :
	l	bp,	-6[fp]
	l	r1,	-4[fp]
	st	r0,	r1:[bp]

;;	print(out,x,y);
CLINEA 0003H 0001H 0036H 0002H 0010H
	push	r11
	mov	r3,	r10
	l	er0,	-6[fp]
	l	r2,	-4[fp]
	bl	_print
CBLOCKEND 2 2 55

;;}
CLINEA 0003H 0001H 0037H 0001H 0001H
_$L6 :
	add	sp,	#2 
	b	__regpopu8lw
CBLOCKEND 2 1 55
CFUNCTIONEND 2


	rseg $$CheckButtons$main
CFUNCTION 117

_CheckButtons	:
CBLOCK 117 1 53

;;{
CLINEA 0000H 0001H 0035H 0001H 0001H
	push	fp
	mov	fp,	sp
	add	sp,	#-04
CBLOCK 117 2 53
CLOCAL 42H 0001H 0002H 0002H "x" 02H 00H 00H
CLOCAL 42H 0001H 0003H 0002H "y" 02H 00H 00H
CLOCAL 42H 0001H 0001H 0002H "i" 02H 00H 00H

;;	byte i = 0;
CLINEA 0000H 0001H 0038H 0002H 000CH
	mov	r0,	#00h
	st	r0,	-1[fp]

;;	for(x = 0x80; x != 0; x = x >> 1)
CLINEA 0000H 0001H 0039H 0002H 0022H
	mov	r0,	#080h
	st	r0,	-2[fp]
_$L26 :
CBLOCK 117 3 58

;;		deref(0xf046) = x;
CLINEA 0000H 0001H 003BH 0003H 0014H
	st	r0,	00h:0f046h

;;		for(y = 0x80; y != 0; y = y >> 1)
CLINEA 0000H 0001H 003CH 0003H 0023H
	mov	r0,	#080h
	st	r0,	-3[fp]
_$L32 :
CBLOCK 117 4 61

;;			if((deref(0xf040) & y) == 0)
CLINEA 0000H 0001H 003EH 0004H 001FH
	l	r0,	00h:0f040h
	l	r1,	-3[fp]
	and	r0,	r1
	bne	_$L36
CBLOCK 117 5 63

;;				if(i != lastbutton)
CLINEA 0000H 0001H 0040H 0005H 0017H
	l	r0,	FAR _lastbutton
	l	r1,	-1[fp]
	cmp	r0,	r1
	beq	_$L38
CBLOCK 117 6 65

;;					lastbutton = i;
CLINEA 0000H 0001H 0042H 0006H 0014H
	mov	r0,	r1
	st	r1,	FAR _lastbutton

;;					return i;
CLINEA 0000H 0001H 0043H 0006H 000EH
CBLOCKEND 117 6 68
CBLOCKEND 117 2 76

;;}
CLINEA 0000H 0001H 004CH 0001H 0001H
_$L23 :
	mov	sp,	fp
	pop	fp
	rt

;;				}
CLINEA 0000H 0000H 0044H 0005H 0005H
_$L38 :

;;				return 0xff;
CLINEA 0000H 0001H 0045H 0005H 0010H
	mov	r0,	#0ffh
	bal	_$L23
CBLOCKEND 117 5 70

;;			}
CLINEA 0000H 0000H 0046H 0004H 0004H
_$L36 :

;;			++i;
CLINEA 0000H 0001H 0047H 0004H 0007H
	lea	-1[fp]
	inc	[ea]
CBLOCKEND 117 4 72

;;		for(y = 0x80; y != 0; y = y >> 1)
CLINEA 0000H 0000H 003CH 0003H 0023H
	mov	r0,	r1
	srl	r0,	#01h
	st	r0,	-3[fp]
	cmp	r0,	#00h
	bne	_$L32
CBLOCKEND 117 3 73

;;	for(x = 0x80; x != 0; x = x >> 1)
CLINEA 0000H 0000H 0039H 0002H 0022H
	l	r0,	-2[fp]
	srl	r0,	#01h
	st	r0,	-2[fp]
	cmp	r0,	#00h
	bne	_$L26

;;	lastbutton = 0x50;
CLINEA 0000H 0001H 004AH 0002H 0013H
	mov	r0,	#050h
	st	r0,	FAR _lastbutton

;;	return 0xff;
CLINEA 0000H 0001H 004BH 0002H 000DH
	mov	r0,	#0ffh
	bal	_$L23
CBLOCKEND 117 1 76
CFUNCTIONEND 117


	rseg $$delay$main
CFUNCTION 118

_delay	:
CBLOCK 118 1 79

;;{
CLINEA 0000H 0001H 004FH 0001H 0001H
CBLOCK 118 2 79
CARGUMENT 46H 0002H 0024H "after_ticks" 02H 00H 01H

;;    if ((FCON & 2) != 0)
CLINEA 0000H 0001H 0050H 0005H 0018H
	tb	00h:0f00ah.1
	beq	_$L41

;;        FCON &= 0xfd;
CLINEA 0000H 0001H 0051H 0009H 0015H
	rb	00h:0f00ah.1
_$L41 :

;;    __DI();
CLINEA 0000H 0001H 0052H 0005H 000BH
	di

;;    Timer0Interval = after_ticks;
CLINEA 0000H 0001H 0053H 0005H 0021H
	st	er0,	00h:0f020h

;;    Timer0Counter = 0;
CLINEA 0000H 0001H 0054H 0005H 0016H
	mov	er0,	#0 
	st	er0,	00h:0f022h

;;    Timer0Control = 0x0101;
CLINEA 0000H 0001H 0055H 0005H 001BH
	mov	r0,	#01h
	mov	r1,	#01h
	st	er0,	00h:0f024h

;;    InterruptPending_W0 = 0;
CLINEA 0000H 0001H 0056H 0005H 001CH
	mov	er0,	#0 
	st	er0,	00h:0f014h

;;    StopAcceptor = 0x50;
CLINEA 0000H 0001H 0057H 0005H 0018H
	mov	r0,	#050h
	st	r0,	00h:0f008h

;;    StopAcceptor = 0xa0;
CLINEA 0000H 0001H 0058H 0005H 0018H
	mov	r0,	#0a0h
	st	r0,	00h:0f008h

;;    StopControl = 2;
CLINEA 0000H 0001H 0059H 0005H 0014H
	mov	r0,	#02h
	st	r0,	00h:0f009h

;;    __asm("nop");
CLINEA 0000H 0001H 005AH 0005H 0011H
nop

;;    __asm("nop");
CLINEA 0000H 0001H 005BH 0005H 0011H
nop

;;    __EI();
CLINEA 0000H 0001H 005CH 0005H 000BH
	ei
CBLOCKEND 118 2 93

;;}
CLINEA 0000H 0001H 005DH 0001H 0001H
	rt
CBLOCKEND 118 1 93
CFUNCTIONEND 118


	rseg $$drawbitmap$main
CFUNCTION 121

_drawbitmap	:
CBLOCK 121 1 97

;;{
CLINEA 0000H 0001H 0061H 0001H 0001H
	push	lr
	bl	__regpushu8lw
	add	sp,	#-08
	mov	er8,	er0
	mov	er10,	er2
CBLOCK 121 2 97
CRET 0014H
CARGUMENT 64H 0003H 1E28H "ptr" 04H 03H 00H 00H 00H
CARGUMENT 46H 0001H 001FH "width" 02H 00H 00H
CARGUMENT 42H 0002H 0010H "offset" 02H 00H 01H
CARGUMENT 42H 0001H 0012H "height" 02H 00H 00H
CLOCAL 42H 0002H 0008H 0002H "x" 02H 00H 08H
CLOCAL 42H 0002H 0006H 0002H "y" 02H 00H 08H
CLOCAL 42H 0002H 0002H 0002H "i" 02H 00H 08H
CLOCAL 42H 0002H 0004H 0002H "j" 02H 00H 08H

;;    word i = 0;
CLINEA 0000H 0001H 0064H 0005H 000FH
	mov	er0,	#0 
	st	er0,	-2[fp]

;;    word j = 0;
CLINEA 0000H 0001H 0065H 0005H 000FH
	st	er0,	-4[fp]

;;    deref(0xF037) = 0;
CLINEA 0000H 0001H 0066H 0005H 0016H
	st	r0,	00h:0f037h

;;    for(y = 0; y < offset; y++)
CLINEA 0000H 0001H 0067H 0005H 001FH
	bal	_$L49
_$L46 :
CBLOCK 121 3 104

;;        ++j;
CLINEA 0000H 0001H 0069H 0009H 000CH
	l	er0,	-4[fp]
	add	er0,	#1 
	st	er0,	-4[fp]

;;        if((j&0x1f) == 0x18)
CLINEA 0000H 0001H 006AH 0009H 001CH
	and	r0,	#01fh
	and	r1,	#00h
	cmp	r0,	#018h
	cmpc	r1,	#00h
	bne	_$L50
CBLOCK 121 4 107

;;            j += 0x8;
CLINEA 0000H 0001H 006CH 000DH 0015H
	l	er0,	-4[fp]
	add	er0,	#8 
	st	er0,	-4[fp]
CBLOCKEND 121 4 109

;;        }
CLINEA 0000H 0000H 006DH 0009H 0009H
_$L50 :
CBLOCKEND 121 3 110

;;    for(y = 0; y < offset; y++)
CLINEA 0000H 0000H 0067H 0005H 001FH
	l	er0,	-6[fp]
	add	er0,	#1 
_$L49 :
	st	er0,	-6[fp]

;;    for(y = 0; y < offset; y++)
CLINEA 0000H 0000H 0067H 0010H 001AH
	l	er2,	16[fp]
	cmp	er0,	er2
	blt	_$L46

;;    for(y = 0; y < height; y++)
CLINEA 0000H 0001H 0070H 0009H 000EH
	mov	er0,	#0 

;;    for(y = 0; y < height; y++)
CLINEA 0000H 0000H 0070H 0010H 001AH
	bal	_$L57

;;    for(y = 0; y < height; y++)
CLINEA 0000H 0000H 0070H 001CH 001EH
_$L54 :
CBLOCK 121 5 113

;;        for(x = 0; x < width; x++)
CLINEA 0000H 0001H 0072H 000DH 0012H
	mov	er0,	#0 

;;        for(x = 0; x < width; x++)
CLINEA 0000H 0000H 0072H 0014H 001DH
	bal	_$L63

;;        for(x = 0; x < width; x++)
CLINEA 0000H 0000H 0072H 001FH 0021H
_$L60 :
CBLOCK 121 6 115

;;            deref(0xf820+j) = ptr[i];
CLINEA 0000H 0001H 0074H 000DH 0025H
	l	er0,	-2[fp]
	add	er0,	er8
	mov	er4,	er0
	l	er0,	-4[fp]
	add	r0,	#020h
	addc	r1,	#0f8h
	mov	r3,	#00h
	l	r2,	r10:[er4]
	st	r2,	r3:[er0]

;;            ++j;
CLINEA 0000H 0001H 0075H 000DH 0010H
	l	er0,	-4[fp]
	add	er0,	#1 
	st	er0,	-4[fp]

;;            if((j&0x1f) == 0x18)
CLINEA 0000H 0001H 0076H 000DH 0020H
	and	r0,	#01fh
	and	r1,	#00h
	cmp	r0,	#018h
	cmpc	r1,	#00h
	bne	_$L64
CBLOCK 121 7 119

;;                j += 0x8;
CLINEA 0000H 0001H 0078H 0011H 0019H
	l	er0,	-4[fp]
	add	er0,	#8 
	st	er0,	-4[fp]
CBLOCKEND 121 7 121

;;            }
CLINEA 0000H 0000H 0079H 000DH 000DH
_$L64 :

;;            ++i;
CLINEA 0000H 0001H 007AH 000DH 0010H
	l	er0,	-2[fp]
	add	er0,	#1 
	st	er0,	-2[fp]
CBLOCKEND 121 6 123

;;        for(x = 0; x < width; x++)
CLINEA 0000H 0000H 0072H 001FH 0021H
	l	er0,	-8[fp]
	add	er0,	#1 

;;        for(x = 0; x < width; x++)
CLINEA 0000H 0000H 0072H 0014H 001DH
_$L63 :
	st	er0,	-8[fp]
	mov	r0,	r11
	mov	r1,	#00h
	l	er2,	-8[fp]
	cmp	er2,	er0
	blt	_$L60

;;        j += 32-width;
CLINEA 0000H 0001H 007CH 0009H 0016H
	mov	r3,	#00h
	mov	er0,	#32
	sub	r0,	r11
	subc	r1,	r3
	l	er2,	-4[fp]
	add	er2,	er0
	st	er2,	-4[fp]

;;        if((j&0x1f) == 0x18)
CLINEA 0000H 0001H 007DH 0009H 001CH
	mov	er0,	er2
	and	r0,	#01fh
	and	r1,	#00h
	cmp	r0,	#018h
	cmpc	r1,	#00h
	bne	_$L66
CBLOCK 121 8 126

;;            j += 0x8;
CLINEA 0000H 0001H 007FH 000DH 0015H
	mov	er0,	er2
	add	er0,	#8 
	st	er0,	-4[fp]
CBLOCKEND 121 8 128

;;        }
CLINEA 0000H 0000H 0080H 0009H 0009H
_$L66 :
CBLOCKEND 121 5 129

;;    for(y = 0; y < height; y++)
CLINEA 0000H 0000H 0070H 001CH 001EH
	l	er0,	-6[fp]
	add	er0,	#1 

;;    for(y = 0; y < height; y++)
CLINEA 0000H 0000H 0070H 0010H 001AH
_$L57 :
	st	er0,	-6[fp]

;;    for(y = 0; y < height; y++)
CLINEA 0000H 0000H 0070H 0014H 001DH
	l	r0,	18[fp]
	mov	r1,	#00h
	l	er2,	-6[fp]
	cmp	er2,	er0
	blt	_$L54
CBLOCKEND 121 2 130

;;}
CLINEA 0000H 0001H 0082H 0001H 0001H
	b	__regpopu8lw
CBLOCKEND 121 1 130
CFUNCTIONEND 121


	rseg $$invertbitmap$main
CFUNCTION 122

_invertbitmap	:
CBLOCK 122 1 133

;;{
CLINEA 0000H 0001H 0085H 0001H 0001H
	push	lr
	bl	__regpushu8lw
	add	sp,	#-08
	mov	er8,	er0
	mov	er10,	er2
CBLOCK 122 2 133
CRET 0014H
CARGUMENT 46H 0002H 0028H "offset" 02H 00H 01H
CARGUMENT 46H 0001H 001EH "width" 02H 00H 00H
CARGUMENT 46H 0001H 001FH "height" 02H 00H 00H
CLOCAL 42H 0002H 0008H 0002H "x" 02H 00H 08H
CLOCAL 42H 0002H 0006H 0002H "y" 02H 00H 08H
CLOCAL 42H 0002H 0002H 0002H "i" 02H 00H 08H
CLOCAL 42H 0002H 0004H 0002H "j" 02H 00H 08H

;;    word i = 0;
CLINEA 0000H 0001H 0088H 0005H 000FH
	mov	er0,	#0 
	st	er0,	-2[fp]

;;    word j = 0;
CLINEA 0000H 0001H 0089H 0005H 000FH
	st	er0,	-4[fp]

;;    for(y = 0; y < offset; y++)
CLINEA 0000H 0001H 008AH 0005H 001FH
	bal	_$L74
_$L71 :
CBLOCK 122 3 139

;;        ++j;
CLINEA 0000H 0001H 008CH 0009H 000CH
	l	er0,	-4[fp]
	add	er0,	#1 
	st	er0,	-4[fp]

;;        if((j&0x1f) == 0x18)
CLINEA 0000H 0001H 008DH 0009H 001CH
	and	r0,	#01fh
	and	r1,	#00h
	cmp	r0,	#018h
	cmpc	r1,	#00h
	bne	_$L75
CBLOCK 122 4 142

;;            j += 0x8;
CLINEA 0000H 0001H 008FH 000DH 0015H
	l	er0,	-4[fp]
	add	er0,	#8 
	st	er0,	-4[fp]
CBLOCKEND 122 4 144

;;        }
CLINEA 0000H 0000H 0090H 0009H 0009H
_$L75 :
CBLOCKEND 122 3 145

;;    for(y = 0; y < offset; y++)
CLINEA 0000H 0000H 008AH 0005H 001FH
	l	er0,	-6[fp]
	add	er0,	#1 
_$L74 :
	st	er0,	-6[fp]

;;    for(y = 0; y < offset; y++)
CLINEA 0000H 0000H 008AH 0010H 001AH
	cmp	er0,	er8
	blt	_$L71

;;    for(y = 0; y < height; y++)
CLINEA 0000H 0001H 0093H 0009H 000EH
	mov	er0,	#0 

;;    for(y = 0; y < height; y++)
CLINEA 0000H 0000H 0093H 0010H 001AH
	bal	_$L82

;;    for(y = 0; y < height; y++)
CLINEA 0000H 0000H 0093H 001CH 001EH
_$L79 :
CBLOCK 122 5 148

;;        for(x = 0; x < width; x++)
CLINEA 0000H 0001H 0095H 000DH 0012H
	mov	er0,	#0 

;;        for(x = 0; x < width; x++)
CLINEA 0000H 0000H 0095H 0014H 001DH
	bal	_$L88

;;        for(x = 0; x < width; x++)
CLINEA 0000H 0000H 0095H 001FH 0021H
_$L85 :
CBLOCK 122 6 150

;;            deref(0xf820+j) = (~deref(0xF820+j));
CLINEA 0000H 0001H 0097H 000DH 0031H
	l	er0,	-4[fp]
	add	r0,	#020h
	addc	r1,	#0f8h
	mov	r2,	#00h
	l	r2,	r2:[er0]
	xor	r2,	#0ffh
	st	r2,	DSR:[er0]

;;            ++j;
CLINEA 0000H 0001H 0098H 000DH 0010H
	l	er0,	-4[fp]
	add	er0,	#1 
	st	er0,	-4[fp]

;;            if((j&0x1f) == 0x18)
CLINEA 0000H 0001H 0099H 000DH 0020H
	and	r0,	#01fh
	and	r1,	#00h
	cmp	r0,	#018h
	cmpc	r1,	#00h
	bne	_$L89
CBLOCK 122 7 154

;;                j += 0x8;
CLINEA 0000H 0001H 009BH 0011H 0019H
	l	er0,	-4[fp]
	add	er0,	#8 
	st	er0,	-4[fp]
CBLOCKEND 122 7 156

;;            }
CLINEA 0000H 0000H 009CH 000DH 000DH
_$L89 :

;;            ++i;
CLINEA 0000H 0001H 009DH 000DH 0010H
	l	er0,	-2[fp]
	add	er0,	#1 
	st	er0,	-2[fp]
CBLOCKEND 122 6 158

;;        for(x = 0; x < width; x++)
CLINEA 0000H 0000H 0095H 001FH 0021H
	l	er0,	-8[fp]
	add	er0,	#1 

;;        for(x = 0; x < width; x++)
CLINEA 0000H 0000H 0095H 0014H 001DH
_$L88 :
	st	er0,	-8[fp]
	mov	r0,	r10
	mov	r1,	#00h
	l	er2,	-8[fp]
	cmp	er2,	er0
	blt	_$L85

;;        j += 32-width;
CLINEA 0000H 0001H 009FH 0009H 0016H
	mov	r3,	#00h
	mov	er0,	#32
	sub	r0,	r10
	subc	r1,	r3
	l	er2,	-4[fp]
	add	er2,	er0
	st	er2,	-4[fp]

;;        if((j&0x1f) == 0x18)
CLINEA 0000H 0001H 00A0H 0009H 001CH
	mov	er0,	er2
	and	r0,	#01fh
	and	r1,	#00h
	cmp	r0,	#018h
	cmpc	r1,	#00h
	bne	_$L91
CBLOCK 122 8 161

;;            j += 0x8;
CLINEA 0000H 0001H 00A2H 000DH 0015H
	mov	er0,	er2
	add	er0,	#8 
	st	er0,	-4[fp]
CBLOCKEND 122 8 163

;;        }
CLINEA 0000H 0000H 00A3H 0009H 0009H
_$L91 :
CBLOCKEND 122 5 164

;;    for(y = 0; y < height; y++)
CLINEA 0000H 0000H 0093H 001CH 001EH
	l	er0,	-6[fp]
	add	er0,	#1 

;;    for(y = 0; y < height; y++)
CLINEA 0000H 0000H 0093H 0010H 001AH
_$L82 :
	st	er0,	-6[fp]

;;    for(y = 0; y < height; y++)
CLINEA 0000H 0000H 0093H 0014H 001DH
	mov	r0,	r11
	mov	r1,	#00h
	l	er2,	-6[fp]
	cmp	er2,	er0
	blt	_$L79
CBLOCKEND 122 2 165

;;}
CLINEA 0000H 0001H 00A5H 0001H 0001H
	b	__regpopu8lw
CBLOCKEND 122 1 165
CFUNCTIONEND 122


	rseg $$set_bits$main
CFUNCTION 123

_set_bits	:
CBLOCK 123 1 167

;;void set_bits(uint8_t *mem_address, int start_bit, int num_bits, byte color, byte invert) {
CLINEA 0000H 0001H 00A7H 0001H 005BH
	push	lr
	bl	__regpushu8lw
	add	sp,	#-016
	mov	r11,	r3
	mov	er8,	er0
	mov	r10,	r2
CBLOCK 123 2 167
CRET 001CH
CARGUMENT 66H 0003H 1E28H "mem_address" 04H 03H 00H 00H 00H
CARGUMENT 46H 0001H 001FH "color" 02H 00H 00H
CARGUMENT 43H 0002H 0010H "start_bit" 02H 00H 01H
CARGUMENT 43H 0002H 0012H "num_bits" 02H 00H 01H
CARGUMENT 42H 0001H 0014H "invert" 02H 00H 00H
CLOCAL 43H 0002H 0002H 0002H "start_byte" 02H 00H 01H
CLOCAL 43H 0002H 0004H 0002H "start_offset" 02H 00H 01H
CLOCAL 4BH 0002H 0000H 0002H "end_bit" 02H 00H 01H
CLOCAL 43H 0002H 0006H 0002H "end_byte" 02H 00H 01H
CLOCAL 43H 0002H 0008H 0002H "end_offset" 02H 00H 01H
CLOCAL 43H 0002H 000EH 0002H "i" 02H 00H 01H
CLOCAL 42H 0001H 000AH 0002H "mask" 02H 00H 00H
CLOCAL 42H 0001H 000BH 0002H "start_mask" 02H 00H 00H
CLOCAL 42H 0001H 000FH 0002H "end_mask" 02H 00H 00H
CLOCAL 42H 0001H 0009H 0002H "color_mask" 02H 00H 00H

;;    int start_byte = start_bit / 8;
CLINEA 0000H 0001H 00A9H 0005H 0023H
	l	er0,	16[fp]
	mov	er2,	#8 
	bl	__idivu8lw
	mov	er6,	er0
	st	er0,	-2[fp]

;;    int start_offset = start_bit % 8;
CLINEA 0000H 0001H 00AAH 0005H 0025H
	l	er0,	16[fp]
	mov	er2,	#8 
	bl	__imodu8lw
	st	er0,	-4[fp]

;;    int end_byte = end_bit / 8;
CLINEA 0000H 0001H 00ADH 0005H 001FH
	l	er4,	16[fp]
	l	er0,	18[fp]
	add	er4,	er0
	add	er4,	#-1
	mov	er0,	er4
	mov	er2,	#8 
	bl	__idivu8lw
	mov	bp,	er0
	st	er0,	-6[fp]

;;    int end_offset = end_bit % 8;
CLINEA 0000H 0001H 00AEH 0005H 0021H
	mov	er0,	er4
	mov	er2,	#8 
	bl	__imodu8lw
	st	er0,	-8[fp]

;;    byte color_mask = color; //? 0xFF : 0x00;
CLINEA 0000H 0001H 00B3H 0005H 002DH
	st	r11,	-9[fp]

;;    if (start_byte == end_byte) {
CLINEA 0000H 0001H 00B6H 0005H 0021H
	cmp	er6,	bp
	bne	_$L94
CBLOCK 123 3 182

;;        mask = ((1 << num_bits) - 1) << (8 - start_offset - num_bits);
CLINEA 0000H 0001H 00B8H 0009H 0046H
	mov	er0,	#1 
	l	er2,	18[fp]
	beq	_$M7
_$M8 :
	sllc	r1,	#01h
	sll	r0,	#01h
	add	er2,	#-1
	bne	_$M8
_$M7 :
	mov	er2,	er0
	add	er2,	#-1
	mov	er0,	#8 
	l	er4,	-4[fp]
	sub	r0,	r4
	subc	r1,	r5
	l	er4,	18[fp]
	sub	r0,	r4
	subc	r1,	r5
	mov	er0,	er0
	beq	_$M9
_$M10 :
	sllc	r3,	#01h
	sll	r2,	#01h
	add	er0,	#-1
	bne	_$M10
_$M9 :
	st	r2,	-10[fp]

;;        if (invert) {
CLINEA 0000H 0001H 00B9H 0009H 0015H
	l	r0,	20[fp]
	beq	_$L96
CBLOCK 123 4 185

;;            *(mem_address + start_byte) ^= mask;  // XOR để invert bit
CLINEA 0000H 0001H 00BAH 000DH 0049H
	l	er0,	-2[fp]
	add	er0,	er8
	l	r2,	r10:[er0]
	l	r3,	-10[fp]
	xor	r2,	r3
	st	r2,	DSR:[er0]
CBLOCKEND 123 4 187
	bal	_$L98
_$L96 :

;;        } else {
CLINEA 0000H 0000H 00BBH 0009H 0010H
CBLOCK 123 5 187

;;            *(mem_address + start_byte) = (*(mem_address + start_byte) & ~mask) | (color_mask & mask);  // OR để đặt bit với màu sắc
CLINEA 0000H 0001H 00BCH 000DH 008FH
	l	er0,	-2[fp]
	add	er0,	er8
	mov	r3,	r2
	xor	r3,	#0ffh
	l	r4,	r10:[er0]
	and	r3,	r4
	l	r4,	-9[fp]
	and	r4,	r2
	or	r4,	r3
	st	r4,	DSR:[er0]
CBLOCKEND 123 5 189

;;        }
CLINEA 0000H 0000H 00BDH 0009H 0009H
_$L98 :
CBLOCKEND 123 3 190
	b	_$L114
_$L94 :

;;    } else {
CLINEA 0000H 0000H 00BEH 0005H 000CH
CBLOCK 123 6 190

;;        start_mask = 0xFF >> start_offset;
CLINEA 0000H 0001H 00C0H 0009H 002AH
	mov	r0,	#0ffh
	mov	r1,	#00h
	l	er2,	-4[fp]
	beq	_$M11
_$M12 :
	srlc	r0,	#01h
	sra	r1,	#01h
	add	er2,	#-1
	bne	_$M12
_$M11 :
	st	r0,	-11[fp]

;;        if (invert) {
CLINEA 0000H 0001H 00C1H 0009H 0015H
	l	r0,	20[fp]
	beq	_$L100
CBLOCK 123 7 193

;;            *(mem_address + start_byte) ^= start_mask;  // XOR để invert bit
CLINEA 0000H 0001H 00C2H 000DH 004FH
	l	er0,	-2[fp]
	add	er0,	er8
	l	r2,	r10:[er0]
	l	r3,	-11[fp]
	xor	r2,	r3
	st	r2,	DSR:[er0]
CBLOCKEND 123 7 195
	bal	_$L102
_$L100 :

;;        } else {
CLINEA 0000H 0000H 00C3H 0009H 0010H
CBLOCK 123 8 195

;;            *(mem_address + start_byte) = (*(mem_address + start_byte) & ~start_mask) | (color_mask & start_mask);  // OR để đặt bit với màu sắc
CLINEA 0000H 0001H 00C4H 000DH 009BH
	l	er0,	-2[fp]
	add	er0,	er8
	l	r3,	-11[fp]
	xor	r3,	#0ffh
	l	r4,	r10:[er0]
	and	r3,	r4
	l	r4,	-9[fp]
	l	r5,	-11[fp]
	and	r4,	r5
	or	r4,	r3
	st	r4,	DSR:[er0]
CBLOCKEND 123 8 197

;;        }
CLINEA 0000H 0000H 00C5H 0009H 0009H
_$L102 :

;;        for (i = start_byte + 1; i < end_byte; i++) {
CLINEA 0000H 0001H 00C8H 000EH 0020H
	l	er0,	-2[fp]

;;        for (i = start_byte + 1; i < end_byte; i++) {
CLINEA 0000H 0000H 00C8H 0022H 002EH
	bal	_$L108

;;        for (i = start_byte + 1; i < end_byte; i++) {
CLINEA 0000H 0000H 00C8H 0030H 0032H
_$L105 :
CBLOCK 123 9 200

;;            if (invert) {
CLINEA 0000H 0001H 00C9H 000DH 0019H
	l	r0,	20[fp]
	beq	_$L109
CBLOCK 123 10 201

;;                *(mem_address + i) ^= 0xFF;  // XOR toàn bộ byte để invert
CLINEA 0000H 0001H 00CAH 0011H 0050H
	l	er0,	-14[fp]
	add	er0,	er8
	l	r2,	r10:[er0]
	xor	r2,	#0ffh
	st	r2,	DSR:[er0]
CBLOCKEND 123 10 203
	bal	_$L111
_$L109 :

;;            } else {
CLINEA 0000H 0000H 00CBH 000DH 0014H
CBLOCK 123 11 203

;;                *(mem_address + i) = color_mask;  // Đặt toàn bộ byte thành `color`
CLINEA 0000H 0001H 00CCH 0011H 005AH
	l	er0,	-14[fp]
	add	er0,	er8
	l	r3,	-9[fp]
	st	r3,	r10:[er0]
CBLOCKEND 123 11 205

;;            }
CLINEA 0000H 0000H 00CDH 000DH 000DH
_$L111 :
CBLOCKEND 123 9 206

;;        for (i = start_byte + 1; i < end_byte; i++) {
CLINEA 0000H 0000H 00C8H 0030H 0032H
	l	er0,	-14[fp]

;;        for (i = start_byte + 1; i < end_byte; i++) {
CLINEA 0000H 0000H 00C8H 0022H 002EH
_$L108 :
	add	er0,	#1 
	st	er0,	-14[fp]
	l	er2,	-6[fp]
	cmp	er0,	er2
	blts	_$L105

;;        end_mask = ~(0xFF >> (end_offset + 1));
CLINEA 0000H 0001H 00D1H 0009H 002FH
	l	er2,	-8[fp]
	add	er2,	#1 
	mov	r0,	#0ffh
	mov	r1,	#00h
	mov	er2,	er2
	beq	_$M13
_$M14 :
	srlc	r0,	#01h
	sra	r1,	#01h
	add	er2,	#-1
	bne	_$M14
_$M13 :
	xor	r0,	#0ffh
	st	r0,	-15[fp]

;;        if (invert) {
CLINEA 0000H 0001H 00D2H 0009H 0015H
	l	r0,	20[fp]
	beq	_$L112
CBLOCK 123 12 210

;;            *(mem_address + end_byte) ^= end_mask;  // XOR để invert bit
CLINEA 0000H 0001H 00D3H 000DH 004BH
	l	er0,	-6[fp]
	add	er0,	er8
	l	r2,	r10:[er0]
	l	r3,	-15[fp]
	xor	r2,	r3
	st	r2,	DSR:[er0]
CBLOCKEND 123 12 212
	bal	_$L114
_$L112 :

;;        } else {
CLINEA 0000H 0000H 00D4H 0009H 0010H
CBLOCK 123 13 212

;;            *(mem_address + end_byte) = (*(mem_address + end_byte) & ~end_mask) | (color_mask & end_mask);  // OR để đặt bit với màu sắc
CLINEA 0000H 0001H 00D5H 000DH 0093H
	l	er0,	-6[fp]
	add	er0,	er8
	l	r3,	-15[fp]
	xor	r3,	#0ffh
	l	r4,	r10:[er0]
	and	r3,	r4
	l	r4,	-9[fp]
	l	r5,	-15[fp]
	and	r4,	r5
	or	r4,	r3
	st	r4,	DSR:[er0]
CBLOCKEND 123 13 214

;;        }
CLINEA 0000H 0000H 00D6H 0009H 0009H
_$L114 :
CBLOCKEND 123 6 215
CBLOCKEND 123 2 216

;;}
CLINEA 0000H 0001H 00D8H 0001H 0001H
	b	__regpopu8lw
CBLOCKEND 123 1 216
CFUNCTIONEND 123


	rseg $$renderRLE$main
CFUNCTION 124

_renderRLE	:
CBLOCK 124 1 220

;;void renderRLE(const byte* ptr, int length, int x, int y){
CLINEA 0000H 0001H 00DCH 0001H 003AH
	push	lr
	bl	__regpushu8lw
	add	sp,	#-012
	mov	er8,	er0
	mov	r10,	r2
CBLOCK 124 2 220
CRET 0018H
CARGUMENT 64H 0003H 1E28H "ptr" 04H 03H 00H 00H 00H
CARGUMENT 43H 0002H 0010H "length" 02H 00H 01H
CARGUMENT 43H 0002H 0012H "x" 02H 00H 01H
CARGUMENT 43H 0002H 0014H "y" 02H 00H 01H
CLOCAL 62H 0003H 0004H 0002H "mem_address" 04H 03H 00H 00H 00H
CLOCAL 43H 0002H 0006H 0002H "i" 02H 00H 01H
CLOCAL 42H 0001H 0007H 0002H "line" 02H 00H 00H
CLOCAL 43H 0002H 000AH 0002H "j" 02H 00H 01H
CLOCAL 42H 0001H 000BH 0002H "color" 02H 00H 00H

;;	uint8_t *mem_address = (uint8_t *)0xF820 + y * 0x20;
CLINEA 0000H 0001H 00DDH 0002H 0035H
	l	er0,	20[fp]
	sllc	r1,	#05h
	sll	r0,	#05h
	add	r0,	#020h
	addc	r1,	#0f8h
	mov	r2,	#00h
	st	er0,	-4[fp]
	st	r2,	-2[fp]

;;    int i = 0;
CLINEA 0000H 0001H 00DEH 0005H 000EH
	mov	er0,	#0 
	st	er0,	-6[fp]

;;    uint8_t line = 0;
CLINEA 0000H 0001H 00DFH 0005H 0015H
	st	r0,	-7[fp]

;;    int j = x;  // Pixel offset within the line
CLINEA 0000H 0001H 00E0H 0005H 002FH
	l	er0,	18[fp]
	st	er0,	-10[fp]

;;    uint8_t color = 0x01;
CLINEA 0000H 0001H 00E1H 0005H 0019H
	mov	r0,	#01h
	st	r0,	-11[fp]

;;	for (i = 0; i <= length; i++) {
CLINEA 0000H 0001H 00E2H 0002H 0020H
	bal	_$L121
_$L118 :
CBLOCK 124 3 226

;;		if (ptr[i] == 0xFF) {
CLINEA 0000H 0001H 00E3H 0003H 0017H
	add	er0,	er8
	l	r0,	r10:[er0]
	cmp	r0,	#0ffh
	bne	_$L122
CBLOCK 124 4 227

;;			line++;
CLINEA 0000H 0000H 00E5H 0004H 000AH
	lea	-7[fp]
	inc	[ea]

;;			j = x;  // Reset horizontal position to the start of the line
CLINEA 0000H 0001H 00E6H 0004H 0040H
	l	er0,	18[fp]
	st	er0,	-10[fp]

;;			color = 1;
CLINEA 0000H 0001H 00E7H 0004H 000DH
	mov	r0,	#01h
	st	r0,	-11[fp]
CBLOCKEND 124 4 233
	bal	_$L124
_$L122 :

;;		} else {
CLINEA 0000H 0000H 00E9H 0003H 000AH
CBLOCK 124 5 233

;;			set_bits(mem_address + line * 0x20, j, ptr[i], color ? 0xFF : 0x00, 0);
CLINEA 0000H 0001H 00F0H 0004H 004AH
	l	r0,	-7[fp]
	mov	r1,	#00h
	sllc	r1,	#05h
	sll	r0,	#05h
	l	er2,	-4[fp]
	add	er0,	er2
	l	r2,	-2[fp]
	mov	bp,	er0
	mov	r11,	r2
	l	er0,	-10[fp]
	mov	er4,	er0
	l	er0,	-6[fp]
	add	er0,	er8
	l	r0,	r10:[er0]
	mov	r2,	r0
	l	r0,	-11[fp]
	beq	_$L125
	mov	r6,	#0ffh
	bal	_$L127
_$L125 :
	mov	er6,	#0 
_$L127 :
	mov	r0,	#00h
	push	r0
	mov	r0,	r2
	mov	r1,	#00h
	push	er0
	push	er4
	mov	r3,	r6
	mov	er0,	bp
	mov	r2,	r11
	bl	_set_bits
	add	sp,	#6 

;;			if (color == 0x00){
CLINEA 0000H 0001H 00F2H 0004H 0016H
	l	r0,	-11[fp]
	bne	_$L128
CBLOCK 124 6 242

;;				color = 0x01;
CLINEA 0000H 0001H 00F3H 0005H 0011H
	mov	r0,	#01h
CBLOCKEND 124 6 244
	bal	_$L130
_$L128 :

;;			} else {
CLINEA 0000H 0000H 00F4H 0004H 000BH
CBLOCK 124 7 244

;;				color = 0x00;
CLINEA 0000H 0001H 00F5H 0005H 0011H
	mov	r0,	#00h
CBLOCKEND 124 7 246

;;			}
CLINEA 0000H 0000H 00F6H 0004H 0004H
_$L130 :
	st	r0,	-11[fp]

;;			j = j + ptr[i];
CLINEA 0000H 0001H 00F7H 0004H 0012H
	l	er0,	-6[fp]
	add	er0,	er8
	l	r0,	r10:[er0]
	mov	r1,	#00h
	l	er2,	-10[fp]
	add	er2,	er0
	st	er2,	-10[fp]
CBLOCKEND 124 5 250

;;		}
CLINEA 0000H 0000H 00FAH 0003H 0003H
_$L124 :
CBLOCKEND 124 3 251

;;	for (i = 0; i <= length; i++) {
CLINEA 0000H 0000H 00E2H 0002H 0020H
	l	er0,	-6[fp]
	add	er0,	#1 
	st	er0,	-6[fp]
_$L121 :

;;	for (i = 0; i <= length; i++) {
CLINEA 0000H 0000H 00E2H 0022H 002EH
	l	er0,	-6[fp]
	l	er2,	16[fp]
	cmp	er0,	er2
	bles	_$L118
CBLOCKEND 124 2 252

;;}
CLINEA 0000H 0001H 00FCH 0001H 0001H
	b	__regpopu8lw
CBLOCKEND 124 1 252
CFUNCTIONEND 124


	rseg $$render_rect$main
CFUNCTION 125

_render_rect	:
CBLOCK 125 1 255

;;void render_rect(int x1, int y1, int x2, int y2, byte color, byte invert) {
CLINEA 0000H 0001H 00FFH 0001H 004BH
	push	lr
	bl	__regpushu8lw
	add	sp,	#-02
	mov	er10,	er2
	mov	er8,	er0
CBLOCK 125 2 255
CRET 000EH
CARGUMENT 47H 0002H 0028H "x1" 02H 00H 01H
CARGUMENT 47H 0002H 0029H "y1" 02H 00H 01H
CARGUMENT 43H 0002H 0010H "x2" 02H 00H 01H
CARGUMENT 43H 0002H 0012H "y2" 02H 00H 01H
CARGUMENT 42H 0001H 0014H "color" 02H 00H 00H
CARGUMENT 42H 0001H 0016H "invert" 02H 00H 00H
CLOCAL 6AH 0003H 0000H 0002H "mem_address" 04H 03H 00H 00H 00H
CLOCAL 43H 0002H 0002H 0002H "i" 02H 00H 01H
CLOCAL 4BH 0002H 0000H 0002H "y" 02H 00H 01H

;;	color = color * 0xFF;
CLINEA 0000H 0001H 0103H 0002H 0016H
	l	r0,	20[fp]
	mov	r2,	#0ffh
	mul	er0,	r2
	st	r0,	20[fp]

;;	for (i = y1; i <= y2; i++) {
CLINEA 0000H 0001H 0104H 0002H 001DH
	st	er10,	-2[fp]
	bal	_$L137
_$L134 :
CBLOCK 125 3 260

;;		set_bits(mem_address + i * 0x20, x1, x2 - x1, color, invert);
CLINEA 0000H 0001H 0106H 0003H 003FH
	l	r0,	22[fp]
	push	r0
	push	er4
	push	er8
	l	r3,	20[fp]
	mov	er0,	er6
	add	r0,	#020h
	addc	r1,	#0f8h
	mov	r2,	#00h
	bl	_set_bits
	add	sp,	#6 
CBLOCKEND 125 3 263

;;	for (i = y1; i <= y2; i++) {
CLINEA 0000H 0000H 0104H 0002H 001DH
	l	er0,	-2[fp]
	add	er0,	#1 
	st	er0,	-2[fp]
_$L137 :

;;	for (i = y1; i <= y2; i++) {
CLINEA 0000H 0000H 0104H 0022H 002EH
	l	er0,	16[fp]
	sub	r0,	r8
	subc	r1,	r9
	mov	er4,	er0
	l	er0,	-2[fp]
	sllc	r1,	#05h
	sll	r0,	#05h
	mov	er6,	er0
	l	er0,	-2[fp]
	l	er2,	18[fp]
	cmp	er0,	er2
	bles	_$L134
CBLOCKEND 125 2 265

;;}
CLINEA 0000H 0001H 0109H 0001H 0001H
	b	__regpopu8lw
CBLOCKEND 125 1 265
CFUNCTIONEND 125


	rseg $$invert_line$main
CFUNCTION 126

_invert_line	:
CBLOCK 126 1 269

;;{
CLINEA 0000H 0001H 010DH 0001H 0001H
	push	lr
	bl	__regpushu8lw
	add	sp,	#-04
	mov	er8,	er0
CBLOCK 126 2 269
CRET 0010H
CARGUMENT 46H 0002H 0028H "line" 02H 00H 01H
CLOCAL 42H 0002H 0004H 0002H "i" 02H 00H 08H
CLOCAL 4AH 0002H 0000H 0002H "j" 02H 00H 08H
CLOCAL 42H 0002H 0002H 0002H "offset" 02H 00H 08H

;;	word offset = (line<<9);
CLINEA 0000H 0001H 0110H 0002H 0019H
	mov	r1,	r8
	sll	r1,	#01h
	mov	r0,	#00h
	st	er0,	-2[fp]

;;	for(i = 0; i < 512; i++) //used to be 512
CLINEA 0000H 0001H 0111H 0002H 002AH
	mov	er0,	#0 
	st	er0,	-4[fp]
_$L141 :
CBLOCK 126 3 274

;;		deref(0xF820+i+offset) = (~deref(0xF820+i+offset));
CLINEA 0000H 0001H 0113H 0003H 0035H
	l	er2,	-2[fp]
	add	er0,	er2
	add	r0,	#020h
	addc	r1,	#0f8h
	mov	r2,	#00h
	l	r2,	r2:[er0]
	xor	r2,	#0ffh
	st	r2,	DSR:[er0]
CBLOCKEND 126 3 276

;;	for(i = 0; i < 512; i++) //used to be 512
CLINEA 0000H 0000H 0111H 0002H 002AH
	l	er0,	-4[fp]
	add	er0,	#1 
	st	er0,	-4[fp]

;;	for(i = 0; i < 512; i++) //used to be 512
CLINEA 0000H 0000H 0111H 0022H 002EH
	cmp	r0,	#00h
	cmpc	r1,	#02h
	blt	_$L141
CBLOCKEND 126 2 277

;;}
CLINEA 0000H 0001H 0115H 0001H 0001H
	b	__regpopu8lw
CBLOCKEND 126 1 277
CFUNCTIONEND 126


	rseg $$get_tile$main
CFUNCTION 127

_get_tile	:
CBLOCK 127 1 280

;;{
CLINEA 0000H 0001H 0118H 0001H 0001H
	push	lr
	bl	__regpushu8lw
	add	sp,	#-02
	mov	r8,	r0
CBLOCK 127 2 280
CRET 000EH
CARGUMENT 46H 0001H 001CH "x" 02H 00H 00H
CARGUMENT 46H 0001H 0015H "y" 02H 00H 00H
CLOCAL 42H 0001H 0001H 0002H "tile" 02H 00H 00H

;;	byte tile = 0;
CLINEA 0000H 0001H 0119H 0002H 000FH
	mov	r0,	#00h
	st	r0,	-1[fp]

;;	x -= 1;
CLINEA 0000H 0001H 011AH 0002H 0008H
	add	r8,	#0ffh

;;	y -= 1;
CLINEA 0000H 0001H 011BH 0002H 0008H
	mov	r0,	r1
	add	r0,	#0ffh

;;	if(x >= 0 && x <= 2 && y >= 0 && y <= 2)
CLINEA 0000H 0000H 011CH 0002H 0029H
	cmp	r8,	#02h
	bgt	_$L146
	cmp	r0,	#02h
	bgt	_$L146
CBLOCK 127 3 285

;;		tile = deref(0xD200 + x + (y*0x10));
CLINEA 0000H 0001H 011EH 0003H 0026H
	mov	r1,	#00h
	sllc	r1,	#04h
	sll	r0,	#04h
	mov	er2,	er0
	mov	r0,	r8
	mov	r1,	#00h
	add	er0,	er2
	add	r0,	#00h
	addc	r1,	#0d2h
	mov	r2,	#00h
	l	r0,	r2:[er0]
	st	r0,	-1[fp]
CBLOCKEND 127 3 287

;;	}
CLINEA 0000H 0000H 011FH 0002H 0002H
_$L146 :

;;	return tile;
CLINEA 0000H 0001H 0120H 0002H 000DH
	l	r0,	-1[fp]
CBLOCKEND 127 2 289

;;}
CLINEA 0000H 0000H 0121H 0001H 0001H
	b	__regpopu8lw
CBLOCKEND 127 1 289
CFUNCTIONEND 127


	rseg $$set_tile$main
CFUNCTION 128

_set_tile	:
CBLOCK 128 1 292

;;{
CLINEA 0000H 0001H 0124H 0001H 0001H
	push	xr8
	mov	r10,	r2
CBLOCK 128 2 292
CARGUMENT 46H 0001H 0014H "x" 02H 00H 00H
CARGUMENT 46H 0001H 0015H "y" 02H 00H 00H
CARGUMENT 46H 0001H 001EH "tile" 02H 00H 00H

;;	x -= 1;
CLINEA 0000H 0001H 0125H 0002H 0008H
	add	r0,	#0ffh
	mov	r8,	r0

;;	y -= 1;
CLINEA 0000H 0001H 0126H 0002H 0008H
	mov	r0,	r1
	add	r0,	#0ffh

;;	if(x >= 0 && x <= 2 && y >= 0 && y <= 2)
CLINEA 0000H 0000H 0127H 0002H 0029H
	cmp	r8,	#02h
	bgt	_$L160
	cmp	r0,	#02h
	bgt	_$L160
CBLOCK 128 3 296

;;		deref(0xD200 + x + (y*0x10)) = tile;
CLINEA 0000H 0001H 0129H 0003H 0026H
	mov	r1,	#00h
	sllc	r1,	#04h
	sll	r0,	#04h
	mov	er2,	er0
	mov	r0,	r8
	mov	r1,	#00h
	add	er0,	er2
	add	r0,	#00h
	addc	r1,	#0d2h
	mov	r2,	#00h
	st	r10,	r2:[er0]
CBLOCKEND 128 3 298

;;	}
CLINEA 0000H 0000H 012AH 0002H 0002H
_$L160 :
CBLOCKEND 128 2 299

;;}
CLINEA 0000H 0001H 012BH 0001H 0001H
	pop	xr8
	rt
CBLOCKEND 128 1 299
CFUNCTIONEND 128


	rseg $$main$main
CFUNCTION 129

_main	:
CBLOCK 129 1 303

;;void main() {
CLINEA 0000H 0001H 012FH 0001H 000DH
	mov	fp,	sp
	add	sp,	#-042
CBLOCK 129 2 303
CLOCAL 43H 000CH 000CH 0002H "screen" 05H 01H 0CH 00H 00H 00H
CLOCAL 43H 000EH 001AH 0002H "invalid" 05H 01H 0EH 00H 00H 00H
CLOCAL 42H 0009H 0024H 0002H "board" 08H 01H 03H 00H 01H 03H 00H 00H 00H
CLOCAL 43H 0002H 0026H 0002H "turn" 02H 00H 01H
CLOCAL 43H 0002H 0028H 0002H "gameEnd" 02H 00H 01H
CLOCAL 4BH 0002H 0000H 0002H "l" 02H 00H 01H
CLOCAL 4BH 0002H 0000H 0002H "i" 02H 00H 01H
CLOCAL 42H 0001H 0029H 0002H "player" 02H 00H 00H
CLOCAL 6AH 0003H 0000H 0002H "mem_address" 04H 03H 00H 00H 00H

;;	char screen[] = "Tic Tac Toe";
CLINEA 0000H 0001H 0130H 0002H 001FH
	mov	r0,	#054h
	st	r0,	-12[fp]
	mov	r0,	#069h
	st	r0,	-11[fp]
	mov	r0,	#063h
	st	r0,	-10[fp]
	mov	r0,	#020h
	st	r0,	-9[fp]
	mov	r0,	#054h
	st	r0,	-8[fp]
	mov	r0,	#061h
	st	r0,	-7[fp]
	mov	r0,	#063h
	st	r0,	-6[fp]
	mov	r0,	#020h
	st	r0,	-5[fp]
	mov	r0,	#054h
	st	r0,	-4[fp]
	mov	r0,	#06fh
	st	r0,	-3[fp]
	mov	r0,	#065h
	st	r0,	-2[fp]
	mov	r0,	#00h
	st	r0,	-1[fp]

;;	char invalid[] = "Invalid move.";
CLINEA 0000H 0001H 0131H 0002H 0022H
	mov	r0,	#049h
	st	r0,	-26[fp]
	mov	r0,	#06eh
	st	r0,	-25[fp]
	mov	r0,	#076h
	st	r0,	-24[fp]
	mov	r0,	#061h
	st	r0,	-23[fp]
	mov	r0,	#06ch
	st	r0,	-22[fp]
	mov	r0,	#069h
	st	r0,	-21[fp]
	mov	r0,	#064h
	st	r0,	-20[fp]
	mov	r0,	#020h
	st	r0,	-19[fp]
	mov	r0,	#06dh
	st	r0,	-18[fp]
	mov	r0,	#06fh
	st	r0,	-17[fp]
	mov	r0,	#076h
	st	r0,	-16[fp]
	mov	r0,	#065h
	st	r0,	-15[fp]
	mov	r0,	#02eh
	st	r0,	-14[fp]
	mov	r0,	#00h
	st	r0,	-13[fp]

;;	byte board[3][3] = {{0x00, 0x00, 0x00}, {0x00, 0x00, 0x00}, {0x00, 0x00, 0x00}};
CLINEA 0000H 0001H 0132H 0002H 0051H
	st	r0,	-36[fp]
	st	r0,	-35[fp]
	st	r0,	-34[fp]
	st	r0,	-33[fp]
	st	r0,	-32[fp]
	st	r0,	-31[fp]
	st	r0,	-30[fp]
	st	r0,	-29[fp]
	st	r0,	-28[fp]

;;	int turn = 0;
CLINEA 0000H 0001H 0134H 0002H 000EH
	mov	er0,	#0 
	st	er0,	-38[fp]

;;	int gameEnd = 0;
CLINEA 0000H 0001H 0135H 0002H 0011H
	st	er0,	-40[fp]

;;	byte player = 0x01;
CLINEA 0000H 0001H 0137H 0002H 0014H
	mov	r0,	#01h
	st	r0,	-41[fp]

;;	posx = 1; posy = 1;
CLINEA 0000H 0001H 0139H 0002H 0014H
	st	r0,	FAR _posx
	st	r0,	FAR _posy

;;	memset(0xD000,0x00,0x15D3);
CLINEA 0000H 0001H 013AH 0002H 001CH
	mov	r0,	#0d3h
	mov	r1,	#015h
	push	er0
	mov	er0,	#0 
	push	er0
	mov	r1,	#0d0h
	mov	r2,	#00h
	bl	_memset_f
	add	sp,	#4 

;;	memset(0xf800,0x00,0x800);
CLINEA 0000H 0001H 013BH 0002H 001BH
	mov	r0,	#00h
	mov	r1,	#08h
	push	er0
	mov	er0,	#0 
	push	er0
	mov	r1,	#0f8h
	mov	r2,	#00h
	bl	_memset_f
	add	sp,	#4 

;;	drawbitmap(board1,0x08,0x8,0x3F);
CLINEA 0000H 0001H 0141H 0002H 0022H
	mov	r0,	#03fh
	push	r0
	mov	er0,	#8 
	push	er0
	mov	r3,	#08h
	mov	r0,	#BYTE1 OFFSET _board1
	mov	r1,	#BYTE2 OFFSET _board1
	mov	r2,	#SEG _board1
	bl	_drawbitmap
	add	sp,	#4 

;;	drawstage();
CLINEA 0000H 0001H 0142H 0002H 000DH
	bl	_drawstage

;;	flipcell();
CLINEA 0000H 0001H 0143H 0002H 000CH
	bl	_flipcell

;;	renderRLE(suwa,sizeof(suwa)-1,0x0E,0x0F);
CLINEA 0000H 0001H 0144H 0002H 002AH
	mov	er0,	#15
	push	er0
	mov	er0,	#14
	push	er0
	mov	r0,	#05bh
	mov	r1,	#02h
	push	er0
	mov	r0,	#BYTE1 OFFSET _suwa
	mov	r1,	#BYTE2 OFFSET _suwa
	mov	r2,	#SEG _suwa
	bl	_renderRLE
	add	sp,	#6 

;;	while (!gameEnd) {
CLINEA 0000H 0000H 0145H 0002H 0013H
_$L178 :
CBLOCK 129 3 325
CLOCAL 42H 0001H 002AH 0003H "pressedbutton" 02H 00H 00H

;;		byte pressedbutton = CheckButtons();
CLINEA 0000H 0001H 0147H 0003H 0026H
	bl	_CheckButtons
	st	r0,	-42[fp]

;;		if (pressedbutton != 0xFF){
CLINEA 0000H 0001H 0148H 0003H 001DH
	cmp	r0,	#0ffh
	beq	_$L182
CBLOCK 129 4 328

;;			deref(0xD170) = pressedbutton;
CLINEA 0000H 0001H 0149H 0004H 0021H
	st	r0,	00h:0d170h
CBLOCKEND 129 4 330

;;		}
CLINEA 0000H 0000H 014AH 0003H 0003H
_$L182 :

;;		switch (pressedbutton) {
CLINEA 0000H 0001H 014BH 0003H 001AH
CBLOCK 129 5 331
	cmp	r0,	#0fh
	bne	_$M21
	b	_$L194
_$M21 :

;;		switch (pressedbutton) {
CLINEA 0000H 0000H 014BH 0003H 001AH
	cmp	r0,	#020h
	beq	_$L190

;;		switch (pressedbutton) {
CLINEA 0000H 0000H 014BH 0003H 001AH
	cmp	r0,	#021h
	bne	_$M22
	b	_$L193
_$M22 :

;;		switch (pressedbutton) {
CLINEA 0000H 0000H 014BH 0003H 001AH
	cmp	r0,	#028h
	bne	_$M23
	b	_$L192
_$M23 :

;;		switch (pressedbutton) {
CLINEA 0000H 0000H 014BH 0003H 001AH
	cmp	r0,	#029h
	beq	_$L191

;;		switch (pressedbutton) {
CLINEA 0000H 0000H 014BH 0003H 001AH
	cmp	r0,	#0ffh
	beq	_$L189

;;		}
CLINEA 0000H 0000H 0192H 0003H 0003H
_$L187 :
CBLOCKEND 129 3 404

;;	while (!gameEnd) {
CLINEA 0000H 0000H 0145H 0022H 002EH
	l	er0,	-40[fp]
	beq	_$L178

;;	renderRLE(playerx,sizeof(playerx)-1,22,24);
CLINEA 0000H 0001H 0196H 0002H 002CH
	mov	er0,	#24
	push	er0
	mov	er0,	#22
	push	er0
	mov	r0,	#0dah
	mov	r1,	#01h
	push	er0
	mov	r0,	#BYTE1 OFFSET _playerx
	mov	r1,	#BYTE2 OFFSET _playerx
	mov	r2,	#SEG _playerx
	bl	_renderRLE
	add	sp,	#6 

;;	render_rect(22,24,22+148,24+14,0,1);
CLINEA 0000H 0001H 0197H 0002H 0025H
	mov	r0,	#01h
	push	r0
	mov	r0,	#00h
	push	r0
	mov	er0,	#38
	push	er0
	mov	r0,	#0aah
	push	er0
	mov	er2,	#24
	mov	er0,	#22
	bl	_render_rect
	add	sp,	#8 
CBLOCKEND 129 2 408

;;}
CLINEA 0000H 0001H 0198H 0001H 0001H
_$$end_of_main :
	bal	$

;;			case 0xFF:
CLINEA 0000H 0001H 014CH 0004H 000DH
_$L189 :

;;				delay(100);
CLINEA 0000H 0001H 014DH 0005H 000FH
	mov	r0,	#064h
	mov	r1,	#00h
	bl	_delay

;;				break;
CLINEA 0000H 0001H 014EH 0005H 000AH
	bal	_$L187

;;			case SP_RIGHT:
CLINEA 0000H 0001H 014FH 0004H 0011H
_$L190 :

;;				drawbitmap(board1,0x08,0x8,0x3F);
CLINEA 0000H 0001H 0150H 0005H 0025H
	mov	r0,	#03fh
	push	r0
	mov	er0,	#8 
	push	er0
	mov	r3,	#08h
	mov	r0,	#BYTE1 OFFSET _board1
	mov	r1,	#BYTE2 OFFSET _board1
	mov	r2,	#SEG _board1
	bl	_drawbitmap
	add	sp,	#4 

;;				posx++;
CLINEA 0000H 0000H 0151H 0005H 000BH
	lea	OFFSET _posx
	inc	seg _posx:[ea]

;;				drawstage();
CLINEA 0000H 0001H 0152H 0005H 0010H
	bl	_drawstage

;;				flipcell();
CLINEA 0000H 0001H 0153H 0005H 000FH
	bl	_flipcell

;;				break;
CLINEA 0000H 0001H 0154H 0005H 000AH
	bal	_$L187

;;			case SP_LEFT:
CLINEA 0000H 0001H 0155H 0004H 0010H
_$L191 :

;;				drawbitmap(board1,0x08,0x8,0x3F);
CLINEA 0000H 0001H 0156H 0005H 0025H
	mov	r0,	#03fh
	push	r0
	mov	er0,	#8 
	push	er0
	mov	r3,	#08h
	mov	r0,	#BYTE1 OFFSET _board1
	mov	r1,	#BYTE2 OFFSET _board1
	mov	r2,	#SEG _board1
	bl	_drawbitmap
	add	sp,	#4 

;;				posx--;
CLINEA 0000H 0000H 0157H 0005H 000BH
	lea	OFFSET _posx
	dec	seg _posx:[ea]

;;				drawstage();
CLINEA 0000H 0001H 0158H 0005H 0010H
	bl	_drawstage

;;				flipcell();
CLINEA 0000H 0001H 0159H 0005H 000FH
	bl	_flipcell

;;				break;
CLINEA 0000H 0001H 015AH 0005H 000AH
	b	_$L187

;;			case SP_UP:
CLINEA 0000H 0001H 015BH 0004H 000EH
_$L192 :

;;				drawbitmap(board1,0x08,0x8,0x3F);
CLINEA 0000H 0001H 015CH 0005H 0025H
	mov	r0,	#03fh
	push	r0
	mov	er0,	#8 
	push	er0
	mov	r3,	#08h
	mov	r0,	#BYTE1 OFFSET _board1
	mov	r1,	#BYTE2 OFFSET _board1
	mov	r2,	#SEG _board1
	bl	_drawbitmap
	add	sp,	#4 

;;				posy--;
CLINEA 0000H 0000H 015DH 0005H 000BH
	lea	OFFSET _posy
	dec	seg _posy:[ea]

;;				drawstage();
CLINEA 0000H 0001H 015EH 0005H 0010H
	bl	_drawstage

;;				flipcell();
CLINEA 0000H 0001H 015FH 0005H 000FH
	bl	_flipcell

;;				break;
CLINEA 0000H 0001H 0160H 0005H 000AH
	b	_$L187

;;			case SP_DOWN:
CLINEA 0000H 0001H 0161H 0004H 0010H
_$L193 :

;;				drawbitmap(board1,0x08,0x8,0x3F);
CLINEA 0000H 0001H 0162H 0005H 0025H
	mov	r0,	#03fh
	push	r0
	mov	er0,	#8 
	push	er0
	mov	r3,	#08h
	mov	r0,	#BYTE1 OFFSET _board1
	mov	r1,	#BYTE2 OFFSET _board1
	mov	r2,	#SEG _board1
	bl	_drawbitmap
	add	sp,	#4 

;;				posy++;
CLINEA 0000H 0000H 0163H 0005H 000BH
	lea	OFFSET _posy
	inc	seg _posy:[ea]

;;				drawstage();
CLINEA 0000H 0001H 0164H 0005H 0010H
	bl	_drawstage

;;				flipcell();
CLINEA 0000H 0001H 0165H 0005H 000FH
	bl	_flipcell

;;				break;
CLINEA 0000H 0001H 0166H 0005H 000AH
	b	_$L187

;;			case SP_EQU:
CLINEA 0000H 0001H 0168H 0004H 000FH
_$L194 :

;;				if (get_tile(posx,posy) != 0x00) {
CLINEA 0000H 0001H 0169H 0005H 0026H
	l	r1,	FAR _posy
	l	r0,	FAR _posx
	bl	_get_tile
	cmp	r0,	#00h
	beq	_$L195
CBLOCK 129 6 361

;;					deref(0xD180) = 0x40;
CLINEA 0000H 0001H 016BH 0006H 001AH
	mov	r0,	#040h
	st	r0,	00h:0d180h
CBLOCKEND 129 6 366
	b	_$L203
_$L195 :

;;				} else {
CLINEA 0000H 0000H 016EH 0005H 000CH
CBLOCK 129 7 366

;;					deref(0xD185) = posx;
CLINEA 0000H 0001H 016FH 0006H 001AH
	l	r0,	FAR _posx
	st	r0,	00h:0d185h

;;					deref(0xD186) = posy;
CLINEA 0000H 0001H 0170H 0006H 001AH
	l	r0,	FAR _posy
	st	r0,	00h:0d186h

;;					set_tile(posx, posy, player);
CLINEA 0000H 0001H 0171H 0006H 0022H
	l	r2,	-41[fp]
	l	r1,	FAR _posy
	l	r0,	FAR _posx
	bl	_set_tile

;;					deref(0xD180) = 0x00;
CLINEA 0000H 0001H 0172H 0006H 001AH
	mov	r0,	#00h
	st	r0,	00h:0d180h

;;					deref(0xD270) = player;
CLINEA 0000H 0001H 0173H 0006H 001CH
	l	r0,	-41[fp]
	st	r0,	00h:0d270h

;;					drawstage();
CLINEA 0000H 0001H 0174H 0006H 0011H
	bl	_drawstage

;;					flipcell();
CLINEA 0000H 0001H 0175H 0006H 0010H
	bl	_flipcell

;;					if (checkWin(player) == 0x01) {
CLINEA 0000H 0001H 0178H 0006H 0024H
	l	r0,	-41[fp]
	mov	r1,	#00h
	bl	_checkWin
	cmp	r0,	#01h
	cmpc	r1,	#00h
	bne	_$L198
CBLOCK 129 8 376

;;						drawstage(); //Later
CLINEA 0000H 0001H 017AH 0007H 001AH
	bl	_drawstage

;;						flipcell();
CLINEA 0000H 0001H 017BH 0007H 0011H
	bl	_flipcell

;;						deref(0xD180) = 0x69;
CLINEA 0000H 0001H 017CH 0007H 001BH
	mov	r0,	#069h
	st	r0,	00h:0d180h

;;						gameEnd = 1;
CLINEA 0000H 0001H 017DH 0007H 0012H
	mov	er0,	#1 
	st	er0,	-40[fp]

;;						break;
CLINEA 0000H 0001H 017EH 0007H 000CH
	b	_$L187
CBLOCKEND 129 8 383

;;					}
CLINEA 0000H 0000H 017FH 0006H 0006H
_$L198 :

;;					player = ( player == 0x01 ) ? 0x02 : 0x01;
CLINEA 0000H 0000H 0184H 0006H 002FH
	l	r0,	-41[fp]
	cmp	r0,	#01h
	bne	_$L200
	mov	er0,	#2 
	bal	_$L202
_$L200 :
	mov	er0,	#1 
_$L202 :
	st	r0,	-41[fp]

;;					turn += 1;
CLINEA 0000H 0001H 0185H 0006H 000FH
	l	er0,	-38[fp]
	add	er0,	#1 
	st	er0,	-38[fp]

;;				        && checkWin(0x02) == 0) {
CLINEA 0000H 0000H 0187H 000DH 0025H
	cmp	r0,	#09h
	cmpc	r1,	#00h
	bne	_$L203

;;				    if (turn == 9 && checkWin(0x01) == 0
CLINEA 0000H 0001H 0186H 0009H 002CH
	mov	er0,	#1 
	bl	_checkWin

;;				        && checkWin(0x02) == 0) {
CLINEA 0000H 0000H 0187H 000DH 0025H
	mov	er0,	er0
	bne	_$L203
	mov	er0,	#2 
	bl	_checkWin
	mov	er0,	er0
	bne	_$L203
CBLOCK 129 9 391

;;				    	deref(0xD180) = 0xFF;
CLINEA 0000H 0001H 0189H 000AH 001EH
	mov	r0,	#0ffh
	st	r0,	00h:0d180h

;;				    	gameEnd = 1;
CLINEA 0000H 0001H 018AH 000AH 0015H
	mov	er0,	#1 
	st	er0,	-40[fp]
CBLOCKEND 129 9 395

;;				    }
CLINEA 0000H 0000H 018BH 0009H 0009H
_$L203 :
CBLOCKEND 129 7 398

;;				delay(100);
CLINEA 0000H 0001H 018FH 0005H 000FH
	mov	r0,	#064h
	mov	r1,	#00h
	bl	_delay

;;				break;
CLINEA 0000H 0001H 0190H 0005H 000AH
	b	_$L187
CBLOCKEND 129 5 402
CBLOCKEND 129 1 408
CFUNCTIONEND 129


	rseg $$flipcell$main
CFUNCTION 133

_flipcell	:
CBLOCK 133 1 411

;;void flipcell(){
CLINEA 0000H 0001H 019BH 0001H 0010H
	push	lr
	push	xr4
CBLOCK 133 2 411
CRET 0004H

;;	render_rect(45 + posx * 20, 1 + (posy - 1) * 21, 66 + posx*20, 20 + (posy-1) * 21, 1, 1);
CLINEA 0000H 0001H 019CH 0002H 005AH
	mov	r0,	#01h
	push	r0
	push	r0
	l	r0,	FAR _posy
	mov	r1,	#00h
	add	er0,	#-1
	mov	er2,	#21
	bl	__imulu8lw
	mov	er4,	er0
	add	er0,	#20
	push	er0
	l	r0,	FAR _posx
	mov	r1,	#00h
	mov	er2,	#20
	bl	__imulu8lw
	mov	er6,	er0
	add	r0,	#042h
	addc	r1,	#00h
	push	er0
	add	er4,	#1 
	mov	er2,	er4
	add	er6,	#45
	mov	er0,	er6
	bl	_render_rect
	add	sp,	#8 
CBLOCKEND 133 2 413

;;}
CLINEA 0000H 0001H 019DH 0001H 0001H
	pop	xr4
	pop	pc
CBLOCKEND 133 1 413
CFUNCTIONEND 133


	rseg $$drawstage$main
CFUNCTION 134

_drawstage	:
CBLOCK 134 1 416

;;void drawstage(){
CLINEA 0000H 0001H 01A0H 0001H 0011H
	push	lr
	bl	__regpushu8lw
	add	sp,	#-04
CBLOCK 134 2 416
CRET 0010H
CLOCAL 43H 0002H 0002H 0002H "i" 02H 00H 01H
CLOCAL 43H 0002H 0004H 0002H "j" 02H 00H 01H

;;	if (posx > 3) {
CLINEA 0000H 0001H 01A2H 0002H 0010H
	l	r0,	FAR _posx
	cmp	r0,	#03h
	ble	_$L215
CBLOCK 134 3 418

;;		posx = 1;
CLINEA 0000H 0001H 01A3H 0003H 000BH
	mov	r0,	#01h
	st	r0,	FAR _posx
CBLOCKEND 134 3 420
	bal	_$L218
_$L215 :

;;	} else if (posx < 1) {
CLINEA 0000H 0000H 01A4H 0002H 0017H
	cmp	r0,	#01h
	bge	_$L218
CBLOCK 134 4 420

;;		posx = 3;
CLINEA 0000H 0001H 01A5H 0003H 000BH
	mov	r0,	#03h
	st	r0,	FAR _posx
CBLOCKEND 134 4 422

;;	}
CLINEA 0000H 0000H 01A6H 0002H 0002H
_$L218 :

;;	if (posy > 3) {
CLINEA 0000H 0001H 01A7H 0002H 0010H
	l	r0,	FAR _posy
	cmp	r0,	#03h
	ble	_$L220
CBLOCK 134 5 423

;;		posy = 1;
CLINEA 0000H 0001H 01A8H 0003H 000BH
	mov	r0,	#01h
	st	r0,	FAR _posy
CBLOCKEND 134 5 425
	bal	_$L223
_$L220 :

;;	} else if (posy < 1) {
CLINEA 0000H 0000H 01A9H 0002H 0017H
	cmp	r0,	#01h
	bge	_$L223
CBLOCK 134 6 425

;;		posy = 3;
CLINEA 0000H 0001H 01AAH 0003H 000BH
	mov	r0,	#03h
	st	r0,	FAR _posy
CBLOCKEND 134 6 427

;;	}
CLINEA 0000H 0000H 01ABH 0002H 0002H
_$L223 :

;;    for (i = 0; i < 3; i++) {
CLINEA 0000H 0001H 01ACH 000AH 000FH
	mov	er0,	#0 
	st	er0,	-2[fp]

;;    for (i = 0; i < 3; i++) {
CLINEA 0000H 0000H 01ACH 0018H 001AH
_$L227 :
CBLOCK 134 7 428

;;        for (j = 0; j < 3; j++) {
CLINEA 0000H 0001H 01ADH 000EH 0013H
	mov	er0,	#0 
	st	er0,	-4[fp]

;;        for (j = 0; j < 3; j++) {
CLINEA 0000H 0000H 01ADH 001CH 001EH
_$L233 :
CBLOCK 134 8 429

;;        	if (get_tile(i+1,j+1) == 0x01) {
CLINEA 0000H 0000H 01AEH 0000H 0000H
	l	er0,	-4[fp]
	add	er0,	#1 
	mov	er4,	er0

;;        	if (get_tile(i+1,j+1) == 0x01) {
CLINEA 0000H 0001H 01AEH 000AH 0029H
	mov	r1,	r0
	l	er2,	-2[fp]
	add	er2,	#1 
	mov	er6,	er2
	mov	r0,	r2
	bl	_get_tile
	cmp	r0,	#01h
	bne	_$L237
CBLOCK 134 9 430

;;        		renderRLE(cross, sizeof(cross), 66 + (i) * 20 + (i), 2 + (j) * 21 );
CLINEA 0000H 0001H 01AFH 000BH 004EH
	l	er0,	-4[fp]
	mov	er2,	#21
	bl	__imulu8lw
	add	er0,	#2 
	push	er0
	l	er0,	-2[fp]
	mov	er2,	#20
	bl	__imulu8lw
	l	er2,	-2[fp]
	add	er0,	er2
	add	r0,	#042h
	addc	r1,	#00h
	push	er0
	mov	r0,	#06fh
	mov	r1,	#00h
	push	er0
	mov	r0,	#BYTE1 OFFSET _cross
	mov	r1,	#BYTE2 OFFSET _cross
	mov	r2,	#SEG _cross
	bl	_renderRLE
	add	sp,	#6 
CBLOCKEND 134 9 432
	bal	_$L240
_$L237 :

;;        	} else if (get_tile(i+1,j+1) == 0x02) {
CLINEA 0000H 0000H 01B0H 000AH 0030H
	mov	r1,	r4
	mov	r0,	r6
	bl	_get_tile
	cmp	r0,	#02h
	bne	_$L240
CBLOCK 134 10 432

;;        		renderRLE(circle, sizeof(circle), 66 + (i) * 20 + (i), 2 + (j) * 21 );
CLINEA 0000H 0001H 01B1H 000BH 0050H
	l	er0,	-4[fp]
	mov	er2,	#21
	bl	__imulu8lw
	add	er0,	#2 
	push	er0
	l	er0,	-2[fp]
	mov	er2,	#20
	bl	__imulu8lw
	l	er2,	-2[fp]
	add	er0,	er2
	add	r0,	#042h
	addc	r1,	#00h
	push	er0
	mov	r0,	#064h
	mov	r1,	#00h
	push	er0
	mov	r0,	#BYTE1 OFFSET _circle
	mov	r1,	#BYTE2 OFFSET _circle
	mov	r2,	#SEG _circle
	bl	_renderRLE
	add	sp,	#6 
CBLOCKEND 134 10 434

;;        	}
CLINEA 0000H 0000H 01B2H 000AH 000AH
_$L240 :
CBLOCKEND 134 8 435

;;        for (j = 0; j < 3; j++) {
CLINEA 0000H 0000H 01ADH 001CH 001EH
	st	er4,	-4[fp]

;;        for (j = 0; j < 3; j++) {
CLINEA 0000H 0000H 01ADH 0015H 001AH
	cmp	r4,	#03h
	cmpc	r5,	#00h
	bges	_$M26
	b	_$L233
_$M26 :
CBLOCKEND 134 7 436

;;    for (i = 0; i < 3; i++) {
CLINEA 0000H 0000H 01ACH 0018H 001AH
	st	er6,	-2[fp]

;;    for (i = 0; i < 3; i++) {
CLINEA 0000H 0000H 01ACH 0015H 001AH
	cmp	r6,	#03h
	cmpc	r7,	#00h
	bges	_$M27
	b	_$L227
_$M27 :

;;	delay(400);
CLINEA 0000H 0001H 01B5H 0002H 000CH
	mov	r0,	#090h
	mov	r1,	#01h
	bl	_delay
CBLOCKEND 134 2 439

;;}
CLINEA 0000H 0001H 01B7H 0001H 0001H
	b	__regpopu8lw
CBLOCKEND 134 1 439
CFUNCTIONEND 134


	rseg $$checkWin$main
CFUNCTION 135

_checkWin	:
CBLOCK 135 1 442

;;{
CLINEA 0000H 0001H 01BAH 0001H 0001H
	push	lr
	bl	__regpushu8lw
	add	sp,	#-02
	mov	r8,	r0
CBLOCK 135 2 442
CRET 000EH
CARGUMENT 46H 0001H 001CH "player" 02H 00H 00H
CLOCAL 43H 0002H 0002H 0002H "i" 02H 00H 01H
CLOCAL 4BH 0002H 0000H 0002H "state" 02H 00H 01H

;;    deref(0xD271) = player;
CLINEA 0000H 0001H 01BFH 0005H 001BH
	st	r0,	00h:0d271h

;;	for (i = 1; i < 4; i++) {
CLINEA 0000H 0001H 01C0H 0002H 001AH
	mov	er0,	#1 
	st	er0,	-2[fp]
_$L245 :
CBLOCK 135 3 448

;;        if (get_tile(i,1) == player && get_tile(i,2) == player
CLINEA 0000H 0001H 01C1H 0009H 003EH
	mov	r1,	#01h
	l	r0,	-2[fp]
	bl	_get_tile

;;            && get_tile(i,3) == player) {
CLINEA 0000H 0000H 01C2H 000DH 0029H
	cmp	r8,	r0
	bne	_$L249

;;        if (get_tile(i,1) == player && get_tile(i,2) == player
CLINEA 0000H 0000H 01C1H 0009H 003EH
	mov	r1,	#02h
	l	r0,	-2[fp]
	bl	_get_tile

;;            && get_tile(i,3) == player) {
CLINEA 0000H 0000H 01C2H 000DH 0029H
	cmp	r8,	r0
	bne	_$L249
	mov	r1,	#03h
	l	r0,	-2[fp]
	bl	_get_tile
	cmp	r8,	r0
	bne	_$L249
CBLOCK 135 4 450

;;        	deref(0xD181) = 0x01;
CLINEA 0000H 0001H 01C3H 000AH 001EH
	mov	r0,	#01h
	st	r0,	00h:0d181h

;;        	return state;
CLINEA 0000H 0001H 01C5H 000AH 0016H
	mov	er0,	#1 
CBLOCKEND 135 4 454
CBLOCKEND 135 2 476

;;}
CLINEA 0000H 0001H 01DCH 0001H 0001H
_$L242 :
	b	__regpopu8lw

;;        }
CLINEA 0000H 0000H 01C6H 0009H 0009H
_$L249 :

;;        if (get_tile(1,i) == player && get_tile(2,i) == player
CLINEA 0000H 0001H 01C7H 0009H 003EH
	l	r1,	-2[fp]
	mov	r0,	#01h
	bl	_get_tile

;;            && get_tile(3,i) == player) {
CLINEA 0000H 0000H 01C8H 000DH 0029H
	cmp	r8,	r0
	bne	_$L259

;;        if (get_tile(1,i) == player && get_tile(2,i) == player
CLINEA 0000H 0000H 01C7H 0009H 003EH
	l	r1,	-2[fp]
	mov	r0,	#02h
	bl	_get_tile

;;            && get_tile(3,i) == player) {
CLINEA 0000H 0000H 01C8H 000DH 0029H
	cmp	r8,	r0
	bne	_$L259
	l	r1,	-2[fp]
	mov	r0,	#03h
	bl	_get_tile
	cmp	r8,	r0
	bne	_$L259
CBLOCK 135 5 456

;;        	deref(0xD181) = 0x02;
CLINEA 0000H 0001H 01C9H 000AH 001EH
	mov	r0,	#02h
	st	r0,	00h:0d181h

;;        	return state;
CLINEA 0000H 0001H 01CBH 000AH 0016H
	mov	er0,	#1 
	bal	_$L242
CBLOCKEND 135 5 460

;;        }
CLINEA 0000H 0000H 01CCH 0009H 0009H
_$L259 :
CBLOCKEND 135 3 461

;;	for (i = 1; i < 4; i++) {
CLINEA 0000H 0000H 01C0H 0002H 001AH
	l	er0,	-2[fp]
	add	er0,	#1 
	st	er0,	-2[fp]

;;	for (i = 1; i < 4; i++) {
CLINEA 0000H 0000H 01C0H 0015H 001AH
	cmp	r0,	#04h
	cmpc	r1,	#00h
	blts	_$L245

;;    if (get_tile(1,1) == player && get_tile(2,2) == player
CLINEA 0000H 0001H 01CEH 0005H 003AH
	mov	r1,	#01h
	mov	r0,	#01h
	bl	_get_tile

;;        && get_tile(3,3) == player) {
CLINEA 0000H 0000H 01CFH 0009H 0025H
	cmp	r8,	r0
	bne	_$L269

;;    if (get_tile(1,1) == player && get_tile(2,2) == player
CLINEA 0000H 0000H 01CEH 0005H 003AH
	mov	r1,	#02h
	mov	r0,	#02h
	bl	_get_tile

;;        && get_tile(3,3) == player) {
CLINEA 0000H 0000H 01CFH 0009H 0025H
	cmp	r8,	r0
	bne	_$L269
	mov	r1,	#03h
	mov	r0,	#03h
	bl	_get_tile
	cmp	r8,	r0
	bne	_$L269
CBLOCK 135 6 463

;;    	deref(0xD181) = 0x03;
CLINEA 0000H 0001H 01D0H 0006H 001AH
	mov	r0,	#03h
	st	r0,	00h:0d181h

;;    	return state;
CLINEA 0000H 0001H 01D2H 0006H 0012H
	mov	er0,	#1 
	bal	_$L242
CBLOCKEND 135 6 467

;;    }
CLINEA 0000H 0000H 01D3H 0005H 0005H
_$L269 :

;;    if (get_tile(1,3) == player && get_tile(2,2) == player
CLINEA 0000H 0001H 01D4H 0005H 003AH
	mov	r1,	#03h
	mov	r0,	#01h
	bl	_get_tile

;;        && get_tile(3,1) == player) {
CLINEA 0000H 0000H 01D5H 0009H 0025H
	cmp	r8,	r0
	bne	_$L279

;;    if (get_tile(1,3) == player && get_tile(2,2) == player
CLINEA 0000H 0000H 01D4H 0005H 003AH
	mov	r1,	#02h
	mov	r0,	#02h
	bl	_get_tile

;;        && get_tile(3,1) == player) {
CLINEA 0000H 0000H 01D5H 0009H 0025H
	cmp	r8,	r0
	bne	_$L279
	mov	r1,	#01h
	mov	r0,	#03h
	bl	_get_tile
	cmp	r8,	r0
	bne	_$L279
CBLOCK 135 7 469

;;    	deref(0xD181) = 0x04;
CLINEA 0000H 0001H 01D6H 0006H 001AH
	mov	r0,	#04h
	st	r0,	00h:0d181h

;;    	return state;
CLINEA 0000H 0001H 01D8H 0006H 0012H
	mov	er0,	#1 
	b	_$L242
CBLOCKEND 135 7 473

;;    }
CLINEA 0000H 0000H 01D9H 0005H 0005H
_$L279 :

;;    return state;
CLINEA 0000H 0001H 01DBH 0005H 0011H
	mov	er0,	#0 
	b	_$L242
CBLOCKEND 135 1 476
CFUNCTIONEND 135

	public _board1
	public _PrintWord
	public _cross
	public _CheckButtons
	public _image_raw
	public _circle
	public _lastbutton
	public _printdwordbuf
	public _checkWin
	public _main
	public _drawstage
	public _invert_line
	public _drawbitmap
	public _posx
	public _print
	public _posy
	public _delay
	public _suwa
	public _invertbitmap
	public _set_bits
	public _get_tile
	public _set_tile
	public _playerx
	public _playery
	public _flipcell
	public _renderRLE
	public _render_rect
	_oldx comm data 01h ANY
	_oldy comm data 01h ANY
	extrn code far : _memset_f
	extrn code : $$start_up

	cseg #00h at 02h
	dw	$$start_up

	rseg $$init_info
	dw $$FINITTABmain
	dw $$FINITVARmain
	dw size $$FINITTABmain
	db seg $$FINITTABmain
	db seg $$FINITVARmain

	rseg $$FINITTABmain
	DB	"\x00\x00\x00\x00", 00H
	db	00h
	db	00h
	db	0ffh

	rseg $$TABsuwa$main
_suwa :
	db	00h
	db	014h
	db	03h
	db	0ch
	db	0ffh
	db	00h
	db	013h
	db	01h
	db	01h
	db	01h
	db	01h
	db	01h
	db	0bh
	db	0ffh
	db	00h
	db	0dh
	db	08h
	db	01h
	db	01h
	db	0ch
	db	0ffh
	db	00h
	db	05h
	db	02h
	db	03h
	db	03h
	db	08h
	db	03h
	db	0bh
	db	0ffh
	db	00h
	db	04h
	db	01h
	db	02h
	db	01h
	db	01h
	db	01h
	db	01h
	db	01h
	db	0ah
	db	01h
	db	0ch
	db	0ffh
	db	00h
	db	05h
	db	02h
	db	01h
	db	02h
	db	0dh
	db	01h
	db	0bh
	db	0ffh
	db	00h
	db	05h
	db	02h
	db	01h
	db	01h
	db	0fh
	db	01h
	db	0ah
	db	0ffh
	db	00h
	db	04h
	db	01h
	db	02h
	db	01h
	db	0bh
	db	07h
	db	09h
	db	0ffh
	db	00h
	db	05h
	db	02h
	db	01h
	db	01h
	db	07h
	db	03h
	db	07h
	db	01h
	db	08h
	db	0ffh
	db	00h
	db	05h
	db	01h
	db	01h
	db	01h
	db	01h
	db	01h
	db	03h
	db	03h
	db	04h
	db	0ch
	db	03h
	db	0ffh
	db	00h
	db	05h
	db	02h
	db	01h
	db	01h
	db	01h
	db	03h
	db	03h
	db	04h
	db	06h
	db	01h
	db	05h
	db	02h
	db	01h
	db	0ffh
	db	00h
	db	05h
	db	01h
	db	01h
	db	03h
	db	03h
	db	03h
	db	0bh
	db	01h
	db	05h
	db	02h
	db	0ffh
	db	00h
	db	05h
	db	03h
	db	02h
	db	03h
	db	04h
	db	02h
	db	01h
	db	03h
	db	04h
	db	01h
	db	04h
	db	01h
	db	01h
	db	01h
	db	0ffh
	db	00h
	db	04h
	db	02h
	db	02h
	db	02h
	db	03h
	db	04h
	db	02h
	db	01h
	db	03h
	db	01h
	db	04h
	db	01h
	db	03h
	db	01h
	db	01h
	db	01h
	db	0ffh
	db	00h
	db	04h
	db	04h
	db	04h
	db	01h
	db	03h
	db	01h
	db	03h
	db	01h
	db	07h
	db	01h
	db	03h
	db	02h
	db	01h
	db	0ffh
	db	00h
	db	04h
	db	02h
	db	01h
	db	01h
	db	03h
	db	01h
	db	03h
	db	02h
	db	03h
	db	02h
	db	06h
	db	01h
	db	02h
	db	01h
	db	01h
	db	01h
	db	01h
	db	0ffh
	db	00h
	db	03h
	db	01h
	db	03h
	db	01h
	db	05h
	db	03h
	db	03h
	db	02h
	db	01h
	db	01h
	db	06h
	db	02h
	db	01h
	db	01h
	db	02h
	db	0ffh
	db	00h
	db	02h
	db	02h
	db	02h
	db	01h
	db	05h
	db	03h
	db	05h
	db	01h
	db	01h
	db	01h
	db	01h
	db	01h
	db	04h
	db	01h
	db	01h
	db	01h
	db	03h
	db	0ffh
	db	00h
	db	02h
	db	01h
	db	02h
	db	04h
	db	03h
	db	03h
	db	07h
	db	01h
	db	07h
	db	01h
	db	04h
	db	0ffh
	db	00h
	db	01h
	db	01h
	db	03h
	db	02h
	db	01h
	db	01h
	db	02h
	db	02h
	db	07h
	db	01h
	db	02h
	db	02h
	db	03h
	db	02h
	db	05h
	db	0ffh
	db	00h
	db	01h
	db	01h
	db	03h
	db	02h
	db	01h
	db	01h
	db	03h
	db	03h
	db	07h
	db	01h
	db	04h
	db	02h
	db	06h
	db	0ffh
	db	00h
	db	01h
	db	01h
	db	03h
	db	02h
	db	02h
	db	01h
	db	01h
	db	01h
	db	0ah
	db	01h
	db	01h
	db	01h
	db	02h
	db	01h
	db	07h
	db	0ffh
	db	00h
	db	02h
	db	01h
	db	02h
	db	01h
	db	04h
	db	01h
	db	01h
	db	01h
	db	08h
	db	02h
	db	03h
	db	01h
	db	08h
	db	0ffh
	db	00h
	db	03h
	db	01h
	db	01h
	db	03h
	db	03h
	db	03h
	db	03h
	db	01h
	db	02h
	db	03h
	db	01h
	db	02h
	db	09h
	db	0ffh
	db	00h
	db	04h
	db	02h
	db	01h
	db	01h
	db	03h
	db	01h
	db	02h
	db	01h
	db	03h
	db	04h
	db	02h
	db	01h
	db	0ah
	db	0ffh
	db	00h
	db	06h
	db	01h
	db	01h
	db	01h
	db	03h
	db	02h
	db	01h
	db	03h
	db	01h
	db	03h
	db	02h
	db	01h
	db	0ah
	db	0ffh
	db	00h
	db	09h
	db	01h
	db	01h
	db	01h
	db	03h
	db	01h
	db	01h
	db	01h
	db	03h
	db	01h
	db	02h
	db	01h
	db	0ah
	db	0ffh
	db	00h
	db	0ah
	db	01h
	db	01h
	db	02h
	db	02h
	db	07h
	db	01h
	db	01h
	db	0ah
	db	0ffh
	db	00h
	db	0ah
	db	01h
	db	02h
	db	02h
	db	01h
	db	01h
	db	03h
	db	03h
	db	01h
	db	01h
	db	0ah
	db	0ffh
	db	00h
	db	0bh
	db	01h
	db	03h
	db	01h
	db	04h
	db	01h
	db	01h
	db	01h
	db	0ch
	db	0ffh
	db	00h
	db	0ah
	db	02h
	db	08h
	db	01h
	db	01h
	db	01h
	db	0ch
	db	0ffh
	db	00h
	db	0ah
	db	01h
	db	08h
	db	02h
	db	01h
	db	03h
	db	0ah
	db	0ffh
	db	00h
	db	09h
	db	01h
	db	02h
	db	01h
	db	03h
	db	05h
	db	01h
	db	01h
	db	02h
	db	01h
	db	09h
	db	0ffh
	db	00h
	db	09h
	db	01h
	db	02h
	db	01h
	db	01h
	db	02h
	db	04h
	db	01h
	db	01h
	db	01h
	db	02h
	db	01h
	db	09h
	db	0ffh
	db	00h
	db	0ah
	db	01h
	db	01h
	db	02h
	db	02h
	db	01h
	db	03h
	db	01h
	db	01h
	db	01h
	db	02h
	db	01h
	db	09h
	db	0ffh
	db	00h
	db	09h
	db	01h
	db	01h
	db	01h
	db	03h
	db	01h
	db	04h
	db	01h
	db	01h
	db	01h
	db	01h
	db	01h
	db	0ah
	db	0ffh
	db	00h
	db	09h
	db	01h
	db	01h
	db	01h
	db	02h
	db	01h
	db	04h
	db	01h
	db	03h
	db	02h
	db	0ah
	db	0ffh
	db	00h
	db	08h
	db	01h
	db	01h
	db	01h
	db	01h
	db	01h
	db	01h
	db	01h
	db	04h
	db	01h
	db	03h
	db	02h
	db	0ah
	db	0ffh
	db	00h
	db	08h
	db	01h
	db	01h
	db	01h
	db	01h
	db	01h
	db	05h
	db	01h
	db	04h
	db	02h
	db	0ah
	db	0ffh
	db	00h
	db	07h
	db	02h
	db	01h
	db	01h
	db	02h
	db	01h
	db	04h
	db	02h
	db	04h
	db	01h
	db	0ah
	db	0ffh
	db	00h
	db	07h
	db	02h
	db	02h
	db	01h
	db	05h
	db	01h
	db	02h
	db	01h
	db	04h
	db	01h
	db	09h
	db	0ffh
	db	00h
	db	05h
	db	02h
	db	01h
	db	01h
	db	02h
	db	02h
	db	04h
	db	01h
	db	03h
	db	01h
	db	02h
	db	02h
	db	09h
	db	0ffh
	db	00h
	db	05h
	db	01h
	db	04h
	db	01h
	db	01h
	db	01h
	db	01h
	db	01h
	db	01h
	db	02h
	db	03h
	db	03h
	db	0bh
	db	0ffh
	db	00h
	db	04h
	db	01h
	db	06h
	db	03h
	db	03h
	db	01h
	db	02h
	db	02h
	db	02h
	db	01h
	db	0ah
	db	0ffh
	db	00h
	db	05h
	db	08h
	db	01h
	db	05h
	db	03h
	db	02h
	db	0bh
	db	0ffh
	db	00h
	db	0dh
	db	01h
	db	03h
	db	05h
	db	0dh
	db	0ffh
	db	00h
	db	0eh
	db	04h
	db	011h
	db	0ffh

	rseg $$TABimage_raw$main
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

	rseg $$TABboard1$main
_board1 :
	db	0ffh
	db	0ffh
	db	0ffh
	db	0ffh
	db	0ffh
	db	0ffh
	db	0ffh
	db	0feh
	db	080h
	db	00h
	db	0ch
	db	00h
	db	00h
	db	060h
	db	00h
	db	02h
	db	080h
	db	00h
	db	0ch
	db	00h
	db	00h
	db	060h
	db	00h
	db	02h
	db	080h
	db	00h
	db	0ch
	db	00h
	db	00h
	db	060h
	db	00h
	db	02h
	db	080h
	db	00h
	db	0ch
	db	00h
	db	00h
	db	060h
	db	00h
	db	02h
	db	080h
	db	00h
	db	0ch
	db	00h
	db	00h
	db	060h
	db	00h
	db	02h
	db	080h
	db	00h
	db	0ch
	db	00h
	db	00h
	db	060h
	db	00h
	db	02h
	db	080h
	db	00h
	db	0ch
	db	00h
	db	00h
	db	060h
	db	00h
	db	02h
	db	080h
	db	00h
	db	0ch
	db	00h
	db	00h
	db	060h
	db	00h
	db	02h
	db	080h
	db	00h
	db	0ch
	db	00h
	db	00h
	db	060h
	db	00h
	db	02h
	db	080h
	db	00h
	db	0ch
	db	00h
	db	00h
	db	060h
	db	00h
	db	02h
	db	080h
	db	00h
	db	0ch
	db	00h
	db	00h
	db	060h
	db	00h
	db	02h
	db	080h
	db	00h
	db	0ch
	db	00h
	db	00h
	db	060h
	db	00h
	db	02h
	db	080h
	db	00h
	db	0ch
	db	00h
	db	00h
	db	060h
	db	00h
	db	02h
	db	080h
	db	00h
	db	0ch
	db	00h
	db	00h
	db	060h
	db	00h
	db	02h
	db	080h
	db	00h
	db	0ch
	db	00h
	db	00h
	db	060h
	db	00h
	db	02h
	db	080h
	db	00h
	db	0ch
	db	00h
	db	00h
	db	060h
	db	00h
	db	02h
	db	080h
	db	00h
	db	0ch
	db	00h
	db	00h
	db	060h
	db	00h
	db	02h
	db	080h
	db	00h
	db	0ch
	db	00h
	db	00h
	db	060h
	db	00h
	db	02h
	db	080h
	db	00h
	db	0ch
	db	00h
	db	00h
	db	060h
	db	00h
	db	02h
	db	0ffh
	db	0ffh
	db	0ffh
	db	0ffh
	db	0ffh
	db	0ffh
	db	0ffh
	db	0feh
	db	0ffh
	db	0ffh
	db	0ffh
	db	0ffh
	db	0ffh
	db	0ffh
	db	0ffh
	db	0feh
	db	080h
	db	00h
	db	0ch
	db	00h
	db	00h
	db	060h
	db	00h
	db	02h
	db	080h
	db	00h
	db	0ch
	db	00h
	db	00h
	db	060h
	db	00h
	db	02h
	db	080h
	db	00h
	db	0ch
	db	00h
	db	00h
	db	060h
	db	00h
	db	02h
	db	080h
	db	00h
	db	0ch
	db	00h
	db	00h
	db	060h
	db	00h
	db	02h
	db	080h
	db	00h
	db	0ch
	db	00h
	db	00h
	db	060h
	db	00h
	db	02h
	db	080h
	db	00h
	db	0ch
	db	00h
	db	00h
	db	060h
	db	00h
	db	02h
	db	080h
	db	00h
	db	0ch
	db	00h
	db	00h
	db	060h
	db	00h
	db	02h
	db	080h
	db	00h
	db	0ch
	db	00h
	db	00h
	db	060h
	db	00h
	db	02h
	db	080h
	db	00h
	db	0ch
	db	00h
	db	00h
	db	060h
	db	00h
	db	02h
	db	080h
	db	00h
	db	0ch
	db	00h
	db	00h
	db	060h
	db	00h
	db	02h
	db	080h
	db	00h
	db	0ch
	db	00h
	db	00h
	db	060h
	db	00h
	db	02h
	db	080h
	db	00h
	db	0ch
	db	00h
	db	00h
	db	060h
	db	00h
	db	02h
	db	080h
	db	00h
	db	0ch
	db	00h
	db	00h
	db	060h
	db	00h
	db	02h
	db	080h
	db	00h
	db	0ch
	db	00h
	db	00h
	db	060h
	db	00h
	db	02h
	db	080h
	db	00h
	db	0ch
	db	00h
	db	00h
	db	060h
	db	00h
	db	02h
	db	080h
	db	00h
	db	0ch
	db	00h
	db	00h
	db	060h
	db	00h
	db	02h
	db	080h
	db	00h
	db	0ch
	db	00h
	db	00h
	db	060h
	db	00h
	db	02h
	db	080h
	db	00h
	db	0ch
	db	00h
	db	00h
	db	060h
	db	00h
	db	02h
	db	080h
	db	00h
	db	0ch
	db	00h
	db	00h
	db	060h
	db	00h
	db	02h
	db	0ffh
	db	0ffh
	db	0ffh
	db	0ffh
	db	0ffh
	db	0ffh
	db	0ffh
	db	0feh
	db	0ffh
	db	0ffh
	db	0ffh
	db	0ffh
	db	0ffh
	db	0ffh
	db	0ffh
	db	0feh
	db	080h
	db	00h
	db	0ch
	db	00h
	db	00h
	db	060h
	db	00h
	db	02h
	db	080h
	db	00h
	db	0ch
	db	00h
	db	00h
	db	060h
	db	00h
	db	02h
	db	080h
	db	00h
	db	0ch
	db	00h
	db	00h
	db	060h
	db	00h
	db	02h
	db	080h
	db	00h
	db	0ch
	db	00h
	db	00h
	db	060h
	db	00h
	db	02h
	db	080h
	db	00h
	db	0ch
	db	00h
	db	00h
	db	060h
	db	00h
	db	02h
	db	080h
	db	00h
	db	0ch
	db	00h
	db	00h
	db	060h
	db	00h
	db	02h
	db	080h
	db	00h
	db	0ch
	db	00h
	db	00h
	db	060h
	db	00h
	db	02h
	db	080h
	db	00h
	db	0ch
	db	00h
	db	00h
	db	060h
	db	00h
	db	02h
	db	080h
	db	00h
	db	0ch
	db	00h
	db	00h
	db	060h
	db	00h
	db	02h
	db	080h
	db	00h
	db	0ch
	db	00h
	db	00h
	db	060h
	db	00h
	db	02h
	db	080h
	db	00h
	db	0ch
	db	00h
	db	00h
	db	060h
	db	00h
	db	02h
	db	080h
	db	00h
	db	0ch
	db	00h
	db	00h
	db	060h
	db	00h
	db	02h
	db	080h
	db	00h
	db	0ch
	db	00h
	db	00h
	db	060h
	db	00h
	db	02h
	db	080h
	db	00h
	db	0ch
	db	00h
	db	00h
	db	060h
	db	00h
	db	02h
	db	080h
	db	00h
	db	0ch
	db	00h
	db	00h
	db	060h
	db	00h
	db	02h
	db	080h
	db	00h
	db	0ch
	db	00h
	db	00h
	db	060h
	db	00h
	db	02h
	db	080h
	db	00h
	db	0ch
	db	00h
	db	00h
	db	060h
	db	00h
	db	02h
	db	080h
	db	00h
	db	0ch
	db	00h
	db	00h
	db	060h
	db	00h
	db	02h
	db	080h
	db	00h
	db	0ch
	db	00h
	db	00h
	db	060h
	db	00h
	db	02h
	db	0ffh
	db	0ffh
	db	0ffh
	db	0ffh
	db	0ffh
	db	0ffh
	db	0ffh
	db	0feh

	rseg $$TABcross$main
_cross :
	db	01h
	db	0fh
	db	01h
	db	0ffh
	db	00h
	db	01h
	db	01h
	db	0dh
	db	01h
	db	01h
	db	0ffh
	db	00h
	db	02h
	db	01h
	db	0bh
	db	01h
	db	02h
	db	0ffh
	db	00h
	db	03h
	db	01h
	db	09h
	db	01h
	db	03h
	db	0ffh
	db	00h
	db	04h
	db	01h
	db	07h
	db	01h
	db	04h
	db	0ffh
	db	00h
	db	05h
	db	01h
	db	05h
	db	01h
	db	05h
	db	0ffh
	db	00h
	db	06h
	db	01h
	db	03h
	db	01h
	db	06h
	db	0ffh
	db	00h
	db	07h
	db	01h
	db	01h
	db	01h
	db	07h
	db	0ffh
	db	00h
	db	08h
	db	01h
	db	08h
	db	0ffh
	db	00h
	db	07h
	db	01h
	db	01h
	db	01h
	db	07h
	db	0ffh
	db	00h
	db	06h
	db	01h
	db	03h
	db	01h
	db	06h
	db	0ffh
	db	00h
	db	05h
	db	01h
	db	05h
	db	01h
	db	05h
	db	0ffh
	db	00h
	db	04h
	db	01h
	db	07h
	db	01h
	db	04h
	db	0ffh
	db	00h
	db	03h
	db	01h
	db	09h
	db	01h
	db	03h
	db	0ffh
	db	00h
	db	02h
	db	01h
	db	0bh
	db	01h
	db	02h
	db	0ffh
	db	00h
	db	01h
	db	01h
	db	0dh
	db	01h
	db	01h
	db	0ffh
	db	01h
	db	0fh
	db	01h
	db	0ffh

	rseg $$TABcircle$main
_circle :
	db	00h
	db	06h
	db	05h
	db	06h
	db	0ffh
	db	00h
	db	03h
	db	03h
	db	05h
	db	03h
	db	03h
	db	0ffh
	db	00h
	db	02h
	db	01h
	db	0bh
	db	01h
	db	02h
	db	0ffh
	db	00h
	db	01h
	db	01h
	db	0dh
	db	01h
	db	01h
	db	0ffh
	db	00h
	db	01h
	db	01h
	db	0dh
	db	01h
	db	01h
	db	0ffh
	db	00h
	db	01h
	db	01h
	db	0dh
	db	01h
	db	01h
	db	0ffh
	db	01h
	db	0fh
	db	01h
	db	0ffh
	db	01h
	db	0fh
	db	01h
	db	0ffh
	db	01h
	db	0fh
	db	01h
	db	0ffh
	db	01h
	db	0fh
	db	01h
	db	0ffh
	db	01h
	db	0fh
	db	01h
	db	0ffh
	db	00h
	db	01h
	db	01h
	db	0dh
	db	01h
	db	01h
	db	0ffh
	db	00h
	db	01h
	db	01h
	db	0dh
	db	01h
	db	01h
	db	0ffh
	db	00h
	db	01h
	db	01h
	db	0dh
	db	01h
	db	01h
	db	0ffh
	db	00h
	db	02h
	db	01h
	db	0bh
	db	01h
	db	02h
	db	0ffh
	db	00h
	db	03h
	db	03h
	db	05h
	db	03h
	db	03h
	db	0ffh
	db	00h
	db	06h
	db	05h
	db	06h
	db	0ffh

	rseg $$TABplayerx$main
_playerx :
	db	00h
	db	0eh
	db	01h
	db	0dh
	db	02h
	db	03ah
	db	01h
	db	08h
	db	02h
	db	07h
	db	02h
	db	06h
	db	02h
	db	03h
	db	02h
	db	0bh
	db	02h
	db	0eh
	db	0ffh
	db	00h
	db	02h
	db	08h
	db	03h
	db	02h
	db	0ch
	db	04h
	db	04h
	db	03h
	db	06h
	db	03h
	db	09h
	db	01h
	db	03h
	db	08h
	db	0bh
	db	03h
	db	05h
	db	03h
	db	07h
	db	03h
	db	05h
	db	03h
	db	05h
	db	03h
	db	02h
	db	03h
	db	02h
	db	03h
	db	06h
	db	02h
	db	07h
	db	04h
	db	03h
	db	0ffh
	db	0ch
	db	01h
	db	02h
	db	0ch
	db	04h
	db	04h
	db	04h
	db	04h
	db	04h
	db	01h
	db	0ah
	db	01h
	db	0bh
	db	09h
	db	03h
	db	04h
	db	03h
	db	08h
	db	03h
	db	05h
	db	03h
	db	05h
	db	03h
	db	02h
	db	03h
	db	02h
	db	03h
	db	06h
	db	02h
	db	05h
	db	07h
	db	02h
	db	0ffh
	db	03h
	db	06h
	db	03h
	db	01h
	db	02h
	db	0bh
	db	06h
	db	04h
	db	03h
	db	04h
	db	03h
	db	02h
	db	09h
	db	02h
	db	03h
	db	05h
	db	03h
	db	0ah
	db	03h
	db	02h
	db	04h
	db	09h
	db	02h
	db	06h
	db	02h
	db	05h
	db	03h
	db	02h
	db	03h
	db	02h
	db	04h
	db	05h
	db	02h
	db	04h
	db	03h
	db	04h
	db	01h
	db	02h
	db	0ffh
	db	03h
	db	06h
	db	03h
	db	01h
	db	02h
	db	0bh
	db	06h
	db	05h
	db	03h
	db	02h
	db	03h
	db	03h
	db	02h
	db	09h
	db	03h
	db	05h
	db	03h
	db	0bh
	db	03h
	db	01h
	db	03h
	db	0ah
	db	03h
	db	05h
	db	02h
	db	04h
	db	03h
	db	03h
	db	03h
	db	02h
	db	05h
	db	04h
	db	02h
	db	03h
	db	03h
	db	08h
	db	0ffh
	db	03h
	db	05h
	db	03h
	db	02h
	db	02h
	db	0bh
	db	02h
	db	02h
	db	03h
	db	04h
	db	04h
	db	01h
	db	02h
	db	04h
	db	02h
	db	09h
	db	03h
	db	04h
	db	03h
	db	0ch
	db	06h
	db	0bh
	db	03h
	db	04h
	db	04h
	db	03h
	db	03h
	db	03h
	db	03h
	db	02h
	db	05h
	db	04h
	db	02h
	db	02h
	db	03h
	db	09h
	db	0ffh
	db	03h
	db	03h
	db	04h
	db	03h
	db	02h
	db	0ah
	db	03h
	db	02h
	db	03h
	db	05h
	db	06h
	db	04h
	db	09h
	db	02h
	db	03h
	db	01h
	db	05h
	db	0eh
	db	04h
	db	0dh
	db	02h
	db	03h
	db	05h
	db	03h
	db	02h
	db	04h
	db	03h
	db	02h
	db	06h
	db	03h
	db	02h
	db	02h
	db	03h
	db	04h
	db	04h
	db	01h
	db	0ffh
	db	09h
	db	04h
	db	02h
	db	0ah
	db	02h
	db	04h
	db	03h
	db	05h
	db	04h
	db	05h
	db	08h
	db	03h
	db	08h
	db	0fh
	db	04h
	db	0dh
	db	03h
	db	02h
	db	02h
	db	01h
	db	02h
	db	02h
	db	03h
	db	04h
	db	03h
	db	02h
	db	03h
	db	01h
	db	03h
	db	02h
	db	02h
	db	02h
	db	0ch
	db	0ffh
	db	06h
	db	07h
	db	02h
	db	09h
	db	0ah
	db	05h
	db	03h
	db	06h
	db	03h
	db	08h
	db	06h
	db	010h
	db	05h
	db	0dh
	db	03h
	db	01h
	db	03h
	db	01h
	db	03h
	db	01h
	db	02h
	db	05h
	db	03h
	db	02h
	db	03h
	db	01h
	db	04h
	db	01h
	db	02h
	db	04h
	db	03h
	db	04h
	db	03h
	db	0ffh
	db	03h
	db	0ah
	db	02h
	db	09h
	db	0bh
	db	04h
	db	03h
	db	06h
	db	02h
	db	09h
	db	03h
	db	01h
	db	03h
	db	0fh
	db	02h
	db	01h
	db	03h
	db	0dh
	db	02h
	db	01h
	db	02h
	db	03h
	db	05h
	db	05h
	db	03h
	db	02h
	db	03h
	db	02h
	db	06h
	db	0bh
	db	03h
	db	0ffh
	db	03h
	db	0ah
	db	02h
	db	04h
	db	02h
	db	02h
	db	03h
	db	06h
	db	03h
	db	03h
	db	03h
	db	07h
	db	02h
	db	09h
	db	03h
	db	02h
	db	04h
	db	0ch
	db	03h
	db	02h
	db	03h
	db	0ch
	db	05h
	db	03h
	db	05h
	db	05h
	db	03h
	db	02h
	db	03h
	db	03h
	db	05h
	db	03h
	db	01h
	db	06h
	db	03h
	db	01h
	db	0ffh
	db	03h
	db	0ah
	db	08h
	db	02h
	db	03h
	db	07h
	db	03h
	db	02h
	db	03h
	db	07h
	db	09h
	db	02h
	db	03h
	db	03h
	db	04h
	db	0ah
	db	03h
	db	03h
	db	04h
	db	0bh
	db	04h
	db	05h
	db	03h
	db	06h
	db	03h
	db	02h
	db	03h
	db	04h
	db	04h
	db	03h
	db	02h
	db	04h
	db	04h
	db	01h
	db	0ffh
	db	03h
	db	0ah
	db	07h
	db	02h
	db	03h
	db	08h
	db	03h
	db	01h
	db	03h
	db	08h
	db	09h
	db	02h
	db	03h
	db	04h
	db	03h
	db	09h
	db	03h
	db	05h
	db	04h
	db	0bh
	db	03h
	db	05h
	db	03h
	db	06h
	db	03h
	db	02h
	db	03h
	db	05h
	db	03h
	db	03h
	db	09h
	db	02h
	db	0ffh
	db	02h
	db	0bh
	db	02h
	db	07h
	db	02h
	db	0ah
	db	02h
	db	01h
	db	02h
	db	09h
	db	05h
	db	06h
	db	02h
	db	06h
	db	02h
	db	09h
	db	02h
	db	07h
	db	02h
	db	0ch
	db	02h
	db	06h
	db	02h
	db	07h
	db	02h
	db	04h
	db	02h
	db	07h
	db	01h
	db	05h
	db	04h
	db	05h
	db	0ffh

	rseg $$TABplayery$main
_playery :
	db	00h
	db	0eh
	db	01h
	db	0dh
	db	02h
	db	039h
	db	03h
	db	0ch
	db	02h
	db	07h
	db	02h
	db	06h
	db	02h
	db	03h
	db	02h
	db	0bh
	db	02h
	db	0eh
	db	0ffh
	db	00h
	db	02h
	db	08h
	db	03h
	db	02h
	db	0ch
	db	04h
	db	04h
	db	03h
	db	06h
	db	03h
	db	09h
	db	01h
	db	03h
	db	08h
	db	010h
	db	08h
	db	0ah
	db	03h
	db	05h
	db	03h
	db	05h
	db	03h
	db	02h
	db	03h
	db	02h
	db	03h
	db	06h
	db	02h
	db	07h
	db	04h
	db	03h
	db	0ffh
	db	0ch
	db	01h
	db	02h
	db	0ch
	db	04h
	db	04h
	db	04h
	db	04h
	db	04h
	db	01h
	db	0ah
	db	01h
	db	0bh
	db	0ch
	db	04h
	db	04h
	db	03h
	db	09h
	db	03h
	db	05h
	db	03h
	db	05h
	db	03h
	db	02h
	db	03h
	db	02h
	db	03h
	db	06h
	db	02h
	db	05h
	db	07h
	db	02h
	db	0ffh
	db	03h
	db	06h
	db	03h
	db	01h
	db	02h
	db	0bh
	db	06h
	db	04h
	db	03h
	db	04h
	db	03h
	db	02h
	db	09h
	db	02h
	db	03h
	db	05h
	db	03h
	db	0bh
	db	04h
	db	06h
	db	02h
	db	0ah
	db	02h
	db	06h
	db	02h
	db	05h
	db	03h
	db	02h
	db	03h
	db	02h
	db	04h
	db	05h
	db	02h
	db	04h
	db	03h
	db	04h
	db	01h
	db	02h
	db	0ffh
	db	03h
	db	06h
	db	03h
	db	01h
	db	02h
	db	0bh
	db	06h
	db	05h
	db	03h
	db	02h
	db	03h
	db	03h
	db	02h
	db	09h
	db	03h
	db	05h
	db	03h
	db	0bh
	db	03h
	db	07h
	db	03h
	db	09h
	db	03h
	db	05h
	db	02h
	db	04h
	db	03h
	db	03h
	db	03h
	db	02h
	db	05h
	db	04h
	db	02h
	db	03h
	db	03h
	db	08h
	db	0ffh
	db	03h
	db	05h
	db	03h
	db	02h
	db	02h
	db	0bh
	db	02h
	db	02h
	db	03h
	db	04h
	db	04h
	db	01h
	db	02h
	db	04h
	db	02h
	db	09h
	db	03h
	db	04h
	db	03h
	db	0bh
	db	03h
	db	08h
	db	03h
	db	09h
	db	03h
	db	04h
	db	04h
	db	03h
	db	03h
	db	03h
	db	03h
	db	02h
	db	05h
	db	04h
	db	02h
	db	02h
	db	03h
	db	09h
	db	0ffh
	db	03h
	db	03h
	db	04h
	db	03h
	db	02h
	db	0ah
	db	03h
	db	02h
	db	03h
	db	05h
	db	06h
	db	04h
	db	09h
	db	02h
	db	03h
	db	01h
	db	05h
	db	0ch
	db	02h
	db	09h
	db	03h
	db	0ah
	db	02h
	db	03h
	db	05h
	db	03h
	db	02h
	db	04h
	db	03h
	db	02h
	db	06h
	db	03h
	db	02h
	db	02h
	db	03h
	db	04h
	db	04h
	db	01h
	db	0ffh
	db	09h
	db	04h
	db	02h
	db	0ah
	db	02h
	db	04h
	db	03h
	db	05h
	db	04h
	db	05h
	db	08h
	db	03h
	db	08h
	db	0ch
	db	03h
	db	09h
	db	03h
	db	0ah
	db	03h
	db	02h
	db	02h
	db	01h
	db	02h
	db	02h
	db	03h
	db	04h
	db	03h
	db	02h
	db	03h
	db	01h
	db	03h
	db	02h
	db	02h
	db	02h
	db	0ch
	db	0ffh
	db	06h
	db	07h
	db	02h
	db	09h
	db	0ah
	db	05h
	db	03h
	db	06h
	db	03h
	db	08h
	db	06h
	db	0eh
	db	03h
	db	08h
	db	03h
	db	0bh
	db	03h
	db	01h
	db	03h
	db	01h
	db	03h
	db	01h
	db	02h
	db	05h
	db	03h
	db	02h
	db	03h
	db	01h
	db	04h
	db	01h
	db	02h
	db	04h
	db	03h
	db	04h
	db	03h
	db	0ffh
	db	03h
	db	0ah
	db	02h
	db	09h
	db	0bh
	db	04h
	db	03h
	db	06h
	db	02h
	db	09h
	db	03h
	db	01h
	db	03h
	db	0dh
	db	03h
	db	08h
	db	03h
	db	0ch
	db	02h
	db	01h
	db	02h
	db	03h
	db	05h
	db	05h
	db	03h
	db	02h
	db	03h
	db	02h
	db	06h
	db	0bh
	db	03h
	db	0ffh
	db	03h
	db	0ah
	db	02h
	db	04h
	db	02h
	db	02h
	db	03h
	db	06h
	db	03h
	db	03h
	db	03h
	db	07h
	db	02h
	db	09h
	db	03h
	db	02h
	db	04h
	db	0bh
	db	03h
	db	07h
	db	03h
	db	0dh
	db	05h
	db	03h
	db	05h
	db	05h
	db	03h
	db	02h
	db	03h
	db	03h
	db	05h
	db	03h
	db	01h
	db	06h
	db	03h
	db	01h
	db	0ffh
	db	03h
	db	0ah
	db	08h
	db	02h
	db	03h
	db	07h
	db	03h
	db	02h
	db	03h
	db	07h
	db	09h
	db	02h
	db	03h
	db	03h
	db	04h
	db	0bh
	db	03h
	db	04h
	db	04h
	db	0eh
	db	04h
	db	05h
	db	03h
	db	06h
	db	03h
	db	02h
	db	03h
	db	04h
	db	04h
	db	03h
	db	02h
	db	04h
	db	04h
	db	01h
	db	0ffh
	db	03h
	db	0ah
	db	07h
	db	02h
	db	03h
	db	08h
	db	03h
	db	01h
	db	03h
	db	08h
	db	09h
	db	02h
	db	03h
	db	04h
	db	03h
	db	0ch
	db	08h
	db	011h
	db	03h
	db	05h
	db	03h
	db	06h
	db	03h
	db	02h
	db	03h
	db	05h
	db	03h
	db	03h
	db	09h
	db	02h
	db	0ffh
	db	02h
	db	0bh
	db	02h
	db	07h
	db	02h
	db	0ah
	db	02h
	db	01h
	db	02h
	db	09h
	db	05h
	db	06h
	db	02h
	db	06h
	db	02h
	db	0dh
	db	05h
	db	013h
	db	02h
	db	06h
	db	02h
	db	07h
	db	02h
	db	04h
	db	02h
	db	07h
	db	01h
	db	05h
	db	04h
	db	05h
	db	0ffh

	rseg $$FINITVARmain
_printdwordbuf :
	ds	05h
_posy :
	ds	01h
_posx :
	ds	01h
_lastbutton :
	ds	01h
	extrn code : __imulu8lw
	extrn code : __imodu8lw
	extrn code : __idivu8lw
	extrn code : __regpushu8lw
	extrn code : __regpopu8lw

	end
