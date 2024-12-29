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


_waitkey			EQU 1:0F24CH


keyat				EQU 0D800H
keytable			EQU 83DAH

_lastbutton			EQU 0D400H

__return			EQU 1:0EA6H
_lrstack			EQU 2:9416H
_$$SP	EQU	0D500h


_addrkey			EQU 0D180h
_hexadr				EQU 0D182h

_printadr			EQU 0D810h


cseg	#3	at	1440h


_main:
	mov r14, #0h
	mov r15, #0D5h
	mov sp, er14
	mov bp, sp
	LEA _some_string

	mov er2, #2
	mov er0, bp
	bl _quickcpy
	brk

_some_string:
	db "Hello, world!", 0

_quickcpy:
		
		;dw 0E33Fh
	l qr8, 3:[EA+]
	push ea
	lea [er0]
	st qr8, 0:[ea]
	add er0, #8
	pop ea

	add er2, #-1
	bc nz, _quickcpy
	rt