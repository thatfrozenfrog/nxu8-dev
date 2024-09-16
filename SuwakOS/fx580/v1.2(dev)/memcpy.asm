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

press_ac_str		EQU 1B18H
keytable			EQU 83DAH

_lastbutton			EQU 0D400H

__return			EQU 1:0EA6H
_lrstack			EQU 2:9416H
_$$SP	EQU	0F000h


;cseg	#0	at	0000h
cseg	#3	at	1440h

_entry:
	b _main


_cpy:

    push     lr
    push    r6
    lea    [er0]
    push     er4
    mov    r5,    #0E7h
_cpy_loop:
    l    r6,    3:[ea+]
    st    r6,    [er4]
    add    er2,    #-1
    add    er4,    #1
    cmp    r2,    #00h
    cmpc    r3,    #00h
    bne    _cpy_loop
_cpy_end:
    pop    r6
    pop    er4
    pop    pc
	

_main:	
		
	LEA 0005H
	PUSH EA
	MOV ER2, #00H
	MOV R0, #00H
	MOV R1, #0D5H
	BL _memset
	pop er0
	mov	r2,	#037h
	mov	r3,	#02h
	mov	r0,	#040h
	mov	r1,	#0eh
	bl	_cpy 

	bl _clear_DDD4
	mov r0, #00h
	mov r1, #0e7h
	push er0
	mov r2, #048h
	mov r3, #3Fh
	mov r1, #0h
	mov r0, #078h
	bl _bitmap
	pop er0
	bl _render_DDD4


	mov	r2,	#037h
	mov	r3,	#00h
	mov	r0,	#080h
	mov	r1,	#010h
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
	mov r3, #0e7h
	bl _line_print
	bl _render_DDD4

	
	

	
	;return stack
	mov    r0,    #10h
    mov    r1,    #10h
    bl    _delay
	
$pinscreen:
	mov	r2,	#076h
	mov	r3,	#02h
	mov	r0,	#090h
	mov	r1,	#010h
	bl	_cpy

	bl _clear_DDD4
	mov r0, #00h
	mov r1, #0e7h
	push er0
	mov r2, #050h
	mov r3, #3Fh
	mov er0, #0h
	bl _bitmap
	pop er0
	bl _render_DDD4
	
	mov	r2,	#09h
	mov	r3,	#00h
	mov	r0,	#020h
	mov	r1,	#013h
	bl	_cpy
	
	mov r0, #0Eh
	st r0, 0D137H
	mov r0, #4DH
	mov r1, #08H
	mov r2, #00H
	mov r3, #0e7h
	bl _line_print
	bl _render_DDD4
	
	
$pin:

	mov r12, #00h
	mov r13, #0D5h
	mov	r2,	#06h
	mov	r3,	#00h
	mov	r0,	#010h
	mov	r1,	#013h
	bl	_cpy

	
$L:
	l r4, 0D400H
	bl _CheckButton
	l r0, 0D400H
	cmp r0, r4
	beq $L

	st r0, [bp]
	add bp, #1
	cmp r12, #05h
	beq $L1
	
	mov r0, #00H
	mov r1, #30H
	mov r2, #00H
	mov r3, #0d5h
	bl _line_print
	bl _render_DDD4	
	
	b $L
$L1:
	mov r0, #5h
	mov r1, #00h
	bl _compare
	cmp r4, #01h
	beq $L2
	
	b $pinscreen
$L2:
	bl __return
	b _lrstack
	


	

_CheckButton:
    mov    r2,    #00h
    mov    r3,    #080h
_$L3 :
    st    r3,    0f046h
    mov    r1,    #080h
_$L9 :
    l    r0,    0f040h
    and    r0,    r1
    bne    _$L13
    l    r0,    0D400h
    cmp    r0,    r2
    beq    _$L15
    mov    r0,    r2
    st    r2,    0D400h
    rt
_$L15 :
    mov    r0,    #0ffh
    rt

_$L13 :
    add    r2,    #01h
    srl    r1,    #01h
    mov    r0,    r1
    bne    _$L9
    srl    r3,    #01h
    mov    r0,    r3
    bne    _$L3
    mov    r0,    #0ffh
    rt
	
	
_compare:
	l r2, 0D4FFh[er0]
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