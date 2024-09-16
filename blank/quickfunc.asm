;; Compile Options : /TML620906 /ML /Om /Zc /Orp /Faquickfunc.asm /Lv 
;; Version Number  : Ver.3.66.2
;; File Name       : quickfunc.c

	type (ML620906) 
	model large, near
	$$NINITVAR segment data 2h #0h
	$$NINITTAB segment table 2h any
	$$FCODquickfunc segment code 2h any
	STACKSEG 0400h
CVERSION 3.66.2
CFILE 0001H 0000000BH "E:\\ccu8\\blank\\base.h"
CFILE 0000H 00000013H "E:\\ccu8\\blank\\quickfunc.c"

	rseg $$FCODquickfunc

_copytox	:

;;void copytox(word addr, char* where) {
;;*****************************************
;;	register/stack information
;;*****************************************
;;*****************************************


;;}
	rt


_main	:

;;void main(void) {
;;*****************************************
;;	register/stack information
;;*****************************************
;;*****************************************


;;    copytox(0xE700, addr);
	l	er2,	NEAR _addr
	mov	r0,	#00h
	mov	r1,	#0e7h
	bl	_copytox

;;}
_$$end_of_main :
	bal	$

	public _addr
	public _hello
	public _copytox
	public _main
	extrn code : $$start_up

	cseg #00h at 02h
	dw	$$start_up

	rseg $$NINITTAB
	DB	"SuwakOS v2.1", 00H
	align
	dw	_hello

	rseg $$NINITVAR
_hello :
	ds	0dh
	align
_addr :
	ds	02h

	end
