type(ML620906)
model	large
romwindow 0, 0cfffh

_clear_DDD4			EQU 0:8C60H
_line_print			EQU 0:8F7EH
_render_DDD4		EQU 0:947CH
_render_stat_bar 	EQU 0:94FEH
_delay				EQU 0:9F3AH
_shutdown			EQU 0:9EE8H
_enter				EQU 0:0AC30H
_leave				EQU 0:0AC38H
_hex_byte			EQU 2:4010H
_convert_keycode	EQU 2:9892H
_display_menu		EQU 2:0AD4CH
_display_settings	EQU 2:0D5B8H
_get_keycode		EQU 2:0F5E8H
_bitmap				EQU 0:9846H
_memset				EQU 1:0EB94H

keyat				EQU 0D300H
keytable			EQU 83DAH

_lastbutton			EQU 0D400H

__return			EQU 1:0EA6H
_lrstack			EQU 2:9416H
_$$SP	EQU	0F000h


_addrkey			EQU 0D180h
_hexadr				EQU 0D182h

_printadr			EQU 0D310h

;cseg	#0	at	0000h
cseg	#3	at	1440h

_init:
	mov er0, #0
	st er0, _addrkey
	mov er0, #2
	st er0, _hexadr

	bl _clear_DDD4
	bl _render_DDD4

	mov er0, #0
	lea 0D310h
	st er0, [ea+]
	st er0, [ea+]





_main:
	mov r0, #byte1 keyat
	mov r1, #byte2 keyat

	bl _get_keycode
	mov r0, r0
	bne _has_key_press

	mov er0, #0
	st er0, _lastbutton


	mov r0, #0Eh
	st r0, 0D137h
	mov r0, #16H
	mov r1, #05H
	mov r2, #10h
	mov r3, #0D3h
	bl _line_print
	bl _render_DDD4
	b _main


_has_key_press:
	l er0, keyat
	l er2, _lastbutton
	cmp er0, er2
	gbeq _main

	st er0, _lastbutton
	
	mov r0, #byte1 keyat
	mov r1, #byte2 keyat

	mov r2, #byte1 keytable
	mov r3, #byte2 keytable

	bl _convert_keycode

	mov	er2,	#30h
	cmp	er0,	er2
	st er0, 0D2F0h 
	gblt _main

	mov	er2, #3Fh
	cmp	er0, er2
	gble _handle_key

	st er0, 0D2F0h 

	b _main

_handle_key:
	l er2, _addrkey

	push r0
	bl _hex_byte
	st r1, 0D310H[er2]
	pop r0
	
	add er2, #1
	st er2, _addrkey


_type_key:
	l er2, _hexadr
	l	r1,	0D322H[er2]

	sll	r1,	#4
	and	r0,	#0Fh
	or	r0,	r1

	st r0, 0D322H[er2]
	
	tb _addrkey.0
	bne _not_even
 
	tb _addrkey.1
	bne _div2_not4

_div_4:
	;...
	;resume
	b _end


_not_even:
	mov r0, #-1h
	st r0, 0D330h

	b _main

_div2_not4:
	mov r0, #00h
	st r0, 0D330h


	l er2, _hexadr
	add er2, #-1
	st er2, _hexadr

	b _main

_end:
	brk
