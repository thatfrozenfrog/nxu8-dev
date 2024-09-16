type(ML620906)
model	large
romwindow 0, 0cfffh

_clear_DDD4		EQU 0:8C60H
_line_print		EQU 0:8F7EH
_render_DDD4		EQU 0:947CH
_render_stat_bar 	EQU 0:94FEH
_delay			EQU 0:9F3AH
_shutdown		EQU 0:9EE8H
_enter			EQU 0:0AC30H
_leave			EQU 0:0AC38H
_hex_byte		EQU 2:4010H
_convert_keycode	EQU 2:9892H
_display_menu		EQU 2:0AD4CH
_display_settings	EQU 2:0D5B8H
_get_keycode		EQU 2:0F5E8H
fill_screen		EQU 0:8C0CH
_reset_ko		EQU 0:0A16AH
press_ac_str		EQU 1B18H
keytable		EQU 83DAH
startup_str_1		EQU 30F00H
startup_str_1_len	EQU 13H
last_ki_ko		EQU 0D150h

_return_flow EQU 2:9416H

cseg	#3	at	0E40h


mov r12, #0h
mov r13, #0D8h

_$main_loop:
	mov	er0,	#0
	st	er0,	[bp]
	mov	er0,	bp
	;bl	_get_keycode_fixed
	bl _get_keycode
	mov	r0,	r0
	bne	_$has_key_press
	mov	er0,	#0
	st	er0,	last_ki_ko
	bal	_$main_loop

_get_keycode_fixed:
    push    lr
    bl    _enter
    mov    er8,    er0
    mov    r4,    #1
    mov    r1,    #1
    mov    r3,    #1
_$get_key_loop:
    st    r1,    0F046H
    mov    r2,    #0
    l    r0,    0F040H
    st    r2,    0F046H
    mov    r2,    r0
    cmp    r0,    #0FFh
    beq    _$continue
    st    r1,    01h[er8]
    xor    r0,    #0FFh
    st    r0,    [er8]
    bal    _$get_key_ret
_$continue:
    sll    r1,    #1
    add    r3,    #1
    cmp    r3,    #7
    ble    _$get_key_loop
    mov    r4,    #0
_$get_key_ret:
	bl	_reset_ko
	mov	r0,	r4
	b	_leave
	

_$has_key_press:
	l	er0,	[bp]
	l	er2,	0D150h
	cmp	er0,	er2
	gbeq	_$main_loop
	st	er0,	0D150h
	mov	r0,	#0
	st	r0,	04h[bp]
	mov	er0,	0D150h
	mov	r2,	#BYTE1 keytable
	mov	r3,	#BYTE2 keytable
	bl	_convert_keycode	;2:52DC
	st er0, 0D10Eh
	
	gjmp _$main_loop
	
