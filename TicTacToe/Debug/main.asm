;; Compile Options : /TML620906 /ML /far /SD /Oa /Om /W 1 /Fa.\ /Zs 
;; Version Number  : Ver.3.66.2
;; File Name       : main.c

	type (ML620906) 
	model large, far
	$$TABboard1$main segment table 2h any
	$$TABcircle$main segment table 2h any
	$$TABcross$main segment table 2h any
	$$delay$main segment code 2h any
	$$getrandom$main segment code 2h any
	$$main$main segment code 2h any
	$$render_pattern$main segment code 2h any
	$$render_rect$main segment code 2h any
	$$set_bits$main segment code 2h any
	$$set_bits_old$main segment code 2h any
	$$wait_AC$main segment code 2h any
	STACKSEG 0400h
CVERSION 3.66.2
CGLOBAL 01H 03H 0000H "set_bits_old" 08H 02H 0C0H 00H 83H 20H 00H 00H 07H
CGLOBAL 01H 03H 0000H "wait_AC" 08H 02H 0C4H 00H 80H 00H 00H 00H 07H
CGLOBAL 01H 03H 0000H "main" 08H 02H 0C3H 00H 82H 14H 00H 00H 01H
CGLOBAL 01H 02H 0000H "getrandom" 08H 02H 0BEH 00H 81H 06H 00H 00H 08H
CGLOBAL 01H 03H 0000H "render_pattern" 08H 02H 0C1H 00H 83H 16H 00H 00H 07H
CGLOBAL 01H 03H 0000H "delay" 08H 02H 0BBH 00H 80H 00H 00H 00H 07H
CGLOBAL 01H 03H 0000H "set_bits" 08H 02H 0BFH 00H 83H 1eH 00H 00H 07H
CGLOBAL 01H 03H 0000H "render_rect" 08H 02H 0C2H 00H 83H 16H 00H 00H 07H
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
CUNIONTAG 0000H 0000H 0004H 0002H 00000008H "_Notag"
CUNIONMEM 62H 00000008H "_W" 05H 01H 04H 00H 00H 08H
CUNIONMEM 63H 00000008H "_D" 02H 00H 04H
CTYPEDEF 0000H 0000H 21H "_Dconst" 04H 00H 06H 04H 00H
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
CGLOBAL 01H 20H 01F8H "board1" 05H 01H 0F8H 01H 00H 00H
CGLOBAL 01H 20H 006FH "cross" 05H 01H 6FH 00H 00H 00H
CGLOBAL 01H 20H 0064H "circle" 05H 01H 64H 00H 00H 00H
CFILE 0001H 00000070H "..\\base.h"
CFILE 0002H 00000105H "E:\\Lexide\\BuildTools\\Ver.20231124\\Inc\\U16\\stdio.h"
CFILE 0003H 0000007AH "E:\\Lexide\\BuildTools\\Ver.20231124\\Inc\\U16\\yvals.h"
CFILE 0004H 000000D8H "E:\\Lexide\\BuildTools\\Ver.20231124\\Inc\\U16\\stdlib.h"
CFILE 0005H 000000C9H "E:\\Lexide\\BuildTools\\Ver.20231124\\Inc\\U16\\string.h"
CFILE 0006H 00000066H "..\\tictactoe.h"
CFILE 0007H 00000057H "E:\\Lexide\\BuildTools\\Ver.20231124\\Inc\\U16\\math.h"
CFILE 0000H 000000CBH "..\\main.c"

	rseg $$delay$main
CFUNCTION 187

_delay	:
CBLOCK 187 1 12

;;{
CLINEA 0000H 0001H 000CH 0001H 0001H
CBLOCK 187 2 12
CARGUMENT 46H 0002H 0024H "after_ticks" 02H 00H 01H

;;    if ((FCON & 2) != 0)
CLINEA 0000H 0001H 000DH 0005H 0018H
	tb	00h:0f00ah.1
	beq	_$L1

;;        FCON &= 0xfd;
CLINEA 0000H 0001H 000EH 0009H 0015H
	rb	00h:0f00ah.1
_$L1 :

;;    __DI();
CLINEA 0000H 0001H 000FH 0005H 000BH
	di

;;    Timer0Interval = after_ticks;
CLINEA 0000H 0001H 0010H 0005H 0021H
	st	er0,	00h:0f020h

;;    Timer0Counter = 0;
CLINEA 0000H 0001H 0011H 0005H 0016H
	mov	er0,	#0 
	st	er0,	00h:0f022h

;;    Timer0Control = 0x0101;
CLINEA 0000H 0001H 0012H 0005H 001BH
	mov	r0,	#01h
	mov	r1,	#01h
	st	er0,	00h:0f024h

;;    InterruptPending_W0 = 0;
CLINEA 0000H 0001H 0013H 0005H 001CH
	mov	er0,	#0 
	st	er0,	00h:0f014h

;;    StopAcceptor = 0x50;
CLINEA 0000H 0001H 0014H 0005H 0018H
	mov	r0,	#050h
	st	r0,	00h:0f008h

;;    StopAcceptor = 0xa0;
CLINEA 0000H 0001H 0015H 0005H 0018H
	mov	r0,	#0a0h
	st	r0,	00h:0f008h

;;    StopControl = 2;
CLINEA 0000H 0001H 0016H 0005H 0014H
	mov	r0,	#02h
	st	r0,	00h:0f009h

;;    __asm("nop");
CLINEA 0000H 0001H 0017H 0005H 0011H
nop

;;    __asm("nop");
CLINEA 0000H 0001H 0018H 0005H 0011H
nop

;;    __EI();
CLINEA 0000H 0001H 0019H 0005H 000BH
	ei
CBLOCKEND 187 2 26

;;}
CLINEA 0000H 0001H 001AH 0001H 0001H
	rt
CBLOCKEND 187 1 26
CFUNCTIONEND 187


	rseg $$getrandom$main
CFUNCTION 190

_getrandom	:
CBLOCK 190 1 28

;;word getrandom(word max) {
CLINEA 0000H 0001H 001CH 0001H 001AH
	push	lr
	push	er8
	mov	er8,	er0
CBLOCK 190 2 28
CRET 0002H
CARGUMENT 46H 0002H 0028H "max" 02H 00H 01H

;;  return deref(0xF00C) % max;
CLINEA 0000H 0001H 001DH 0003H 001DH
	l	r0,	00h:0f00ch
	mov	r1,	#00h
	mov	er2,	er8
	bl	__uimodu8lw
CBLOCKEND 190 2 30

;;}
CLINEA 0000H 0000H 001EH 0001H 0001H
	pop	er8
	pop	pc
CBLOCKEND 190 1 30
CFUNCTIONEND 190


	rseg $$set_bits$main
CFUNCTION 191

_set_bits	:
CBLOCK 191 1 32

;;void set_bits(uint8_t *mem_address, int start_bit, int num_bits, uint8_t pattern, byte invert) {
CLINEA 0000H 0001H 0020H 0001H 0060H
	push	lr
	bl	__regpushu8lw
	add	sp,	#-014
	mov	er8,	er0
	mov	er10,	er2
CBLOCK 191 2 32
CRET 001AH
CARGUMENT 66H 0003H 1E28H "mem_address" 04H 03H 00H 00H 00H
CARGUMENT 46H 0001H 001FH "pattern" 02H 00H 00H
CARGUMENT 43H 0002H 0010H "start_bit" 02H 00H 01H
CARGUMENT 43H 0002H 0012H "num_bits" 02H 00H 01H
CARGUMENT 42H 0001H 0014H "invert" 02H 00H 00H
CLOCAL 43H 0002H 0002H 0002H "start_byte" 02H 00H 01H
CLOCAL 43H 0002H 0004H 0002H "start_offset" 02H 00H 01H
CLOCAL 4BH 0002H 0000H 0002H "end_bit" 02H 00H 01H
CLOCAL 43H 0002H 0006H 0002H "end_byte" 02H 00H 01H
CLOCAL 43H 0002H 0008H 0002H "end_offset" 02H 00H 01H
CLOCAL 43H 0002H 000CH 0002H "i" 02H 00H 01H
CLOCAL 42H 0001H 0009H 0002H "mask" 02H 00H 00H
CLOCAL 42H 0001H 000AH 0002H "start_mask" 02H 00H 00H
CLOCAL 42H 0001H 000DH 0002H "end_mask" 02H 00H 00H

;;    int start_byte = start_bit / 8;
CLINEA 0000H 0001H 0022H 0005H 0023H
	l	er0,	16[fp]
	mov	er2,	#8 
	bl	__idivu8lw
	mov	er6,	er0
	st	er0,	-2[fp]

;;    int start_offset = start_bit % 8;
CLINEA 0000H 0001H 0023H 0005H 0025H
	l	er0,	16[fp]
	mov	er2,	#8 
	bl	__imodu8lw
	st	er0,	-4[fp]

;;    int end_byte = end_bit / 8;
CLINEA 0000H 0001H 0026H 0005H 001FH
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
CLINEA 0000H 0001H 0027H 0005H 0021H
	mov	er0,	er4
	mov	er2,	#8 
	bl	__imodu8lw
	st	er0,	-8[fp]

;;    if (start_byte == end_byte) {
CLINEA 0000H 0001H 002DH 0005H 0021H
	cmp	er6,	bp
	bne	_$L5
CBLOCK 191 3 45

;;        mask = ((1 << num_bits) - 1) << (8 - start_offset - num_bits);
CLINEA 0000H 0001H 002FH 0009H 0046H
	mov	er0,	#1 
	l	er2,	18[fp]
	beq	_$M3
_$M4 :
	sllc	r1,	#01h
	sll	r0,	#01h
	add	er2,	#-1
	bne	_$M4
_$M3 :
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
	beq	_$M5
_$M6 :
	sllc	r3,	#01h
	sll	r2,	#01h
	add	er0,	#-1
	bne	_$M6
_$M5 :
	st	r2,	-9[fp]

;;        if (invert) {
CLINEA 0000H 0001H 0030H 0009H 0015H
	l	r0,	20[fp]
	beq	_$L7
CBLOCK 191 4 48

;;            *(mem_address + start_byte) ^= mask;  // XOR để invert bit
CLINEA 0000H 0001H 0031H 000DH 0049H
	l	er0,	-2[fp]
	add	er0,	er8
	l	r2,	r10:[er0]
	l	r3,	-9[fp]
	xor	r2,	r3
	st	r2,	DSR:[er0]
CBLOCKEND 191 4 50
	bal	_$L9
_$L7 :

;;        } else {
CLINEA 0000H 0000H 0032H 0009H 0010H
CBLOCK 191 5 50

;;            *(mem_address + start_byte) = (*(mem_address + start_byte) & ~mask) | (pattern & mask);  // Đặt các bit theo `pattern`
CLINEA 0000H 0001H 0033H 000DH 0086H
	l	er0,	-2[fp]
	add	er0,	er8
	mov	r3,	r2
	xor	r3,	#0ffh
	l	r4,	r10:[er0]
	and	r3,	r4
	mov	r4,	r11
	and	r4,	r2
	or	r4,	r3
	st	r4,	DSR:[er0]
CBLOCKEND 191 5 52

;;        }
CLINEA 0000H 0000H 0034H 0009H 0009H
_$L9 :
CBLOCKEND 191 3 53
	b	_$L25
_$L5 :

;;    } else {
CLINEA 0000H 0000H 0035H 0005H 000CH
CBLOCK 191 6 53

;;        start_mask = 0xFF >> start_offset;
CLINEA 0000H 0001H 0037H 0009H 002AH
	mov	r0,	#0ffh
	mov	r1,	#00h
	l	er2,	-4[fp]
	beq	_$M7
_$M8 :
	srlc	r0,	#01h
	sra	r1,	#01h
	add	er2,	#-1
	bne	_$M8
_$M7 :
	st	r0,	-10[fp]

;;        if (invert) {
CLINEA 0000H 0001H 0038H 0009H 0015H
	l	r0,	20[fp]
	beq	_$L11
CBLOCK 191 7 56

;;            *(mem_address + start_byte) ^= start_mask;  // XOR để invert bit
CLINEA 0000H 0001H 0039H 000DH 004FH
	l	er0,	-2[fp]
	add	er0,	er8
	l	r2,	r10:[er0]
	l	r3,	-10[fp]
	xor	r2,	r3
	st	r2,	DSR:[er0]
CBLOCKEND 191 7 58
	bal	_$L13
_$L11 :

;;        } else {
CLINEA 0000H 0000H 003AH 0009H 0010H
CBLOCK 191 8 58

;;            *(mem_address + start_byte) = (*(mem_address + start_byte) & ~start_mask) | (pattern & start_mask);  // Đặt các bit theo `pattern`
CLINEA 0000H 0001H 003BH 000DH 0092H
	l	er0,	-2[fp]
	add	er0,	er8
	l	r3,	-10[fp]
	xor	r3,	#0ffh
	l	r4,	r10:[er0]
	and	r3,	r4
	mov	r4,	r11
	l	r5,	-10[fp]
	and	r4,	r5
	or	r4,	r3
	st	r4,	DSR:[er0]
CBLOCKEND 191 8 60

;;        }
CLINEA 0000H 0000H 003CH 0009H 0009H
_$L13 :

;;        for (i = start_byte + 1; i < end_byte; i++) {
CLINEA 0000H 0001H 003FH 000EH 0020H
	l	er0,	-2[fp]

;;        for (i = start_byte + 1; i < end_byte; i++) {
CLINEA 0000H 0000H 003FH 0022H 002EH
	bal	_$L19

;;        for (i = start_byte + 1; i < end_byte; i++) {
CLINEA 0000H 0000H 003FH 0030H 0032H
_$L16 :
CBLOCK 191 9 63

;;            if (invert) {
CLINEA 0000H 0001H 0040H 000DH 0019H
	l	r0,	20[fp]
	beq	_$L20
CBLOCK 191 10 64

;;                *(mem_address + i) ^= pattern;  // XOR để invert toàn bộ byte
CLINEA 0000H 0001H 0041H 0011H 0053H
	l	er0,	-12[fp]
	add	er0,	er8
	l	r2,	r10:[er0]
	xor	r2,	r11
	st	r2,	DSR:[er0]
CBLOCKEND 191 10 66
	bal	_$L22
_$L20 :

;;            } else {
CLINEA 0000H 0000H 0042H 000DH 0014H
CBLOCK 191 11 66

;;                *(mem_address + i) = pattern;  // Đặt toàn bộ byte theo `pattern`
CLINEA 0000H 0001H 0043H 0011H 0057H
	l	er0,	-12[fp]
	add	er0,	er8
	st	r11,	r10:[er0]
CBLOCKEND 191 11 68

;;            }
CLINEA 0000H 0000H 0044H 000DH 000DH
_$L22 :
CBLOCKEND 191 9 69

;;        for (i = start_byte + 1; i < end_byte; i++) {
CLINEA 0000H 0000H 003FH 0030H 0032H
	l	er0,	-12[fp]

;;        for (i = start_byte + 1; i < end_byte; i++) {
CLINEA 0000H 0000H 003FH 0022H 002EH
_$L19 :
	add	er0,	#1 
	st	er0,	-12[fp]
	l	er2,	-6[fp]
	cmp	er0,	er2
	blts	_$L16

;;        end_mask = ~(0xFF >> (end_offset + 1));
CLINEA 0000H 0001H 0048H 0009H 002FH
	l	er2,	-8[fp]
	add	er2,	#1 
	mov	r0,	#0ffh
	mov	r1,	#00h
	mov	er2,	er2
	beq	_$M9
_$M10 :
	srlc	r0,	#01h
	sra	r1,	#01h
	add	er2,	#-1
	bne	_$M10
_$M9 :
	xor	r0,	#0ffh
	st	r0,	-13[fp]

;;        if (invert) {
CLINEA 0000H 0001H 0049H 0009H 0015H
	l	r0,	20[fp]
	beq	_$L23
CBLOCK 191 12 73

;;            *(mem_address + end_byte) ^= end_mask;  // XOR để invert các bit
CLINEA 0000H 0001H 004AH 000DH 0050H
	l	er0,	-6[fp]
	add	er0,	er8
	l	r2,	r10:[er0]
	l	r3,	-13[fp]
	xor	r2,	r3
	st	r2,	DSR:[er0]
CBLOCKEND 191 12 75
	bal	_$L25
_$L23 :

;;        } else {
CLINEA 0000H 0000H 004BH 0009H 0010H
CBLOCK 191 13 75

;;            *(mem_address + end_byte) = (*(mem_address + end_byte) & ~end_mask) | (pattern & end_mask);  // Đặt các bit theo `pattern`
CLINEA 0000H 0001H 004CH 000DH 008AH
	l	er0,	-6[fp]
	add	er0,	er8
	l	r3,	-13[fp]
	xor	r3,	#0ffh
	l	r4,	r10:[er0]
	and	r3,	r4
	mov	r4,	r11
	l	r5,	-13[fp]
	and	r4,	r5
	or	r4,	r3
	st	r4,	DSR:[er0]
CBLOCKEND 191 13 77

;;        }
CLINEA 0000H 0000H 004DH 0009H 0009H
_$L25 :
CBLOCKEND 191 6 78
CBLOCKEND 191 2 79

;;}
CLINEA 0000H 0001H 004FH 0001H 0001H
	b	__regpopu8lw
CBLOCKEND 191 1 79
CFUNCTIONEND 191


	rseg $$set_bits_old$main
CFUNCTION 192

_set_bits_old	:
CBLOCK 192 1 81

;;void set_bits_old(uint8_t *mem_address, int start_bit, int num_bits, byte color, byte invert) {
CLINEA 0000H 0001H 0051H 0001H 005FH
	push	lr
	bl	__regpushu8lw
	add	sp,	#-016
	mov	r11,	r3
	mov	er8,	er0
	mov	r10,	r2
CBLOCK 192 2 81
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
CLINEA 0000H 0001H 0053H 0005H 0023H
	l	er0,	16[fp]
	mov	er2,	#8 
	bl	__idivu8lw
	mov	er6,	er0
	st	er0,	-2[fp]

;;    int start_offset = start_bit % 8;
CLINEA 0000H 0001H 0054H 0005H 0025H
	l	er0,	16[fp]
	mov	er2,	#8 
	bl	__imodu8lw
	st	er0,	-4[fp]

;;    int end_byte = end_bit / 8;
CLINEA 0000H 0001H 0057H 0005H 001FH
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
CLINEA 0000H 0001H 0058H 0005H 0021H
	mov	er0,	er4
	mov	er2,	#8 
	bl	__imodu8lw
	st	er0,	-8[fp]

;;    byte color_mask = color;// ? 0xFF : 0x00;
CLINEA 0000H 0001H 005DH 0005H 002DH
	st	r11,	-9[fp]

;;    if (start_byte == end_byte) {
CLINEA 0000H 0001H 0060H 0005H 0021H
	cmp	er6,	bp
	bne	_$L27
CBLOCK 192 3 96

;;        mask = ((1 << num_bits) - 1) << (8 - start_offset - num_bits);
CLINEA 0000H 0001H 0062H 0009H 0046H
	mov	er0,	#1 
	l	er2,	18[fp]
	beq	_$M12
_$M13 :
	sllc	r1,	#01h
	sll	r0,	#01h
	add	er2,	#-1
	bne	_$M13
_$M12 :
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
	beq	_$M14
_$M15 :
	sllc	r3,	#01h
	sll	r2,	#01h
	add	er0,	#-1
	bne	_$M15
_$M14 :
	st	r2,	-10[fp]

;;        if (invert) {
CLINEA 0000H 0001H 0063H 0009H 0015H
	l	r0,	20[fp]
	beq	_$L29
CBLOCK 192 4 99

;;            *(mem_address + start_byte) ^= mask;  // XOR để invert bit
CLINEA 0000H 0001H 0064H 000DH 0049H
	l	er0,	-2[fp]
	add	er0,	er8
	l	r2,	r10:[er0]
	l	r3,	-10[fp]
	xor	r2,	r3
	st	r2,	DSR:[er0]
CBLOCKEND 192 4 101
	bal	_$L31
_$L29 :

;;        } else {
CLINEA 0000H 0000H 0065H 0009H 0010H
CBLOCK 192 5 101

;;            *(mem_address + start_byte) = (*(mem_address + start_byte) & ~mask) | (color_mask & mask);  // OR để đặt bit với màu sắc
CLINEA 0000H 0001H 0066H 000DH 008FH
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
CBLOCKEND 192 5 103

;;        }
CLINEA 0000H 0000H 0067H 0009H 0009H
_$L31 :
CBLOCKEND 192 3 104
	b	_$L47
_$L27 :

;;    } else {
CLINEA 0000H 0000H 0068H 0005H 000CH
CBLOCK 192 6 104

;;        start_mask = 0xFF >> start_offset;
CLINEA 0000H 0001H 006AH 0009H 002AH
	mov	r0,	#0ffh
	mov	r1,	#00h
	l	er2,	-4[fp]
	beq	_$M16
_$M17 :
	srlc	r0,	#01h
	sra	r1,	#01h
	add	er2,	#-1
	bne	_$M17
_$M16 :
	st	r0,	-11[fp]

;;        if (invert) {
CLINEA 0000H 0001H 006BH 0009H 0015H
	l	r0,	20[fp]
	beq	_$L33
CBLOCK 192 7 107

;;            *(mem_address + start_byte) ^= start_mask;  // XOR để invert bit
CLINEA 0000H 0001H 006CH 000DH 004FH
	l	er0,	-2[fp]
	add	er0,	er8
	l	r2,	r10:[er0]
	l	r3,	-11[fp]
	xor	r2,	r3
	st	r2,	DSR:[er0]
CBLOCKEND 192 7 109
	bal	_$L35
_$L33 :

;;        } else {
CLINEA 0000H 0000H 006DH 0009H 0010H
CBLOCK 192 8 109

;;            *(mem_address + start_byte) = (*(mem_address + start_byte) & ~start_mask) | (color_mask & start_mask);  // OR để đặt bit với màu sắc
CLINEA 0000H 0001H 006EH 000DH 009BH
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
CBLOCKEND 192 8 111

;;        }
CLINEA 0000H 0000H 006FH 0009H 0009H
_$L35 :

;;        for (i = start_byte + 1; i < end_byte; i++) {
CLINEA 0000H 0001H 0072H 000EH 0020H
	l	er0,	-2[fp]

;;        for (i = start_byte + 1; i < end_byte; i++) {
CLINEA 0000H 0000H 0072H 0022H 002EH
	bal	_$L41

;;        for (i = start_byte + 1; i < end_byte; i++) {
CLINEA 0000H 0000H 0072H 0030H 0032H
_$L38 :
CBLOCK 192 9 114

;;            if (invert) {
CLINEA 0000H 0001H 0073H 000DH 0019H
	l	r0,	20[fp]
	beq	_$L42
CBLOCK 192 10 115

;;                *(mem_address + i) ^= 0xFF;  // XOR toàn bộ byte để invert
CLINEA 0000H 0001H 0074H 0011H 0050H
	l	er0,	-14[fp]
	add	er0,	er8
	l	r2,	r10:[er0]
	xor	r2,	#0ffh
	st	r2,	DSR:[er0]
CBLOCKEND 192 10 117
	bal	_$L44
_$L42 :

;;            } else {
CLINEA 0000H 0000H 0075H 000DH 0014H
CBLOCK 192 11 117

;;                *(mem_address + i) = color_mask;  // Đặt toàn bộ byte thành `color`
CLINEA 0000H 0001H 0076H 0011H 005AH
	l	er0,	-14[fp]
	add	er0,	er8
	l	r3,	-9[fp]
	st	r3,	r10:[er0]
CBLOCKEND 192 11 119

;;            }
CLINEA 0000H 0000H 0077H 000DH 000DH
_$L44 :
CBLOCKEND 192 9 120

;;        for (i = start_byte + 1; i < end_byte; i++) {
CLINEA 0000H 0000H 0072H 0030H 0032H
	l	er0,	-14[fp]

;;        for (i = start_byte + 1; i < end_byte; i++) {
CLINEA 0000H 0000H 0072H 0022H 002EH
_$L41 :
	add	er0,	#1 
	st	er0,	-14[fp]
	l	er2,	-6[fp]
	cmp	er0,	er2
	blts	_$L38

;;        end_mask = ~(0xFF >> (end_offset + 1));
CLINEA 0000H 0001H 007BH 0009H 002FH
	l	er2,	-8[fp]
	add	er2,	#1 
	mov	r0,	#0ffh
	mov	r1,	#00h
	mov	er2,	er2
	beq	_$M18
_$M19 :
	srlc	r0,	#01h
	sra	r1,	#01h
	add	er2,	#-1
	bne	_$M19
_$M18 :
	xor	r0,	#0ffh
	st	r0,	-15[fp]

;;        if (invert) {
CLINEA 0000H 0001H 007CH 0009H 0015H
	l	r0,	20[fp]
	beq	_$L45
CBLOCK 192 12 124

;;            *(mem_address + end_byte) ^= end_mask;  // XOR để invert bit
CLINEA 0000H 0001H 007DH 000DH 004BH
	l	er0,	-6[fp]
	add	er0,	er8
	l	r2,	r10:[er0]
	l	r3,	-15[fp]
	xor	r2,	r3
	st	r2,	DSR:[er0]
CBLOCKEND 192 12 126
	bal	_$L47
_$L45 :

;;        } else {
CLINEA 0000H 0000H 007EH 0009H 0010H
CBLOCK 192 13 126

;;            *(mem_address + end_byte) = (*(mem_address + end_byte) & ~end_mask) | (color_mask & end_mask);  // OR để đặt bit với màu sắc
CLINEA 0000H 0001H 007FH 000DH 0093H
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
CBLOCKEND 192 13 128

;;        }
CLINEA 0000H 0000H 0080H 0009H 0009H
_$L47 :
CBLOCKEND 192 6 129
CBLOCKEND 192 2 130

;;}
CLINEA 0000H 0001H 0082H 0001H 0001H
	b	__regpopu8lw
CBLOCKEND 192 1 130
CFUNCTIONEND 192


	rseg $$render_pattern$main
CFUNCTION 193

_render_pattern	:
CBLOCK 193 1 133

;;void render_pattern(int x1, int y1, int x2, int y2, const byte* pattern, int size , byte invert) {
CLINEA 0000H 0001H 0085H 0001H 0062H
	push	lr
	bl	__regpushu8lw
	add	sp,	#-04
	mov	er8,	er0
CBLOCK 193 2 133
CRET 0010H
CARGUMENT 47H 0002H 0028H "x1" 02H 00H 01H
CARGUMENT 47H 0002H 0025H "y1" 02H 00H 01H
CARGUMENT 43H 0002H 0010H "x2" 02H 00H 01H
CARGUMENT 43H 0002H 0012H "y2" 02H 00H 01H
CARGUMENT 60H 0003H 0014H "pattern" 04H 03H 00H 00H 00H
CARGUMENT 43H 0002H 0018H "size" 02H 00H 01H
CARGUMENT 42H 0001H 001AH "invert" 02H 00H 00H
CLOCAL 6AH 0003H 0000H 0002H "mem_address" 04H 03H 00H 00H 00H
CLOCAL 43H 0002H 0004H 0002H "i" 02H 00H 01H
CLOCAL 4BH 0002H 0000H 0002H "y" 02H 00H 01H
CLOCAL 43H 0002H 0002H 0002H "sel" 02H 00H 01H

;;	int sel = 0;
CLINEA 0000H 0001H 0089H 0002H 000DH
	mov	er0,	#0 
	st	er0,	-2[fp]

;;	for (i = y1; i <= y2; i++) {
CLINEA 0000H 0001H 008AH 0002H 001DH
	st	er2,	-4[fp]
	bal	_$L54
_$L51 :
CBLOCK 193 3 138

;;		set_bits_old(mem_address + i * 0x20, x1, x2 - x1, pattern[sel], invert);
CLINEA 0000H 0001H 008CH 0003H 004AH
	l	r0,	26[fp]
	push	r0
	push	er4
	push	er8
	l	er0,	-2[fp]
	l	er2,	20[fp]
	add	er0,	er2
	l	r2,	22[fp]
	l	r3,	r2:[er0]
	mov	er0,	er6
	add	r0,	#020h
	addc	r1,	#0f8h
	mov	r2,	#00h
	bl	_set_bits_old
	add	sp,	#6 

;;		deref(0xD180) = pattern[sel];
CLINEA 0000H 0001H 008DH 0003H 001FH
	l	er0,	-2[fp]
	l	er2,	20[fp]
	add	er0,	er2
	l	r2,	22[fp]
	l	r0,	r2:[er0]
	st	r0,	00h:0d180h

;;		deref(0xD181) = sel;
CLINEA 0000H 0001H 008EH 0003H 0016H
	l	r0,	-2[fp]
	st	r0,	00h:0d181h

;;		if (sel == size) {
CLINEA 0000H 0001H 008FH 0003H 0014H
	l	er0,	24[fp]
	l	er2,	-2[fp]
	cmp	er0,	er2
	bne	_$L55
CBLOCK 193 4 143

;;			sel = 0;
CLINEA 0000H 0001H 0090H 0004H 000BH
	mov	er0,	#0 
CBLOCKEND 193 4 145
	bal	_$L57
_$L55 :

;;		} else {
CLINEA 0000H 0000H 0091H 0003H 000AH
CBLOCK 193 5 145

;;			sel++;
CLINEA 0000H 0000H 0092H 0004H 0009H
	mov	er0,	er2
	add	er0,	#1 
CBLOCKEND 193 5 147

;;		}
CLINEA 0000H 0000H 0093H 0003H 0003H
_$L57 :
	st	er0,	-2[fp]
CBLOCKEND 193 3 148

;;	for (i = y1; i <= y2; i++) {
CLINEA 0000H 0000H 008AH 0002H 001DH
	l	er0,	-4[fp]
	add	er0,	#1 
	st	er0,	-4[fp]
_$L54 :

;;	for (i = y1; i <= y2; i++) {
CLINEA 0000H 0000H 008AH 0022H 002EH
	l	er0,	16[fp]
	sub	r0,	r8
	subc	r1,	r9
	mov	er4,	er0
	l	er0,	-4[fp]
	sllc	r1,	#05h
	sll	r0,	#05h
	mov	er6,	er0
	l	er0,	-4[fp]
	l	er2,	18[fp]
	cmp	er0,	er2
	bles	_$L51
CBLOCKEND 193 2 150

;;}
CLINEA 0000H 0001H 0096H 0001H 0001H
	b	__regpopu8lw
CBLOCKEND 193 1 150
CFUNCTIONEND 193


	rseg $$render_rect$main
CFUNCTION 194

_render_rect	:
CBLOCK 194 1 152

;;void render_rect(int x1, int y1, int x2, int y2, byte color, byte invert) {
CLINEA 0000H 0001H 0098H 0001H 004BH
	push	lr
	bl	__regpushu8lw
	add	sp,	#-02
	mov	er10,	er2
	mov	er8,	er0
CBLOCK 194 2 152
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
CLINEA 0000H 0001H 009CH 0002H 0016H
	l	r0,	20[fp]
	mov	r2,	#0ffh
	mul	er0,	r2
	st	r0,	20[fp]

;;	for (i = y1; i <= y2; i++) {
CLINEA 0000H 0001H 009DH 0002H 001DH
	st	er10,	-2[fp]
	bal	_$L64
_$L61 :
CBLOCK 194 3 157

;;		set_bits_old(mem_address + i * 0x20, x1, x2 - x1, color, invert);
CLINEA 0000H 0001H 009FH 0003H 0043H
	l	r0,	22[fp]
	push	r0
	push	er4
	push	er8
	l	r3,	20[fp]
	mov	er0,	er6
	add	r0,	#020h
	addc	r1,	#0f8h
	mov	r2,	#00h
	bl	_set_bits_old
	add	sp,	#6 
CBLOCKEND 194 3 160

;;	for (i = y1; i <= y2; i++) {
CLINEA 0000H 0000H 009DH 0002H 001DH
	l	er0,	-2[fp]
	add	er0,	#1 
	st	er0,	-2[fp]
_$L64 :

;;	for (i = y1; i <= y2; i++) {
CLINEA 0000H 0000H 009DH 0022H 002EH
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
	bles	_$L61
CBLOCKEND 194 2 162

;;}
CLINEA 0000H 0001H 00A2H 0001H 0001H
	b	__regpopu8lw
CBLOCKEND 194 1 162
CFUNCTIONEND 194


	rseg $$main$main
CFUNCTION 195

_main	:
CBLOCK 195 1 165

;;int main() {
CLINEA 0000H 0001H 00A5H 0001H 000CH
	mov	fp,	sp
	add	sp,	#-08
CBLOCK 195 2 165
CLOCAL 42H 0007H 0008H 0002H "pattern" 05H 01H 07H 00H 00H 00H
CLOCAL 4BH 0002H 0000H 0002H "k" 02H 00H 01H
CLOCAL 4BH 0002H 0000H 0002H "r" 02H 00H 01H

;;			0xFF, 0xC3, 0xA5, 0x99, 0xA5, 0xC3, 0xFF
CLINEA 0000H 0001H 00AAH 0004H 002BH
	mov	r0,	#0ffh
	st	r0,	-8[fp]
	mov	r0,	#0c3h
	st	r0,	-7[fp]
	mov	r0,	#0a5h
	st	r0,	-6[fp]
	mov	r0,	#099h
	st	r0,	-5[fp]
	mov	r0,	#0a5h
	st	r0,	-4[fp]
	mov	r0,	#0c3h
	st	r0,	-3[fp]
	mov	r0,	#0ffh
	st	r0,	-2[fp]

;;    memset((void *)0xD000, 0x00, 0x15D3);  // Clear some memory region
CLINEA 0000H 0001H 00AFH 0005H 0046H
	mov	r0,	#0d3h
	mov	r1,	#015h
	push	er0
	mov	er0,	#0 
	push	er0
	mov	r1,	#0d0h
	mov	r2,	#00h
	bl	_memset_f
	add	sp,	#4 

;;    memset((void *)0xf800, 0x00, 0x800);   // Clear another memory region
CLINEA 0000H 0001H 00B0H 0005H 0049H
	mov	r0,	#00h
	mov	r1,	#08h
	push	er0
	mov	er0,	#0 
	push	er0
	mov	r1,	#0f8h
	mov	r2,	#00h
	bl	_memset_f
	add	sp,	#4 

;;    render_pattern(65, 1, 85*2, 21*2, pattern, sizeof(pattern)+2, 0);
CLINEA 0000H 0001H 00BCH 0005H 0045H
	mov	r0,	#00h
	push	r0
	mov	er0,	#9 
	push	er0
	mov	er0,	fp
	add	er0,	#-8
	mov	r2,	#00h
	push	r2
	push	er0
	mov	er0,	#42
	push	er0
	mov	r0,	#0aah
	push	er0
	mov	er2,	#1 
	mov	r0,	#041h
	bl	_render_pattern
	add	sp,	#12

;;    return 0;
CLINEA 0000H 0001H 00BDH 0005H 000DH
CBLOCKEND 195 2 190

;;}
CLINEA 0000H 0000H 00BEH 0001H 0001H
	mov	er0,	#0 
_$$end_of_main :
	bal	$
CBLOCKEND 195 1 190
CFUNCTIONEND 195


	rseg $$wait_AC$main
CFUNCTION 196

_wait_AC	:
CBLOCK 196 1 193

;;void wait_AC() {
CLINEA 0000H 0001H 00C1H 0001H 0010H
CBLOCK 196 2 193

;;	while (deref(0xF040) != 0xFB){
CLINEA 0000H 0000H 00C2H 0001H 0001H
	bal	_$L71

;;	while (deref(0xF040) != 0xFB){
CLINEA 0000H 0000H 00C2H 0002H 001FH
_$L69 :
CBLOCK 196 3 194

;;		deref(0xF046) = 0x10;
CLINEA 0000H 0001H 00C3H 0003H 0017H
	mov	r0,	#010h
	st	r0,	00h:0f046h
CBLOCKEND 196 3 197

;;	while (deref(0xF040) != 0xFB){
CLINEA 0000H 0000H 00C2H 0001H 0001H
_$L71 :

;;	while (deref(0xF040) != 0xFB){
CLINEA 0000H 0000H 00C2H 0022H 002EH
	l	r0,	00h:0f040h
	cmp	r0,	#0fbh
	bne	_$L69

;;	deref(0xF040) = 0xFF;
CLINEA 0000H 0001H 00C6H 0002H 0016H
	mov	r0,	#0ffh
	st	r0,	00h:0f040h

;;	delay(2000);
CLINEA 0000H 0001H 00C7H 0002H 000DH
	mov	r0,	#0d0h
	mov	r1,	#07h
	b	_delay
CBLOCKEND 196 2 200
CLINEA 0000H 0001H 00C8H 0001H 0001H
CBLOCKEND 196 1 200
CFUNCTIONEND 196

	public _board1
	public _set_bits_old
	public _cross
	public _wait_AC
	public _circle
	public _main
	public _getrandom
	public _render_pattern
	public _delay
	public _set_bits
	public _render_rect
	extrn code far : _memset_f
	extrn code : $$start_up

	cseg #00h at 02h
	dw	$$start_up

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
	extrn code : __imodu8lw
	extrn code : __idivu8lw
	extrn code : __uimodu8lw
	extrn code : __regpushu8lw
	extrn code : __regpopu8lw

	end
