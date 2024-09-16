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

press_ac_str		EQU 1B18H
keytable			EQU 83DAH
startup_str_1		EQU 30F00H
startup_str_1_len	EQU 13H

__return			EQU 1:0EA6H
_lrstack			EQU 2:9416H
_$$SP	EQU	0F000h


;cseg	#0	at	0000h
cseg	#3	at	1440h


_entry:
	b _main
	
_render:
	push	xr4
	mov	er2,	er0 ;er2: Base
	mov	er4,	#0 ;er4: screen counter
	mov	er6,	#0 ;er6: base counter
	

_$L3:
	add	er4,	#1 ;add screen counter
	mov	er0,	er4
	
	and	r0,	#01fh	;Compare if end of screen, then skip
	and	r1,	#00h
	cmp	r0,	#018h
	cmpc	r1,	#00h
	bne	_$L7	;If not end, skip next code
	add	er4,	#8 ;Adding screen counter

_$L7:
	mov	er0,	er2
	add	er0,	er6 ;Adding base with offset
	l	er0,	r8:[er0] ;Read, can add seg here
	st	er0,	0f820h[er4] ;Store er0 at F820 with offset counter
	
	add	er6,	#1 ;Adding base counter
	cmp	r6,	#0e8h	
	cmpc	r7,	#05h ;Check end of screen
	blt	_$L3 ;If not, loop back
	pop	xr4
	rt ;END OF RENDER
	
_main:	
	mov	r0,	#040h
	mov	r1,	#0eh
	mov r8, #03h
	bl	_render
	mov    r0,    #10h
    mov    r1,    #10h
    bl    _delay
	bl __return
	b _lrstack
	