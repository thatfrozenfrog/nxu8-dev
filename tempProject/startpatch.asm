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
_read_key			EQU 1:0F24CH

_waitkey 			EQU 2:4080H
__return			EQU 1:0EA6H
_lrstack			EQU 2:9416H
_$$SP	EQU	0F000h


;cseg	#0	at	0000h
cseg	#3	at	1440h

_entry:
	b _main

_main:
	bl	_get_keycode
	;mov	r0,	r0
	bne	_$has_key_press
	;mov er0, #0000h
	;st	er0, 0D150h	
	
	bal _main
	

_$has_key_press:
	bl _read_key
	st	er0, 0D150h
	pop pc