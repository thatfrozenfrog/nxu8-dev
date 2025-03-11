;; Compile Options : /TML620906 /ML /SD /Om /Zc /Orp /FaD:\Github\nxu8-dev\LCD_test.asm /Lv 
;; Version Number  : Ver.3.66.2
;; File Name       : main.c

	type (ML620906) 
	model large, near
	$$FCODmain segment code 2h any
	STACKSEG 0400h
CVERSION 3.66.2
CGLOBAL 01H 03H 0000H "main" 08H 02H 07H 00H 80H 02H 00H 00H 07H
CENUMTAG 0000H 0000H 0000H 0005H "_Notag"
CENUMMEM 00000000H "LCD_DRAW_SET"
CENUMMEM 00000001H "LCD_DRAW_INVERSE"
CENUMMEM 00000002H "LCD_DRAW_AND"
CENUMMEM 00000003H "LCD_DRAW_OR"
CENUMMEM 00000004H "LCD_DRAW_XOR"
CTYPEDEF 0000H 0000H 43H "sword" 02H 00H 08H
CTYPEDEF 0000H 0000H 42H "ushort" 02H 00H 08H
CTYPEDEF 0000H 0000H 42H "LCD_color_t" 02H 00H 00H
CTYPEDEF 0000H 0000H 42H "byte" 02H 00H 00H
CTYPEDEF 0000H 0000H 42H "LCD_pos_t" 02H 00H 00H
CTYPEDEF 0000H 0000H 42H "uint8_t" 02H 00H 00H
CTYPEDEF 0000H 0000H 42H "word" 02H 00H 08H
CTYPEDEF 0000H 0000H 43H "LCD_draw_method_t" 04H 00H 0AH 00H 00H
CTYPEDEF 0000H 0000H 42H "uint16_t" 02H 00H 08H
CFILE 0001H 00000070H "D:\\Github\\nxu8-dev\\LCD_test\\base.h"
CFILE 0002H 00000029H "D:\\Github\\nxu8-dev\\LCD_test\\LCD/LCDConfig.h"
CFILE 0003H 00000009H "D:\\Github\\nxu8-dev\\LCD_test\\LCD/stdint.h"
CFILE 0004H 00000049H "D:\\Github\\nxu8-dev\\LCD_test\\LCD/LCDPaint.h"
CFILE 0000H 00000015H "D:\\Github\\nxu8-dev\\LCD_test\\main.c"

	rseg $$FCODmain
CFUNCTION 7

_main	:
CBLOCK 7 1 15

;;void main() {
CLINEA 0000H 0001H 000FH 0001H 000DH
;;*****************************************
;;	register/stack information
;;*****************************************
;;*****************************************

CBLOCK 7 2 15

;;	memset(0xD000,0x00,0x15D3);
CLINEA 0000H 0001H 0011H 0002H 001CH
	mov	r0,	#0d3h
	mov	r1,	#015h
	push	er0
	mov	er2,	#0 
	mov	r0,	#00h
	mov	r1,	#0d0h
	bl	_memset
	add	sp,	#2 

;;	memset(0xf800,0x00,0x800);
CLINEA 0000H 0001H 0012H 0002H 001BH
	mov	r0,	#00h
	mov	r1,	#08h
	push	er0
	mov	er2,	#0 
	mov	r1,	#0f8h
	bl	_memset
	add	sp,	#2 
CBLOCKEND 7 2 21

;;}
CLINEA 0000H 0001H 0015H 0001H 0001H
_$$end_of_main :
	bal	$
CBLOCKEND 7 1 21
CFUNCTIONEND 7

	extrn code far : _memset
	public _main
	extrn code : $$start_up

	cseg #00h at 02h
	dw	$$start_up

	end
