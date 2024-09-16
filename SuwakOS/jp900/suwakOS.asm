type(ML620906)
model	large
romwindow 0, 0cfffh

_clear_DDD4			EQU 0:0B6ACH
_line_print			EQU 0:0B9CAH
_line_print_col0   EQU 0:0B9C8H
_render_DDD4		EQU 0:0BEB0H
_render_stat_bar 	EQU 0:0BF32H
_delay				EQU 0:0C95CH
_shutdown			EQU 0:0C90AH
_enter				EQU 0:0D8B8H
_leave				EQU 0:0D8C0H
_hex_byte			EQU 2:41DAH
_convert_keycode	EQU 3:045EH
_display_menu		EQU 2:06E0H
_display_settings	EQU 3:5D4AH
_get_keycode		EQU 3:86A2H
_bitmap				EQU 0:0C27AH
_memset				EQU 2:7B6CH

_reset_ko		EQU 0:0CB8CH

press_ac_str		EQU 1B18H
keytable			EQU 0A8ECH
last_ki_ko		EQU 0D150h

_lastbutton			EQU 0D400H

__return			EQU 1:0EA0H
_lrstack			EQU 3:003EH
_$$SP	EQU	0F000h
cseg	#3	at	0A170h
_entry:
	bl __return
	b _main




_cpy:
_loop:
	l r6, 3:[er0]
	add er0, #1
	st r6, [ea+]
	add er2, #-1
	bne _loop
	rt


_wait_AC:
	push	lr
	mov	r4,	#0
	mov	r5,	#2
_$waitac_loop:
	mov	r0,	#10h
	st	r0,	0F046h
	mov	er0,	#3Fh
	tb	0F040h.2
	beq	_$waitac_ret
	bl	_delay
	add	er4,	#-1
	bne	_$waitac_loop

_$waitac_ret:
	mov    r0,    #10h
    mov    r1,    #10h
    bl    _delay
	pop	pc

_main:
	LEA 0E700h
	mov	er2, #03Fh
	mov	r0,	#080h
	mov	r1,	#0FFh
	bl	_cpy 
	mov r0, #0Eh
	st r0, 0D137H
	mov r0, #16H
	mov r1, #05H
	mov r2, #00H
	mov r3, #0e7h
	bl _line_print
	mov r0, #0Ah
	st r0, 0D137H
	mov r0, #63H
	mov r1, #08H
	mov r2, #08H
	bl _line_print
	mov r1, #20
	mov r2, #00Dh
	bl _line_print_col0
	mov r1, #30
	mov r2, #02Eh
	bl _line_print_col0
	bl _render_DDD4
	bl _wait_AC
	
	
	LEA 0E700h
	mov	r2,	#076h
	mov	r3,	#02h
	mov	r0,	#00Ah
	mov	r1,	#0FDh
	bl	_cpy

_startPin:
	LEA 00FFH
	PUSH EA
	MOV ER2, #00H
	MOV R0, #0F0H
	MOV R1, #0D7H
	BL _memset
	
	bl _clear_DDD4
	
	mov r0, #00h
	mov r1, #0e7h
	push er0
	mov r2, #050h
	mov r3, #3Fh
	mov er0, #0h
	bl _bitmap
	pop er0
	
	LEA 0E700h
	mov	er2, #10
	mov	r0,	#0F0h
	mov	r1,	#0FCh
	bl	_cpy
	
	mov r0, #0Eh
	st r0, 0D137H
	mov r0, #4DH
	mov r1, #08H
	mov r2, #00H
	mov r3, #0e7h
	bl _line_print
	
	bl _render_DDD4

	gjmp _askPin
	
	
_askPin:
mov r12, #0h
mov r13, #0D8h
mov r6, #0F0h
mov r7, #0D7h

_$pin_loop:
	
	mov	er0,	#0
	st	er0,	[bp]
	st	er0, 0DA70h
	mov	er0,	bp
	bl _get_keycode_fixed
	mov	r0,	r0
	gbne	_$has_key_press
	mov	er0,	#0
	st	er0,	last_ki_ko
	bal	_$pin_loop
	
_add_key:
	l er0, 0DA70h
	st r0, [er6]
	add er6, #1
	
	
	mov r0, #0Ah
	st r0, 0D137H
	mov r0, #4DH
	mov r1, #030H
	mov r2, #0f0H
	mov r3, #0d7h
	bl _line_print
	
	bl _render_DDD4
	
	cmp r6, #0FAh
	gbeq _$pinstop
	
	bal	_$pin_loop

_$pinstop:
	LEA 0E700h
	mov	er2, #10
	mov	r0,	#000h
	mov	r1,	#0FDh
	bl	_cpy

	mov er0, #10
	bl _compare
	cmp r4, #01h
	gbeq _finish
	gjmp _startPin


_finish: ;Finished getting PIN
	b _lrstack ;End of this large function





_$has_key_press:
	l	er0,	[bp]
	l	er2,	0D150h
	cmp	er0,	er2
	gbeq	_$pin_loop
	st	er0,	0D150h
	mov	r0,	#0
	st	r0,	04h[bp]
	mov	er0,	bp
	mov	r2,	#BYTE1 keytable
	mov	r3,	#BYTE2 keytable
	bl	_convert_keycode
	cmp r0, #0h
	gbeq _$pin_loop
	st er0, 0DA70h
	gjmp _add_key


_compare:
	l r2, 0D7EFh[er0]
	l r3, 0E6FFh[er0]
	cmp r2, r3
	bne $C3
$C1:
	add er0, #-1H
	cmp r0, #0h
	cmpc r1, #0h
	beq $C2
	b _compare
$C2:
	mov r4, #1h
	rt
$C3:
	mov r4, #0h
	rt
	

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