;; Compile Options : /TML620906 /ML /far /SD /Oa /Om /W 1 /Fa.\ /Zs 
;; Version Number  : Ver.3.66.2
;; File Name       : main.c

	type (ML620906) 
	model large, far
	$$delay$main segment code 2h any
	$$main$main segment code 2h any
	$$set_bits$main segment code 2h any
	STACKSEG 0400h
CVERSION 3.66.2
CGLOBAL 01H 03H 0000H "main" 08H 02H 0A4H 00H 80H 04H 00H 00H 01H
CGLOBAL 01H 03H 0000H "delay" 08H 02H 0A0H 00H 80H 00H 00H 00H 07H
CGLOBAL 01H 03H 0000H "set_bits" 08H 02H 0A3H 00H 83H 1aH 00H 00H 07H
CSTRUCTTAG 0000H 0000H 0003H 0002H 00000008H "_Notag"
CSTRUCTMEM 63H 00000004H 00000000H "quot" 02H 00H 02H
CSTRUCTMEM 63H 00000004H 00000004H "rem" 02H 00H 02H
CSTRUCTTAG 0000H 0000H 0002H 0002H 00000004H "_Notag"
CSTRUCTMEM 63H 00000002H 00000000H "quot" 02H 00H 01H
CSTRUCTMEM 63H 00000002H 00000002H "rem" 02H 00H 01H
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
CTYPEDEF 0000H 0000H 63H "_Ptrdifft" 02H 00H 01H
CTYPEDEF 0000H 0000H 63H "sword" 02H 00H 08H
CTYPEDEF 0000H 0000H 62H "ushort" 02H 00H 08H
CTYPEDEF 0000H 0000H 62H "byte" 02H 00H 00H
CTYPEDEF 0000H 0000H 62H "_Sizet" 02H 00H 01H
CTYPEDEF 0000H 0000H 62H "size_t" 02H 00H 01H
CTYPEDEF 0000H 0000H 62H "uint8_t" 02H 00H 00H
CTYPEDEF 0000H 0000H 63H "fpos_t" 04H 00H 05H 00H 00H
CTYPEDEF 0000H 0000H 03H "_Cmpfun_nf" 08H 02H 31H 00H 00H 00H 00H 00H 01H
CTYPEDEF 0000H 0000H 03H "_Cmpfun_nn" 08H 02H 30H 00H 00H 00H 00H 00H 01H
CTYPEDEF 0000H 0000H 03H "_Cmpfun_ff" 08H 02H 33H 00H 00H 00H 00H 00H 01H
CTYPEDEF 0000H 0000H 03H "_Cmpfun_fn" 08H 02H 32H 00H 00H 00H 00H 00H 01H
CTYPEDEF 0000H 0000H 62H "word" 02H 00H 08H
CTYPEDEF 0000H 0000H 63H "FILE" 04H 00H 05H 01H 00H
CTYPEDEF 0000H 0000H 63H "div_t" 04H 00H 05H 02H 00H
CTYPEDEF 0000H 0000H 63H "ldiv_t" 04H 00H 05H 03H 00H
CTYPEDEF 0000H 0000H 62H "uint16_t" 02H 00H 08H
CFILE 0001H 00000070H "..\\base.h"
CFILE 0002H 00000105H "E:\\Lexide\\BuildTools\\Ver.20231124\\Inc\\U16\\stdio.h"
CFILE 0003H 0000007AH "E:\\Lexide\\BuildTools\\Ver.20231124\\Inc\\U16\\yvals.h"
CFILE 0004H 000000D8H "E:\\Lexide\\BuildTools\\Ver.20231124\\Inc\\U16\\stdlib.h"
CFILE 0005H 000000C9H "E:\\Lexide\\BuildTools\\Ver.20231124\\Inc\\U16\\string.h"
CFILE 0000H 0000004AH "..\\main.c"

	rseg $$delay$main
CFUNCTION 160

_delay	:
CBLOCK 160 1 10

;;{
CLINEA 0000H 0001H 000AH 0001H 0001H
CBLOCK 160 2 10
CARGUMENT 46H 0002H 0024H "after_ticks" 02H 00H 01H

;;    if ((FCON & 2) != 0)
CLINEA 0000H 0001H 000BH 0005H 0018H
	tb	00h:0f00ah.1
	beq	_$L1

;;        FCON &= 0xfd;
CLINEA 0000H 0001H 000CH 0009H 0015H
	rb	00h:0f00ah.1
_$L1 :

;;    __DI();
CLINEA 0000H 0001H 000DH 0005H 000BH
	di

;;    Timer0Interval = after_ticks;
CLINEA 0000H 0001H 000EH 0005H 0021H
	st	er0,	00h:0f020h

;;    Timer0Counter = 0;
CLINEA 0000H 0001H 000FH 0005H 0016H
	mov	er0,	#0 
	st	er0,	00h:0f022h

;;    Timer0Control = 0x0101;
CLINEA 0000H 0001H 0010H 0005H 001BH
	mov	r0,	#01h
	mov	r1,	#01h
	st	er0,	00h:0f024h

;;    InterruptPending_W0 = 0;
CLINEA 0000H 0001H 0011H 0005H 001CH
	mov	er0,	#0 
	st	er0,	00h:0f014h

;;    StopAcceptor = 0x50;
CLINEA 0000H 0001H 0012H 0005H 0018H
	mov	r0,	#050h
	st	r0,	00h:0f008h

;;    StopAcceptor = 0xa0;
CLINEA 0000H 0001H 0013H 0005H 0018H
	mov	r0,	#0a0h
	st	r0,	00h:0f008h

;;    StopControl = 2;
CLINEA 0000H 0001H 0014H 0005H 0014H
	mov	r0,	#02h
	st	r0,	00h:0f009h

;;    __asm("nop");
CLINEA 0000H 0001H 0015H 0005H 0011H
nop

;;    __asm("nop");
CLINEA 0000H 0001H 0016H 0005H 0011H
nop

;;    __EI();
CLINEA 0000H 0001H 0017H 0005H 000BH
	ei
CBLOCKEND 160 2 24

;;}
CLINEA 0000H 0001H 0018H 0001H 0001H
	rt
CBLOCKEND 160 1 24
CFUNCTIONEND 160


	rseg $$set_bits$main
CFUNCTION 163

_set_bits	:
CBLOCK 163 1 26

;;void set_bits(uint8_t *mem_address, int start_bit, int num_bits) {
CLINEA 0000H 0001H 001AH 0001H 0042H
	push	lr
	bl	__regpushu8lw
	add	sp,	#-010
	mov	er8,	er0
	mov	r10,	r2
CBLOCK 163 2 26
CRET 0016H
CARGUMENT 66H 0003H 1E28H "mem_address" 04H 03H 00H 00H 00H
CARGUMENT 43H 0002H 0010H "start_bit" 02H 00H 01H
CARGUMENT 43H 0002H 0012H "num_bits" 02H 00H 01H
CLOCAL 43H 0002H 0002H 0002H "start_byte" 02H 00H 01H
CLOCAL 43H 0002H 0004H 0002H "start_offset" 02H 00H 01H
CLOCAL 4BH 0002H 0000H 0002H "end_bit" 02H 00H 01H
CLOCAL 43H 0002H 0006H 0002H "end_byte" 02H 00H 01H
CLOCAL 43H 0002H 0008H 0002H "end_offset" 02H 00H 01H
CLOCAL 43H 0002H 000AH 0002H "i" 02H 00H 01H
CLOCAL 4AH 0001H 0000H 0002H "end_mask" 02H 00H 00H

;;    int start_byte = start_bit / 8;
CLINEA 0000H 0001H 001CH 0005H 0023H
	l	er0,	16[fp]
	mov	er2,	#8 
	bl	__idivu8lw
	mov	er6,	er0
	st	er0,	-2[fp]

;;    int start_offset = start_bit % 8;
CLINEA 0000H 0001H 001DH 0005H 0025H
	l	er0,	16[fp]
	mov	er2,	#8 
	bl	__imodu8lw
	st	er0,	-4[fp]

;;    int end_byte = end_bit / 8;
CLINEA 0000H 0001H 0020H 0005H 001FH
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
CLINEA 0000H 0001H 0021H 0005H 0021H
	mov	er0,	er4
	mov	er2,	#8 
	bl	__imodu8lw
	st	er0,	-8[fp]

;;    if (start_byte == end_byte) {
CLINEA 0000H 0001H 0025H 0005H 0021H
	cmp	er6,	bp
	bne	_$L4
CBLOCK 163 3 37
CLOCAL 4AH 0001H 0000H 0003H "mask" 02H 00H 00H

;;        *(mem_address + start_byte) |= mask;
CLINEA 0000H 0001H 0027H 0009H 002CH
	mov	er0,	#1 
	l	er2,	18[fp]
	beq	_$M2
_$M3 :
	sllc	r1,	#01h
	sll	r0,	#01h
	add	er2,	#-1
	bne	_$M3
_$M2 :
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
	beq	_$M4
_$M5 :
	sllc	r3,	#01h
	sll	r2,	#01h
	add	er0,	#-1
	bne	_$M5
_$M4 :
	l	er0,	-2[fp]
	add	er0,	er8
	l	r3,	r10:[er0]
	or	r3,	r2
	st	r3,	DSR:[er0]
CBLOCKEND 163 3 40
	bal	_$L6
_$L4 :

;;    } else {
CLINEA 0000H 0000H 0028H 0005H 000CH
CBLOCK 163 4 40
CLOCAL 4AH 0001H 0000H 0004H "start_mask" 02H 00H 00H

;;        *(mem_address + start_byte) |= start_mask;
CLINEA 0000H 0001H 002BH 0009H 0032H
	l	er0,	-2[fp]
	add	er0,	er8
	mov	er2,	er0
	mov	r0,	#0ffh
	mov	r1,	#00h
	l	er6,	-4[fp]
	beq	_$M6
_$M7 :
	srlc	r0,	#01h
	sra	r1,	#01h
	add	er6,	#-1
	bne	_$M7
_$M6 :
	l	r1,	r10:[er2]
	or	r1,	r0
	st	r1,	DSR:[er2]

;;        for (i = start_byte + 1; i < end_byte; i++) {
CLINEA 0000H 0001H 002EH 0009H 0035H
	l	er0,	-2[fp]
	bal	_$L12
_$L9 :
CBLOCK 163 5 46

;;            *(mem_address + i) = 0xFF;
CLINEA 0000H 0001H 002FH 000DH 0026H
	add	er0,	er8
	mov	r3,	#0ffh
	st	r3,	r10:[er0]
CBLOCKEND 163 5 48

;;        for (i = start_byte + 1; i < end_byte; i++) {
CLINEA 0000H 0000H 002EH 0009H 0035H
	l	er0,	-10[fp]
_$L12 :
	add	er0,	#1 
	st	er0,	-10[fp]
	l	er2,	-6[fp]
	cmp	er0,	er2
	blts	_$L9

;;        *(mem_address + end_byte) |= end_mask;
CLINEA 0000H 0001H 0034H 0009H 002EH
	mov	er0,	er2
	add	er0,	er8
	mov	er2,	er0
	l	er4,	-8[fp]
	add	er4,	#1 
	mov	r0,	#0ffh
	mov	r1,	#00h
	mov	er4,	er4
	beq	_$M8
_$M9 :
	srlc	r0,	#01h
	sra	r1,	#01h
	add	er4,	#-1
	bne	_$M9
_$M8 :
	xor	r0,	#0ffh
	l	r1,	r10:[er2]
	or	r1,	r0
	st	r1,	DSR:[er2]
CBLOCKEND 163 4 53

;;    }
CLINEA 0000H 0000H 0035H 0005H 0005H
_$L6 :
CBLOCKEND 163 2 54

;;}
CLINEA 0000H 0001H 0036H 0001H 0001H
	b	__regpopu8lw
CBLOCKEND 163 1 54
CFUNCTIONEND 163


	rseg $$main$main
CFUNCTION 164

_main	:
CBLOCK 164 1 56

;;int main() {
CLINEA 0000H 0001H 0038H 0001H 000CH
CBLOCK 164 2 56
CLOCAL 6AH 0003H 0000H 0002H "mem_address" 04H 03H 00H 00H 00H
CLOCAL 4AH 0001H 0000H 0002H "j" 02H 00H 00H
CLOCAL 4AH 0001H 0000H 0002H "k" 02H 00H 00H

;;	memset(0xD000,0x00,0x15D3);
CLINEA 0000H 0001H 003DH 0002H 001CH
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
CLINEA 0000H 0001H 003EH 0002H 001BH
	mov	r0,	#00h
	mov	r1,	#08h
	push	er0
	mov	er0,	#0 
	push	er0
	mov	r1,	#0f8h
	mov	r2,	#00h
	bl	_memset_f
	add	sp,	#4 

;;	while (1) {
CLINEA 0000H 0001H 0041H 0002H 000CH
	bal	_$L14
_$L16 :
CBLOCK 164 3 65

;;		memset(0xf800,0x00,0x800);
CLINEA 0000H 0001H 0042H 0003H 001CH
	mov	r0,	#00h
	mov	r1,	#08h
	push	er0
	mov	er0,	#0 
	push	er0
	mov	r1,	#0f8h
	mov	r2,	#00h
	bl	_memset_f
	add	sp,	#4 

;;		set_bits(mem_address, j, k);
CLINEA 0000H 0001H 0045H 0003H 001EH
	l	r0,	00h:0f00ch
	mov	r1,	#00h
	mov	r2,	r0
	mov	r3,	#00h
	mov	r4,	#0c0h
	div	er2,	r4
	mov	r5,	#00h
	mov	r2,	#0c0h
	mov	r3,	#00h
	sub	r2,	r4
	subc	r3,	r5
	bl	__imodu8lw
	and	r1,	#00h
	push	er0
	push	er4
	mov	r0,	#020h
	mov	r1,	#0f8h
	mov	r2,	#00h
	bl	_set_bits
	add	sp,	#4 

;;		delay(1000);
CLINEA 0000H 0001H 0046H 0003H 000EH
	mov	r0,	#0e8h
	mov	r1,	#03h
	bl	_delay
CBLOCKEND 164 3 71

;;	}
CLINEA 0000H 0000H 0047H 0002H 0002H
_$L14 :

;;	while (1) {
CLINEA 0000H 0000H 0041H 0000H 0000H
	bal	_$L16

;;    return 0;
CLINEA 0000H 0001H 0048H 0005H 000DH
CBLOCKEND 164 2 73

;;}
CLINEA 0000H 0000H 0049H 0001H 0001H
CBLOCKEND 164 1 73
CFUNCTIONEND 164

	public _main
	public _delay
	public _set_bits
	extrn code far : _memset_f
	extrn code : $$start_up

	cseg #00h at 02h
	dw	$$start_up
	extrn code : __imodu8lw
	extrn code : __idivu8lw
	extrn code : __regpushu8lw
	extrn code : __regpopu8lw

	end
