type(ML620906)
model	large
romwindow 0, 0cfffh

;This file is already configured for fx-991cnx.
;Modify the cseg, tseg and EQU directives for other models.
;label _program_main is the entry point of the core.

key_identifier	EQU	0D110h
submode	EQU	0D112h
screen_state	EQU	0D113h
cursor_blink	EQU	0D116h
cursor_scr_pos	EQU	0D158h
cursor_size	EQU	0D168h
font_size	EQU	0D137h
font_color	EQU	0D138h
curr_buffer	EQU	0D139h
last_ki_ko	EQU	0D150h
cursor_pos	EQU	0D155h
screen_buf	EQU	0DDD4h

;set to 0 when opening the menu.
undefined1	EQU	0D142h
undefined2	EQU	0D164h
undefined3	EQU	0D165h

keycode_comp	EQU	0775Ch
keycode_shift	EQU	03BF2h
keycode_alpha	EQU	0198Eh

;settings for program mode
inst_insert	EQU	0D16Bh			;0-overwrite 1-move till FF instruction 2-move till end addr
start_addr	EQU	0D100h
end_addr	EQU	0D102h

cseg	#2	at	0BEF0h

_program:
	push	lr
	push	xr4
	mov	r0,	#0
	l	er2,	start_addr
	bl	_program_mode
	pop	xr4
	pop	pc

;fp-2:current line fp-10 - fp-4:pointer to inst line 1 to 4 fp-12:current decoding base
;hex mode: fp-2:current addr fp-4: base addr fp-5:input sign fp-6:input buffer
;parameters: r0-normal mode or addr select mode er2-initial addr
;return value: er2-current addr(only in addr select mode)
_program_mode:
	push	lr
	push	qr8
	push	xr4
	push	r0
	mov	fp,	sp
	add	sp,	#-20h
	mov	bp,	sp

	mov	er0,	#0
	st	er0,	-02[fp]
	mov	r0,	#1
	st	r0,	submode
	mov	er0,	er2
	st	er0,	-0Ch[fp]
	gjmp	_$repaint

_$main_loop:
	mov	er0,	#0
	st	er0,	[bp]
	mov	er0,	bp
	bl	_get_keycode_fixed
	mov	r0,	r0
	bne	_$has_key_press
	mov	er0,	#0
	st	er0,	last_ki_ko
	bal	_$main_loop

_$has_key_press:
	l	er0,	[bp]
	l	er2,	last_ki_ko
	bne	_$main_loop
	st	er0,	last_ki_ko
	mov	er0,	bp
	tb	key_identifier.2
	beq	_$L23
	mov	r2,	#byte1 keycode_alpha
	mov	r3,	#byte2 keycode_alpha
	bal	_$L25
_$L23:
	tb	key_identifier.3
	beq	_$L24
	mov	r2,	#byte1 keycode_shift
	mov	r3,	#byte2 keycode_shift
	bal	_$L25
_$L24:
	mov	r2,	#byte1 keycode_comp
	mov	r3,	#byte2 keycode_comp
_$L25:
	bl	_convert_keycode
	cmp	r0,	#28h
	cmpc	r1,	#0FCh
	gbeq	_$alpha
	cmp	r0,	#29h
	cmpc	r1,	#0FCh
	gbeq	_$shift
	mov	er2,	er0
	mov	r0,	#0
	st	r0,	key_identifier
	bl	_render_stat_bar
	tb	submode.0
	beq	_$hex_mode
	cmp	r3,	#0FCh
	bne	_$main_loop
	cmp	r2,	#1Ch
	gbeq	_$inst_up
	cmp	r2,	#1Dh
	gbeq	_$inst_down
	cmp	r2,	#1Eh
	gbeq	_$inst_right
	cmp	r2,	#20h
	gbeq	_$base_up
	cmp	r2,	#21h
	gbeq	_$base_down
	cmp	r2,	#22h
	gbeq	_$switch_mode_inst
	cmp	r2,	#2Dh
	gbeq	_$exe
_$L34:
	cmp	r2,	#1
	beq	_$optn
	cmp	r2,	#27h
	gbeq	_$shutdown
	cmp	r2,	#24h
	bne	_$main_loop
	l	r0,	[fp]
	bne	_$main_loop
	bl	_menu_handle
	cmp	r0,	#0
	gbne	_$main_ret
	bl	_render_DDD4
	bal	_$main_loop

_$hex_mode:
	mov	er0,	#30h
	cmp	er2,	er0
	blt	_$main_loop
	mov	er0,	#3Fh
	cmp	er2,	er0
	gble	_$hex_type
	cmp	r3,	#0FCh
	bne	_$main_loop
	cmp	r2,	#1Ch
	gbeq	_$hex_up
	cmp	r2,	#1Dh
	gbeq	_$hex_down
	cmp	r2,	#1Eh
	gbeq	_$hex_right
	cmp	r2,	#1Fh
	gbeq	_$hex_left
	cmp	r2,	#20h
	gbeq	_$hex_pageup
	cmp	r2,	#21h
	gbeq	_$hex_pagedown
	cmp	r2,	#23h
	gbeq	_$switch_mode_hex
	cmp	r2,	#2Dh
	gbeq	_$hex_exe
	bal	_$L34

_$optn_ret:
	l	r0,	submode
	cmp	r0,	#1
	gbne	_$hex_repaint
	l	er0,	-0Ah[fp]
	gjmp	_$repaint

_$new_inst:
	l	r0,	inst_insert
	beq	_$L45
	pop	xr0
	bl	_branch_fix
_$L45:
	l	r0,	submode
	cmp	r0,	#1
	gbeq	_$inst_down
	mov	r0,	r4
	mov	r1,	#0
	gjmp	_$change_addr

_$optn:
	l	r0,	[fp]
	gbne	_$main_loop
	mov	r0,	#3
	push	r0
	mov	r0,	#byte1 offset _optn_table
	mov	r1,	#byte2 offset _optn_table
	push	er0
	l	r0,	submode
	cmp	r0,	#1
	bne	_$L102
	l	r0,	-02[fp]
	bl	_get_line_pointer
	l	er2,	[er0]
	bal	_$L103
_$L102:
	l	er2,	-02[fp]
_$L103:
	mov	er0,	bp
	bl	_optn_menu
	add	sp,	#4
	mov	r0,	r0
	beq	_$optn_ret
	cmp	r0,	#4
	bgt	_$L48
	mov	r4,	r0
	l	r0,	submode
	cmp	r0,	#1
	bne	_$L116
	l	r0,	-02[fp]
	bl	_get_line_pointer
	l	er0,	[er0]
	bal	_$L117
_$L116:
	l	er0,	-02[fp]
_$L117:
	lea	[er0]
	l	r2,	inst_insert
	beq	_$L42
	cmp	r2,	#1
	bne	_$L43
	mov	er2,	er0
	l	er6,	end_addr
_$loop8:
	l	r5,	[er0]
	bl	_ins_length
	cmp	r5,	#0FFh
	beq	_$L44
	cmp	er0,	er6			;in case no FF instruction is found
	blt	_$loop8
	bal	_$L44
_$L43:
	mov	er2,	er0
	l	er0,	end_addr
_$L44:
	push	er0
	sub	r0,	r2
	subc	r1,	r3
	push	er0
	mov	er0,	er2
	mov	r5,	#0
	add	er0,	er4
	bl	_smart_memcpy
	add	sp,	#2
	push	ea
_$L42:
	l	er6,	[bp]
	l	er8,	02[bp]
	st	r6,	[ea+]
	cmp	r4,	#1
	beq	_$new_inst
	st	r7,	[ea+]
	cmp	r4,	#2
	beq	_$new_inst
	st	r8,	[ea+]
	cmp	r4,	#3
	beq	_$new_inst
	st	r9,	[ea]
	bal	_$new_inst
_$L48:
	cmp	r0,	#5
	bgt	_$L49
;goto
	l	er0,	[bp]
	l	r2,	submode
	cmp	r2,	#1
	bne	_$L53
	st	er0,	-0Ch[fp]
	mov	er2,	#0
	st	er2,	-02[fp]
	gjmp	_$repaint
_$L53:
	st	er0,	-02[fp]
	mov	er4,	er0
	gjmp	_$L33

_$L49:
	cmp	r0,	#7
	bgt	_$L120
	mov	r6,	r0
	l	er0,	[bp]
	l	er2,	02[bp]
	l	er4,	04[bp]
	push	er4
	bl	_smart_memcpy
	add	sp,	#2
	lea	start_addr
	l	xr8,	[ea]
	cmp	r6,	#7
	bne	_$L121
;copy
	l	er0,	[bp]
	l	er2,	04[bp]
	add	er2,	er0
	st	xr0,	[ea]
	bal	_$L122
_$L121:
;move
;fill original with nop
	l	er0,	02[bp]
	l	er2,	[bp]
	l	er4,	04[bp]
	cmp	er0,	er2
	bge	_$L123
	add	er4,	er0
	cmp	er2,	er4
	bge	_$L124
	mov	er4,	er2
	bal	_$L124
_$L123:
	add	er2,	er4
	add	er4,	er0
	cmp	er0,	er2
	bge	_$L124
	mov	er0,	er2
_$L124:
	sub	r4,	r0
	subc	r5,	r1
	push	er4
	mov	r2,	#0F6h
	bl	_memset
	add	sp,	#2
_$L122:
	l	er0,	02[bp]
	l	er2,	04[bp]
	add	er2,	er0
	l	er4,	[bp]
	sub	r4,	r0
	subc	r5,	r1
	bl	_branch_fix
	st	xr8,	[ea]
	gjmp	_$optn_ret
_$L120:
	cmp	r0,	#8
	gbne	_$optn_ret
;fill
	l	er0,	[bp]
	l	er2,	02[bp]
	push	er2
	l	r2,	04[bp]
	bl	_memset
	add	sp,	#2
	gjmp	_$optn_ret

_$shutdown:
	bl	_shutdown
	gjmp	_$main_loop

_$shift:
	rb	key_identifier.2
	l	r0,	key_identifier
	xor	r0,	#8
	st	r0,	key_identifier
	bl	_render_stat_bar
	gjmp	_$main_loop

_$alpha:
	rb	key_identifier.3
	l	r0,	key_identifier
	xor	r0,	#4
	st	r0,	key_identifier
	bl	_render_stat_bar
	gjmp	_$main_loop

_$exe:
	l	r0,	-02[fp]
	bl	_get_line_pointer
	l	er0,	[er0]
	l	r2,	[fp]
	gbne	_$addr_sel_ret
	bl	_program_main
	mov	r0,	#0
	st	r0,	-02[fp]
	push	ea
	pop	er0
	add	er0,	#-1
	st	er0,	-0Ch[fp]
	gjmp	_$repaint

_$hex_exe:
	l	er0,	-02[fp]
	l	r2,	[fp]
	gbne	_$addr_sel_ret
	bl	_program_main
	push	ea
	pop	er4
	add	er4,	#-1
	st	er4,	-02[fp]
	bal	_$L33

_$switch_mode_inst:
	mov	r0,	#2
	st	r0,	submode
	l	r0,	-02[fp]
	bl	_get_line_pointer
	l	er4,	[er0]
	st	er4,	-02[fp]
	mov	er0,	#0
	st	er0,	-06[fp]
	bal	_$L33

_$switch_mode_hex:
	mov	r0,	#1
	st	r0,	submode
	l	er0,	-02[fp]
	st	er0,	-0Ch[fp]
	mov	er2,	#0
	st	er2,	-02[fp]
	gjmp	_$repaint

_$hex_type:
	mov	r0,	r2
	l	r2,	-05[fp]
	bne	_$write
	st	r0,	-06[fp]
	mov	r0,	#1
	st	r0,	-05[fp]
	gjmp	_$main_loop
_$write:
	l	r1,	-06[fp]
	sll	r1,	#4
	and	r0,	#0Fh
	or	r0,	r1
	l	er2,	-02[fp]
	st	r0,	[er2]
	mov	r0,	#0
	st	r0,	-05[fp]
	bal	_$hex_right

_$hex_up:
	mov	er0,	#-8
	bal	_$change_addr

_$hex_down:
	mov	er0,	#8
	bal	_$change_addr

_$hex_left:
	mov	er0,	#-1
	bal	_$change_addr

_$hex_right:
	mov	er0,	#1
	bal	_$change_addr

_$hex_pageup:
	mov	r0,	#0
	mov	r1,	#-1
	bal	_$change_addr

_$hex_pagedown:
	mov	r0,	#0
	mov	r1,	#1

_$change_addr:
	mov	r4,	#0
	st	r4,	-05[fp]
	l	er4,	-02[fp]
	add	er4,	er0
	st	er4,	-02[fp]
	l	er0,	-04[fp]
	cmp	er0,	er4
	bgt	_$L33

	add	er0,	#20h
	cmp	er0,	er4
	gbgt	_$hex_repaint
	add	er4,	#-18h
_$L33:
	and	r4,	#0F8h
	st	er4,	-04[fp]
	gjmp	_$hex_repaint

_$inst_right:
	l	r0,	-02[fp]
	bl	_get_line_pointer
	l	er2,	[er0]
	l	r0,	[er2]
	add	er2,	#1
	cmp	r0,	#0Ch
	gblt	_$main_loop
	cmp	r0,	#10h
	blt	_$L35
	cmp	r0,	#26h
	gblt	_$main_loop
	cmp	r0,	#30h
	blt	_$L35
	cmp	r0,	#0FBh
	gblt	_$main_loop
	cmp	r0,	#0FCh
	gbgt	_$main_loop
_$L35:
	l	r0,	[er2]
	add	er2,	#1
	l	r1,	[er2]
	st	er0,	-0Ch[fp]
	mov	er2,	#0
	st	er2,	-02[fp]
	bal	_$repaint

_$base_up:
	mov	er2,	#-1
	bal	_$L30

_$base_down:
	mov	er2,	#1
_$L30:
	l	r0,	-02[fp]
	bl	_get_line_pointer
	l	er0,	[er0]
	add	er0,	er2
	st	er0,	-0Ch[fp]
	mov	er2,	#0
	st	er2,	-02[fp]
	bal	_$repaint

_$inst_up:
	l	r0,	-02[fp]
	beq	_$inst_page_up
	add	r0,	#-1
	st	r0,	-02[fp]
	l	er0,	-0Ah[fp]
	bal	_$repaint

_$inst_down:
	l	r0,	-02[fp]
	cmp	r0,	#3
	bge	_$inst_page_down
	add	r0,	#1
	st	r0,	-02[fp]
	l	er0,	-0Ah[fp]
	bal	_$repaint

_$inst_page_up:
	l	er4,	-0Ah[fp]
	l	er0,	-0Ch[fp]
	cmp	er4,	er0
	ble	_$renew_base
_$loop2:
	mov	er8,	er0
	bl	_ins_length
	cmp	er0,	er4
	blt	_$loop2
	mov	er0,	er8
	bal	_$repaint
_$renew_base:
	mov	er6,	#-4
_$loop3:
	mov	er0,	er4
	add	er0,	er6
	mov	er8,	er0
	add	er6,	#1
	beq	_$L29
	bl	_ins_length
	cmp	er0,	er4
	bne	_$loop3
_$L29:
	mov	er0,	er8
	st	er0,	-0Ch[fp]
	bal	_$repaint

_$inst_page_down:
	l	er0,	-08[fp]

;er0-pointer to the first instruction
_$repaint:
	mov	er2,	#0Ah
	st	r2,	font_size
	st	r3,	font_color
	mov	r2,	#1
	st	r2,	curr_buffer
	mov	er4,	er0
	mov	r7,	#10h
	mov	er8,	#0
	bl	_clear_DDD4
_$loop:
	lea	[bp]
	mov	r0,	r5
	bl	_hex_byte
	st	er0,	[ea+]
	mov	r0,	r4
	bl	_hex_byte
	st	er0,	[ea+]
	mov	r0,	#0
	st	r0,	[ea]
	mov	r6,	#0
	mov	er0,	er6
	mov	er2,	bp
	bl	_line_print
	mov	r0,	r8
	bl	_get_line_pointer
	st	er4,	[er0]

	l	r0,	[er4]
	cmp	r0,	#0Ch
	blt	_$L31
	cmp	r0,	#10h
	blt	_$L36
	cmp	r0,	#26h
	blt	_$L31
	cmp	r0,	#30h
	blt	_$L36
	cmp	r0,	#0FBh
	blt	_$L31
	cmp	r0,	#0FCh
	bgt	_$L31
_$L36:
	mov	r2,	#8Dh
	mov	r3,	#0
	mov	er0,	er6
	mov	r0,	#0B8h
	bl	_char_print

_$L31:
	mov	er0,	er4
	mov	er2,	bp
	bl	_decode_ins
	mov	er10,	er0
	l	r0,	-02[fp]
	cmp	r0,	r8
	bne	_$L22
	mov	r0,	#4
	st	r0,	font_color
_$L22:
	mov	er0,	er6
	mov	r0,	#60h
	mov	er2,	bp
	bl	_line_print
	mov	r0,	#0
	st	r0,	font_color
	mov	r6,	#20h
_$loop1:
	lea	[bp]
	l	r0,	[er4]
	bl	_hex_byte
	st	r0,	[ea+]
	st	r1,	[ea+]
	st	r9,	[ea]
	mov	er0,	er6
	add	r6,	#0Eh
	mov	er2,	bp
	bl	_line_print
	add	er4,	#1
	cmp	er4,	er10
	blt	_$loop1

	add	r7,	#0Ah
	add	r8,	#1
	cmp	r8,	#4
	blt	_$loop

_$paint_submode:
	tb	submode.0
	beq	_$L26
	mov	r0,	#4
	st	r0,	font_color
_$L26:
	lea	[bp]
	mov	r2,	#byte1 offset _submode_0
	mov	r3,	#byte2 offset _submode_0
	bl	_$L1
	st	r9,	[ea]
	mov	r0,	#08h
	mov	r1,	#1
	mov	er2,	bp
	bl	_line_print
	tb	submode.1
	beq	_$L27
	mov	r0,	#4
	bal	_$L28
_$L27:
	mov	r0,	#0
_$L28:
	st	r0,	font_color
	lea	[bp]
	mov	r2,	#byte1 offset _submode_1
	mov	r3,	#byte2 offset _submode_1
	bl	_$L1
	st	r9,	[ea]
	mov	r0,	#4Ch
	mov	r1,	#1
	mov	er2,	bp
	bl	_line_print
	mov	r0,	#0
	st	r0,	font_color

	bl	_render_DDD4

	gjmp	_$main_loop

_$hex_repaint:
	bl	_clear_DDD4
	mov	er0,	#1
	st	r0,	curr_buffer
	st	r1,	font_color
	mov	r0,	#0Ah
	st	r0,	font_size
	mov	r11,	#10h
	mov	r7,	#4
	l	er4,	-02[fp]
	l	er8,	-04[fp]
_$loop4:
	lea	[bp]
	mov	r0,	r9
	bl	_hex_byte
	st	er0,	[ea+]
	mov	r0,	r8
	bl	_hex_byte
	st	er0,	[ea+]
	mov	r0,	#0
	st	r0,	[ea]
	mov	er2,	bp
	mov	r10,	#0
	mov	er0,	er10
	bl	_line_print
	mov	r10,	#3Ch
	mov	r6,	#8
_$loop5:
	l	r0,	[er8]
	bl	_hex_byte
	st	er0,	[bp]
	mov	r0,	#0
	st	r0,	02h[bp]
	cmp	er4,	er8
	bne	_$L32
	mov	r0,	#4
	st	r0,	font_color
_$L32:
	mov	er0,	er10
	mov	er2,	bp
	bl	_line_print
	mov	r0,	#0
	st	r0,	font_color
	add	er10,	#10h
	add	er8,	#1
	add	r6,	#-1
	bne	_$loop5

	add	r11,	#0Ah
	add	r7,	#-1
	bne	_$loop4

	mov	r9,	#0
	bal	_$paint_submode

_$addr_sel_ret:
	mov	er2,	er0
_$main_ret:
	mov	sp,	fp
	pop	r0
	pop	xr4
	pop	qr8
	pop	pc

;er0/er2-start/end of branch target address to fix er4-offset to add to branch target
;assume that instructions are continuous from the start address with no gaps
_branch_fix:
	push	lr
	push	er6
	push	xr8
	push	ea
	mov	er6,	er0
	l	er0,	start_addr
	l	er10,	end_addr
_$loop9:
	l	r8,	[er0]
	cmp	r8,	#0FBh
	beq	_$L46
	cmp	r8,	#0FCh
	beq	_$L46
	cmp	r8,	#0Ch
	blt	_$L47
	cmp	r8,	#10h
	blt	_$L46
	cmp	r8,	#26h
	blt	_$L47
	cmp	r8,	#30h
	bge	_$L47
_$L46:
	add	er0,	#1
	lea	[er0]
	l	r8,	[ea+]
	l	r9,	[ea]
	cmp	er8,	er6
	blt	_$L119
	cmp	er8,	er2
	bge	_$L119
	add	er8,	er4
_$L119:
	st	r8,	[er0]
	add	er0,	#1
	st	r9,	[er0]
	add	er0,	#1
	bal	_$L118
_$L47:
	bl	_ins_length
_$L118:
	cmp	er0,	er10
	blt	_$loop9
	pop	ea
	pop	xr8
	pop	er6
	pop	pc

;er0-pointer to the return array er2-current addr
;stack args: sp-pointer to the table sp+2-page num
;return: r0-type
;fp-2:current page
_optn_menu:
	push	lr
	bl	_enter
	add	sp,	#-18h
	mov	bp,	sp
	push	er2
	mov	er10,	er0
	l	r8,	12h[fp]					;page num
	mov	er0,	#0
	st	er0,	-02[fp]
	mov	r0,	#3
	st	r0,	screen_state
	bal	_$optn_repaint
_$loop11:
	mov	er0,	bp
	bl	_wait_input
	mov	er0,	bp
	mov	r2,	#byte1 keycode_comp
	mov	r3,	#byte2 keycode_comp
	bl	_convert_keycode
	mov	er2,	#30h
	cmp	er0,	er2
	ble	_$loop11
	mov	er2,	#34h
	cmp	er0,	er2
	ble	_$select
	cmp	r1,	#0FCh
	bne	_$loop11
	cmp	r0,	#1Ch
	beq	_$optn_up
	cmp	r0,	#1Dh
	beq	_$optn_down
	cmp	r0,	#26h
	beq	_$optn_ac
	cmp	r0,	#1
	bne	_$loop11
_$optn_ac:
	mov	r0,	#0
	bal	_$optn_return

_$select:
	add	r0,	#-31h
	l	er6,	10h[fp]
	add	er6,	#2
	l	er2,	-02[fp]
	sll	r2,	#4
	add	er6,	er2
	sll	r0,	#2
	add	er6,	er0
	l	er4,	2:[er6]
	beq	_$loop11
	mov	er0,	er10
	l	er2,	-02[bp]
	bl	er4
	mov	r0,	r0
	bne	_$optn_return
	mov	r0,	#3
	st	r0,	screen_state
	bal	_$optn_repaint

_$optn_up:
	l	r0,	-02[fp]
	beq	_$L51
	add	r0,	#-1
	st	r0,	-02[fp]
	bal	_$optn_repaint
_$L51:
	st	r8,	-02[fp]
	bal	_$optn_repaint

_$optn_down:
	l	r0,	-02[fp]
	cmp	r0,	r8
	bge	_$L52
	add	r0,	#1
	st	r0,	-02[fp]
	bal	_$optn_repaint
_$L52:
	mov	r0,	#0
	st	r0,	-02[fp]

_$optn_repaint:
	mov	r0,	#0
	mov	r1,	#4
	bl	_fill_screen
	mov	er0,	#0Eh
	st	r0,	font_size
	st	r1,	font_color
	st	r1,	curr_buffer
	l	er6,	10h[fp]
	l	er0,	-02[fp]
	sll	r0,	#4
	add	er6,	er0
	mov	r4,	#31h
	mov	r5,	#3Ah
	mov	r9,	#1
_$loop12:
	lea	[bp]
	st	er4,	[ea+]
	l	er2,	2:[er6]
	beq	_$L50
	bl	_$L1
	st	r0,	[ea]
	mov	r1,	r9
	mov	er2,	bp
	bl	_line_print
	add	r9,	#10h
	add	er6,	#4
	add	r4,	#1
	cmp	r4,	#34h
	ble	_$loop12
_$L50:
	mov	r0,	r8
	add	r0,	#1
	l	r1,	-02[fp]
	add	r1,	#1
	bl	_draw_scroll_bar
	bl	_render_E3D4
	bal	_$loop11

_$optn_return:
	b	_leave

_arithmetic:
	push	lr
	push	er4
	mov	er4,	er2
	mov	r2,	#byte1 offset _arithmetic_table
	mov	r3,	#byte2 offset _arithmetic_table
	bal	_$show_inst_menu

_data_transfer:
	push	lr
	push	er4
	mov	er4,	er2
	mov	r2,	#byte1 offset _data_transfer_table
	mov	r3,	#byte2 offset _data_transfer_table
	bal	_$show_inst_menu
	
_branch_inst:
	push	lr
	push	er4
	mov	er4,	er2
	mov	r2,	#byte1 offset _branch_inst_table
	mov	r3,	#byte2 offset _branch_inst_table

_$show_inst_menu:
	bl	_inst_menu
	pop	er4
	pop	pc

_load_store:
	push	lr
	push	er4
	mov	er4,	er2
	mov	r2,	#byte1 offset _load_store_table
	mov	r3,	#byte2 offset _load_store_table
	bal	_$show_inst_menu

_push_pop:
	push	lr
	push	er4
	mov	er4,	er2
	mov	r2,	#byte1 offset _push_pop_table
	mov	r3,	#byte2 offset _push_pop_table
	bal	_$show_inst_menu

_misc:
	push	lr
	push	er4
	mov	er4,	er2
	mov	r2,	#byte1 offset _misc_table
	mov	r3,	#byte2 offset _misc_table
	bal	_$show_inst_menu

_address_input:
	push	lr
	push	fp
	push	er4
	mov	fp,	sp
	mov	r4,	#0FFh
	push	r4
	mov	er0,	#4
	push	er0
	mov	r0,	#2
	mov	r1,	#20h
	push	er0
	mov	er0,	sp
	push	r4
	mov	r2,	#byte1 offset _sel_branch_addr
	mov	r3,	#byte2 offset _sel_branch_addr
	push	er2
	mov	r2,	#0
	mov	r3,	#10h
	push	er2
	mov	er2,	sp
	mov	er4,	er0
	bl	_input_screen
	l	er0,	[er4]
	mov	sp,	fp
	pop	er4
	pop	fp
	pop	pc

;return: r2-csr er0-pc
_sys_func_select:
	push	lr
	push	fp
	push	er4
	push	ea
	mov	fp,	sp
	mov	r4,	#0FFh
	push	r4
	mov	er0,	#4
	push	er0
	mov	r0,	#20h
	mov	r1,	#20h
	push	er0
	mov	er0,	#1
	push	er0
	mov	r0,	#2
	mov	r1,	#20h
	push	er0
	mov	er0,	sp
	push	r4
	mov	r2,	#byte1 offset __sys_func
	mov	r3,	#byte2 offset __sys_func
	push	er2
	mov	r2,	#14h
	mov	r3,	#24h
	push	er2
	mov	r2,	#byte1 offset _sel_sys_func
	mov	r3,	#byte2 offset _sel_sys_func
	push	er2
	mov	r2,	#0
	mov	r3,	#10h
	push	er2
	mov	er2,	sp
	mov	er4,	er0
	bl	_input_screen
	mov	r3,	r2
	l	r2,	[er4]
	add	er4,	#2
	l	er0,	[er4]
	rb	r0.0
	mov	sp,	fp
	pop	ea
	pop	er4
	pop	fp
	pop	pc

;er0-current addr
;return: er0-addr
_branch_addr_select:
	push	lr
	push	qr8
	push	xr4
	push	ea
	mov	fp,	sp
	add	sp,	#-10h
	mov	bp,	sp
	mov	er10,	er0
	mov	r0,	#3
	st	r0,	screen_state

	bl	_clear_DDD4
	mov	er0,	#0Eh
	st	r0,	font_size
	st	r1,	font_color
	mov	r0,	#1
	st	r0,	curr_buffer

	lea	[bp]
	mov	r2,	#byte1 offset _input_branch
	mov	r3,	#byte2 offset _input_branch
	bl	_$L1
	st	r0,	[ea]
	mov	r0,	#0
	mov	r1,	#1
	mov	er2,	bp
	bl	_line_print

	lea	[bp]
	mov	r2,	#byte1 offset _sel_branch
	mov	r3,	#byte2 offset _sel_branch
	bl	_$L1
	st	r0,	[ea]
	mov	r0,	#0
	mov	r1,	#10h
	mov	er2,	bp
	bl	_line_print

	bl	_render_DDD4

_$loop10:
	mov	er0,	bp
	bl	_wait_input
	mov	er0,	bp
	mov	r2,	#byte1 keycode_comp
	mov	r3,	#byte2 keycode_comp
	bl	_convert_keycode
	mov	er2,	#31h
	cmp	er0,	er2
	beq	_$input_branch
	mov	er2,	#32h
	cmp	er0,	er2
	beq	_$sel_branch
	cmp	r0,	#26h
	cmpc	r1,	#0FCh
	bne	_$loop10
	mov	r3,	#0
	bal	_$sel_branch_ret

_$input_branch:
	bl	_address_input
	mov	r3,	r2
	bal	_$sel_branch_ret

_$sel_branch:
	l	r4,	submode
	push	r4
	mov	r0,	#1
	mov	er2,	er10
	bl	_program_mode
	mov	er0,	er2
	mov	r3,	#1
	pop	r4
	st	r4,	submode

_$sel_branch_ret:
	mov	sp,	fp
	pop	ea
	pop	xr4
	pop	qr8
	pop	pc

;r0-operand index r1-operand type(1 for er, 2 for bit)
;return: r0-reg index(1 bit right shifted for er regs)
_reg_operand_select:
	push	lr
	push	qr8
	push	xr4
	push	ea
	mov	fp,	sp
	add	sp,	#-18h
	mov	bp,	sp
	mov	er10,	er0
	mov	r0,	#3
	st	r0,	screen_state

	bl	_clear_DDD4
	mov	er0,	#0Eh
	st	r0,	font_size
	st	r1,	font_color
	mov	r0,	#1
	st	r0,	curr_buffer

	lea	[bp]
	mov	r2,	#byte1 offset _sel_operand
	mov	r3,	#byte2 offset _sel_operand
	bl	_$L1
	add	r10,	#31h
	st	r10,	[ea+]
	mov	r1,	#3Ah
	st	r1,	[ea+]
	st	r0,	[ea]
	mov	r0,	#0
	mov	r1,	#1
	mov	er2,	bp
	bl	_line_print

	lea	[bp]
	cmp	r11,	#0
	beq	_$L100
	cmp	r11,	#1
	beq	_$L112
	mov	r2,	#byte1 offset _sel_bit
	mov	r3,	#byte2 offset _sel_bit
	bal	_$L101
_$L112:
	mov	r2,	#byte1 offset _sel_ern
	mov	r3,	#byte2 offset _sel_ern
	bal	_$L101
_$L100:
	mov	r2,	#byte1 offset _sel_rn
	mov	r3,	#byte2 offset _sel_rn
_$L101:
	bl	_$L1
	st	r0,	[ea]
	mov	r0,	#0
	mov	r1,	#20h
	mov	er2,	bp
	bl	_line_print

	lea	(screen_buf + 0198h)
	mov	r0,	#0FFh
	mov	r1,	#0FFh
	mov	er2,	er0
	mov	er4,	er0
	mov	er6,	er0
	st	qr0,	[ea+]
	st	qr0,	[ea+]
	st	qr0,	[ea]

	bl	_render_DDD4

_$loop26:
	mov	er0,	bp
	bl	_wait_input
	mov	er0,	bp
	mov	r2,	#byte1 keycode_comp
	mov	r3,	#byte2 keycode_comp
	bl	_convert_keycode
	mov	er2,	#30h
	cmp	er0,	er2
	blt	_$loop26
	mov	er2,	#3Ch
	cmp	er0,	er2
	blt	_$reg_select
	cmp	r0,	#26h
	cmpc	r1,	#0FCh
	bne	_$loop26
	mov	r3,	#0
	bal	_$reg_operand_ret

_$reg_select:
	cmp	r11,	#2
	bne	_$L113
	cmp	r0,	#37h
	bgt	_$loop26
	bal	_$L99
_$L113:
	cmp	r11,	#0
	beq	_$L99
	tb	r0.0
	bne	_$loop26
_$L99:
	and	r0,	#0Fh
	mov	r3,	#1

_$reg_operand_ret:
	mov	sp,	fp
	pop	ea
	pop	xr4
	pop	qr8
	pop	pc

;r0-imm length(1 for 16-bit)
;return: er0-imm value
_imm_operand_select:
	push	lr
	push	fp
	push	er4
	push	ea
	mov	fp,	sp
	mov	r4,	#0FFh
	push	r4
	cmp	r0,	#0
	bne	_$L105
	mov	er0,	#2
	bal	_$L106
_$L105:
	mov	er0,	#4
_$L106:
	push	er0
	mov	r0,	#48h
	mov	r1,	#20h
	push	er0
	mov	er0,	sp
	push	r4
	mov	r2,	#byte1 offset _sel_imm_2
	mov	r3,	#byte2 offset _sel_imm_2
	push	er2
	mov	r2,	#0
	mov	r3,	#24h
	push	er2
	mov	r2,	#byte1 offset _sel_imm
	mov	r3,	#byte2 offset _sel_imm
	push	er2
	mov	r2,	#0
	mov	r3,	#10h
	push	er2
	mov	er2,	sp
	mov	er4,	er0
	bl	_input_screen
	mov	r3,	r2
	l	er0,	[er4]
	mov	sp,	fp
	pop	ea
	pop	er4
	pop	fp
	pop	pc

;er0-pointer to the return array er2-pointer to the table er4-current addr
_inst_menu:
	push	lr
	bl	_enter
	add	sp,	#-20h
	mov	bp,	sp
	push	er4
	mov	er8,	er0
	mov	er10,	er2
	mov	er0,	#0
	st	er0,	-02[fp]
	mov	r0,	#3
	st	r0,	screen_state
	gjmp	_$inst_menu_repaint

_$loop13:
	mov	er0,	bp
	bl	_wait_input
	mov	er0,	bp
	mov	r2,	#byte1 keycode_comp
	mov	r3,	#byte2 keycode_comp
	bl	_convert_keycode
	mov	er2,	#30h
	cmp	er0,	er2
	ble	_$loop13
	mov	er2,	#3Ch
	cmp	er0,	er2
	ble	_$select_inst
	cmp	r1,	#0FCh
	bne	_$loop13
	cmp	r0,	#1Ch
	beq	_$inst_menu_up
	cmp	r0,	#1Dh
	beq	_$inst_menu_down
	cmp	r0,	#26h
	gbeq	_$inst_menu_quit
	cmp	r0,	#1Fh
	gbeq	_$inst_menu_quit
	bal	_$loop13

_$inst_menu_up:
	l	er0,	-02[fp]
	bne	_$L96
	l	er0,	2:[er10]
	bal	_$L97
_$L96:
	add	er0,	#-1
_$L97:
	st	er0,	-02[fp]
	gjmp	_$inst_menu_repaint

_$inst_menu_down:
	l	er0,	-02[fp]
	add	er0,	#1
	l	er2,	2:[er10]
	cmp	er0,	er2
	ble	_$L98
	mov	er0,	#0
_$L98:
	st	er0,	-02[fp]
	gjmp	_$inst_menu_repaint
	
_$select_inst:
	add	r0,	#-31h
	mov	er6,	er10
	add	er6,	#2
	l	r2,	-02[fp]
	mov	r3,	#18h
	mul	er2,	r3
	add	er6,	er2
	sll	r0,	#1
	add	er6,	er0
	l	er4,	2:[er6]
	beq	_$loop13
	lea	[er8]
	tb	r4.7
	bne	_$special_inst_handle
	tb	r4.0
	bne	_$L68
	mov	r0,	#0
	bal	_$L109
_$L68:
	tb	r4.5
	beq	_$L69
;handle branch instructions(including call_sys)
	st	r5,	[ea+]
	cmp	r5,	#0FDh
	bne	_$L70
	bl	_sys_func_select			;return: target_addr-r2:er0
	mov	r3,	r3
	gbeq	_$inst_menu_quit
	st	r2,	[ea+]
	st	r1,	[ea+]					;call_sys stores param in big endian
	st	r0,	[ea]
	mov	r0,	#4
	gjmp	_$inst_menu_ret
_$L70:
	l	er0,	-02[bp]
	bl	_branch_addr_select			;return: er0-target addr
	mov	r3,	r3
	gbeq	_$inst_menu_quit
	st	r0,	[ea+]
	st	r1,	[ea]
	mov	r0,	#3
	gjmp	_$inst_menu_ret
_$L69:
	tb	r4.6
	beq	_$L71
;handle regular 2-reg instructions here(inst rn, rm)
	st	r5,	[ea+]
	mov	er0,	#0
	bl	_reg_operand_select
	mov	r3,	r3
	gbeq	_$inst_menu_quit
	mov	r4,	r0
	mov	er0,	#1
	bl	_reg_operand_select
	mov	r3,	r3
	gbeq	_$inst_menu_quit
	sll	r4,	#4
	or	r0,	r4
	st	r0,	[ea]
	mov	r0,	#2
	gjmp	_$inst_menu_ret
_$L71:
	mov	er0,	#0
	tb	r4.1
	beq	_$L72
	mov	r1,	#1
	cmp	r5,	#36h
	bne	_$L108
	mov	r0,	#1
_$L108:
	bl	_reg_operand_select
	mov	r3,	r3
	gbeq	_$inst_menu_quit
	srl	r0,	#1
	bal	_$L109
_$L72:
	bl	_reg_operand_select
	mov	r3,	r3
	gbeq	_$inst_menu_quit
_$L109:
	add	r0,	r5
	st	r0,	[ea+]
	mov	r0,	#1
	tb	r4.3
	gbeq	_$inst_menu_ret
	tb	r4.4
	bne	_$L73
	mov	r0,	#0
	bl	_imm_operand_select
	mov	r3,	r3
	gbeq	_$inst_menu_quit
	st	r0,	[ea]
	mov	r0,	#2
	gjmp	_$inst_menu_ret
_$L73:
	bl	_imm_operand_select
	mov	r3,	r3
	gbeq	_$inst_menu_quit
	st	r0,	[ea+]
	st	r1,	[ea]
	mov	r0,	#3
	gjmp	_$inst_menu_ret

_$special_inst_handle:
	mov	r0,	r4
	and	r0,	#7
	add	r0,	#1Fh
	st	r0,	[ea+]
	mov	r8,	#2
	mov	er0,	#0
	tb	r4.5
	beq	_$L79
	mov	r1,	#1
	bl	_reg_operand_select
	mov	r3,	r3
	gbeq	_$inst_menu_quit
	srl	r0,	#1
	bal	_$L80
_$L79:
	bl	_reg_operand_select
	mov	r3,	r3
	gbeq	_$inst_menu_quit
_$L80:
	mov	r6,	r0
	tb	r4.3
	beq	_$L81
	mov	er0,	#1
	tb	r4.6
	beq	_$L82
	mov	r1,	#1
	bl	_reg_operand_select
	mov	r3,	r3
	gbeq	_$inst_menu_quit
	srl	r0,	#1
	bal	_$L83
_$L82:
	cmp	r5,	#0Dh
	bne	_$L111
	mov	r1,	#2
_$L111:
	bl	_reg_operand_select
	mov	r3,	r3
	gbeq	_$inst_menu_quit
_$L83:
	sll	r6,	#4
	or	r6,	r0
_$L81:
	tb	r4.4
	beq	_$L84
	mov	r0,	#0
	bl	_imm_operand_select
	mov	r3,	r3
	gbeq	_$inst_menu_quit
	mov	r7,	r0
	mov	r8,	#3
_$L84:
	cmp	r5,	#2
	bge	_$L86
	sll	r5,	#7
	bal	_$L85
_$L86:
	cmp	r5,	#4
	bge	_$L87
_$L89:
	and	r5,	#1
	sll	r5,	#3
	bal	_$L85
_$L87:
	cmp	r5,	#8
	bge	_$L88
	mov	r0,	r5
	and	r0,	#1
	and	r5,	#2
	sll	r0,	#3
	sll	r5,	#6
	or	r6,	r0
	bal	_$L85
_$L88:
	cmp	r5,	#0Eh
	blt	_$L89
	cmp	r5,	#12h
	bge	_$L90
	cmp	r5,	#11h
	bne	_$L107
	mov	r5,	#0E0h
	bal	_$L85
_$L107:
	mov	r0,	r6
	and	r6,	#7
	and	r0,	#8
	sll	r0,	#1
	or	r6,	r0
	add	r5,	#-0Ah
	sll	r5,	#5
	bal	_$L85
_$L90:
	add	r5,	#-12h
	sll	r5,	#4
_$L85:
	or	r6,	r5
	st	r6,	[ea+]
	st	r7,	[ea]
	mov	r0,	r8
	gjmp	_$inst_menu_ret

_$inst_menu_repaint:
	mov	r0,	#0
	mov	r1,	#4
	bl	_fill_screen
	mov	er0,	#0Ah
	st	r0,	font_size
	st	r1,	font_color
	st	r1,	curr_buffer
	mov	r0,	#60h
	mov	r1,	#0F7h
	st	er0,	-04[fp]
	mov	er6,	er10
	add	er6,	#2
	l	r0,	-02[fp]
	mov	r1,	#18h
	mul	er0,	r1
	add	er6,	er0
	mov	r4,	#31h
	mov	r5,	#3Ah
_$loop14:
	lea	[bp]
	st	er4,	[ea+]
	push	xr4
	l	er4,	2:[er6]
	beq	_$L54
	mov	r0,	r5
	mov	r1,	#0
	tb	r4.7
	bne	_$inst_text_handle
	cmp	r5,	#0F6h
	blt	_$L59
	add	r0,	#0Ah
	bal	_$L58
_$L59:
	tb	r4.6
	bne	_$L58
	tb	r4.5
	bne	_$L58
	tb	r4.1
	bne	_$L60
	cmp	r0,	#0Ch
	bge	_$L61
	add	r0,	#4Eh
_$L61:
	add	r0,	#6
	mov	r2,	#0Ch
	div	er0,	r2
	add	er0,	#30h
	bal	_$L58
_$L60:
	mov	r2,	#6
	div	er0,	r2
	add	er0,	#28h
_$L58:
	bl	_extract_string
	tb	r4.0
	beq	_$L64
	tb	r4.5
	beq	_$L63
	mov	r2,	#byte1 offset _addr_str
	mov	r3,	#byte2 offset _addr_str
	bal	_$L67
_$L63:
	mov	r6,	#6Eh
	st	r6,	[ea+]
	cmp	r5,	#30h
	bne	_$L62
	mov	r2,	#byte1 offset _sp_str
	mov	r3,	#byte2 offset _sp_str
	bal	_$L67
_$L62:
	tb	r4.6
	beq	_$L64
	tb	r4.2
	bne	_$L65
	mov	r2,	#byte1 offset _rm_str
	mov	r3,	#byte2 offset _rm_str
	bal	_$L67
_$L65:
	mov	r2,	#byte1 offset _erm_str
	mov	r3,	#byte2 offset _erm_str
	bal	_$L67
_$L64:
	tb	r4.3
	beq	_$text_handle_end
	tb	r4.4
	bne	_$L66
	mov	r2,	#byte1 offset _imm8_str
	mov	r3,	#byte2 offset _imm8_str
	bal	_$L67
_$L66:
	mov	r2,	#byte1 offset _imm16_str
	mov	r3,	#byte2 offset _imm16_str
_$L67:
	bl	_$L1
	bal	_$text_handle_end

;instructions that need special handling are encoded from 0
_$inst_text_handle:
	sll	r0,	#1
	l	er2,	far _inst_menu_str_table[er0]
	bl	_$L1
	tb	r4.3
	bne	_$text_handle_end
	tb	r4.4
	bne	_$text_handle_end
	mov	r6,	#6Eh
	st	r6,	[ea+]
	
_$text_handle_end:
	st	r0,	[ea]
	pop	xr4
	l	er0,	-04[fp]
	cmp	r0,	#0
	beq	_$L55
	mov	r0,	#0
	add	r1,	#0Ah
	st	er0,	-04[fp]
	bal	_$L56
_$L55:
	mov	r0,	#60h
	st	er0,	-04[fp]
_$L56:
	mov	er2,	bp
	bl	_line_print
	add	er6,	#2
	add	r4,	#1
	cmp	r4,	#3Ah
	bne	_$L57
	add	r4,	#7
	bal	_$loop14
_$L57:
	cmp	r4,	#43h
	ble	_$loop14

_$L54:
	l	r0,	2:[er10]
	add	r0,	#1
	l	r1,	-02[fp]
	add	r1,	#1
	bl	_draw_scroll_bar
	bl	_render_E3D4

	gjmp	_$loop13

_$inst_menu_quit:
	mov	r0,	#0
_$inst_menu_ret:
	b	_leave

;subroutine for input menu screen
;return: er0-pointer to the current input buffer
_get_input_buffer:
	push	er2
	push	xr4
	mov	er6,	er8
	add	er6,	#2
	mov	er0,	bp
	l	r4,	-02[fp]
	beq	_$L91
_$loop22:
	l	er2,	[er6]
	add	er6,	#4
	add	er0,	er2
	add	er0,	#1
	add	r4,	#-1
	bne	_$loop22
_$L91:
	pop	xr4
	pop	er2
	rt

;er0-pointer to the input box array.struct: position, length. end with FF.
;er2-pointer to the string array. struct: position, pointer. end with FF.
_input_screen:
	push	lr
	bl	_enter
;fp-2: current input box
	add	sp,	#-2
	mov	er8,	er0
	mov	er10,	er2
;generate input buffer in stack
	lea	[er8]
	mov	bp,	sp
	mov	er6,	sp
_$loop15:
	l	er0,	[ea+]
	cmp	r0,	#0FFh
	beq	_$L74
	l	er2,	[ea+]
	add	er2,	#3
	sub	r12,	r2
	subc	r13,	r3
	add	er6,	#-2
	bal	_$loop15
_$L74:
	rb	r12.0
	mov	sp,	bp
;reserve space for ki/ko return value
	add	sp,	#-2
;bp-bointer to the input buffer array er6-pointer to the input length array
	mov	er0,	#0
	mov	er2,	bp
_$loop16:
	st	er0,	[er2]
	add	er2,	#2
	cmp	er2,	fp
	blt	_$loop16
	st	r0,	screen_state
	st	r0,	cursor_pos
	mov	r0,	#1
	st	r0,	cursor_blink
	mov	r0,	#0Eh
	st	r0,	cursor_size
	mov	r4,	#0
	gjmp	_$calc_cursor_pos

_$loop17:
	mov	er0,	sp
	bl	_wait_input
	mov	er0,	sp
	mov	r2,	#byte1 keycode_comp
	mov	r3,	#byte2 keycode_comp
	bl	_convert_keycode
	mov	er2,	#30h
	cmp	er0,	er2
	blt	_$loop17
	mov	er2,	#3Fh
	cmp	er0,	er2
	ble	_$input
	cmp	r1,	#0FCh
	bne	_$loop17
	cmp	r0,	#1Fh
	beq	_$left
	cmp	r0,	#1Eh
	beq	_$right
	cmp	r0,	#2Dh
	beq	_$enter
	cmp	r0,	#26h
	gbeq	_$ac
	cmp	r0,	#3Eh
	beq	_$del
	bal	_$loop17

_$calc_cursor_pos:
	l	er0,	-02[fp]
	sll	r0,	#2
	add	er0,	er8
	l	er0,	[er0]
	add	r0,	#3
	add	r1,	#3
	mov	r2,	#0Bh
	mul	er2,	r4
	add	er0,	er2
	st	er0,	cursor_scr_pos
	gjmp	_$input_screen_repaint

_$input:
	push	er10
	l	er2,	-02[fp]
	sll	r2,	#1
	mov	er10,	er2
	add	er10,	er6
	l	er4,	[er10]
	sll	r2,	#1
	add	er2,	er8
	add	er2,	#2
	l	er2,	[er2]
	cmp	er4,	er2
	bge	_$L104
	add	er4,	#1
	st	er4,	[er10]
	mov	er2,	er0
	bl	_get_input_buffer
	l	r4,	cursor_pos
	mov	r5,	#0
	add	er0,	er4
_$loop23:
	l	r3,	[er0]
	st	r2,	[er0]
	cmp	r2,	#0
	beq	_$L92
	mov	r2,	r3
	add	er0,	#1
	bal	_$loop23
_$L92:
	add	r4,	#1
	st	r4,	cursor_pos
	pop	er10
	bal	_$calc_cursor_pos

_$L104:
	pop	er10
	bal	_$loop17

_$del:
	l	r4,	cursor_pos
	beq	_$loop17
	mov	r5,	#0
	add	r4,	#-1
	st	r4,	cursor_pos
	bl	_get_input_buffer
	add	er0,	er4
	mov	er2,	er0
	add	er2,	#1
	bl	_strcpy
	l	er0,	-02[fp]
	sll	r0,	#1
	add	er0,	er6
	l	er2,	[er0]
	add	er2,	#-1
	st	er2,	[er0]
	bal	_$calc_cursor_pos

_$left:
	l	r4,	cursor_pos
	beq	_$L93
	add	r4,	#-1
	st	r4,	cursor_pos
	bal	_$calc_cursor_pos
_$L93:
	l	er0,	-02[fp]
	beq	_$loop17
	add	er0,	#-1
	st	er0,	-02[fp]
	sll	r0,	#1
	add	er0,	er6
	l	er4,	[er0]
	st	r4,	cursor_pos
	bal	_$calc_cursor_pos

_$right:
	l	er0,	-02[fp]
	sll	r0,	#1
	add	er0,	er6
	l	r2,	[er0]
	l	r4,	cursor_pos
	cmp	r4,	r2
	bge	_$L94
	add	r4,	#1
	st	r4,	cursor_pos
	bal	_$calc_cursor_pos
_$L94:
	add	er0,	#4
	cmp	er0,	fp
	gbge	_$loop17
	mov	r4,	#0
	st	r4,	cursor_pos
	l	er0,	-02[fp]
	add	er0,	#1
	st	er0,	-02[fp]
	bal	_$calc_cursor_pos

_$enter:
	push	er8
	lea	[er8]
	add	er8,	#2
_$loop24:
	mov	er0,	#0
	mov	er2,	bp
_$loop25:
	l	r4,	[er2]
	beq	_$L95
	sllc	r1,	#4
	sll	r0,	#4
	and	r4,	#0Fh
	or	r0,	r4
	add	er2,	#1
	bal	_$loop25
_$L95:
	st	er0,	[ea+]
	l	er6,	[er8]
	add	bp,	er6
	add	bp,	#1
	add	er8,	#2
	l	r0,	[er8]
	add	er8,	#2
	cmp	r0,	#0FFh
	bne	_$loop24
	pop	er0
	mov	r2,	#1
	gjmp	_$input_screen_ret

_$ac:
	mov	er0,	er8
	mov	r2,	#0
	gjmp	_$input_screen_ret

_$input_screen_repaint:
	push	qr8
	push	xr4
	mov	fp,	sp
;the string to render should not be too long.
	add	sp,	#-20h
	mov	bp,	sp

	bl	_clear_DDD4
	mov	er0,	#0Eh
	st	r0,	font_size
	st	r1,	font_color
	mov	r0,	#1
	st	r0,	curr_buffer

;render strings first.
	lea	[er10]
_$loop18:
	l	er4,	[ea+]
	cmp	r4,	#0FFh
	beq	_$L75
	l	er2,	[ea+]
	push	ea
	lea	[bp]
	bl	_$L1
	st	r0,	[ea]
	mov	er0,	er4
	mov	er2,	bp
	bl	_line_print
	pop	ea
	bal	_$loop18
_$L75:
;render input buffer
	l	er10,	08[fp]
	lea	[er8]
_$loop19:
	l	er4,	[ea+]
	cmp	r4,	#0FFh
	beq	_$L76
	l	er2,	[ea+]
	add	er2,	#1
	push	ea
	lea	[bp]
_$loop20:
	l	r0,	[er10]
	add	er10,	#1
	cmp	r0,	#3Ah
	blt	_$L77
	add	r0,	#7
_$L77:
	st	r0,	[ea+]
	add	er2,	#-1
	bne	_$loop20
	mov	er0,	er4
	mov	er2,	bp
	add	r0,	#3
	add	r1,	#3
	bl	_line_print
	pop	ea
	bal	_$loop19
_$L76:
;render input box
	lea	[er8]
_$loop21:
	l	er0,	[ea+]
	cmp	r0,	#0FFh
	beq	_$L78
	l	er2,	[ea+]
	mov	r3,	#0Bh
	mul	er2,	r3
	add	er2,	#8
	mov	r3,	#14h
	bl	_draw_rect
	bal	_$loop21
_$L78:
	bl	_render_DDD4

	mov	sp,	fp
	pop	xr4
	pop	qr8
	gjmp	_$loop17

_$input_screen_ret:
	b	_leave

_goto_screen:
	push	lr
	push	fp
	push	xr4
	mov	fp,	sp
	mov	er6,	er0
	mov	r4,	#0FFh
	push	r4
	mov	er0,	#4
	push	er0
	mov	r0,	#42h
	mov	r1,	#0Ch
	push	er0
	mov	er0,	sp
	push	r4
	mov	r2,	#byte1 offset _goto
	mov	r3,	#byte2 offset _goto
	push	er2
	mov	r2,	#0
	mov	r3,	#10h
	push	er2
	mov	er2,	sp
	mov	er4,	er0
	bl	_input_screen
	l	er0,	[er4]
	st	er0,	[er6]
	cmp	r2,	#0
	bne	_$L114
	mov	r0,	#0
	bal	_$L115
_$L114:
	mov	r0,	#5
_$L115:
	mov	sp,	fp
	pop	xr4
	pop	fp
	pop	pc

_move_fn:
	push	lr
	push	xr12
	push	xr4
	mov	r6,	#byte1 offset _move_str
	mov	r7,	#byte2 offset _move_str
	mov	r13,	#6
	bal	_copy_move_fn

_copy_fn:
	push	lr
	push	xr12
	push	xr4
	mov	r6,	#byte1 offset _copy_str
	mov	r7,	#byte2 offset _copy_str
	mov	r13,	#7
_copy_move_fn:
	mov	fp,	sp
	mov	er4,	er0
	mov	r12,	#0FFh
	push	r12
	mov	er2,	#4
	push	er2
	mov	r0,	#50h
	mov	r1,	#26h
	push	er0
	push	er2
	mov	r0,	#2
	mov	r1,	#26h
	push	er0
	push	er2
	mov	r0,	#2
	mov	r1,	#10h
	push	er0
	mov	er0,	sp
	push	r12
	mov	r2,	#byte1 offset _copy_str_2
	mov	r3,	#byte2 offset _copy_str_2
	push	er2
	mov	r2,	#36h
	mov	r3,	#28h
	push	er2
	mov	r2,	#byte1 offset _copy_str_1
	mov	r3,	#byte2 offset _copy_str_1
	push	er2
	mov	r2,	#36h
	mov	r3,	#14h
	push	er2
	push	er6
	mov	r2,	#0
	mov	r3,	#1
	push	er2
	mov	er2,	sp
	mov	r6,	r13
	mov	bp,	er0
	bl	_input_screen
	cmp	r2,	#0
	beq	_$L127
	lea	[er4]
	l	er0,	04[bp]
	st	er0,	[ea+]
	l	er0,	02[bp]
	st	er0,	[ea+]
	l	er0,	[bp]
	st	er0,	[ea]
	mov	r0,	r6
	bal	_$L128
_$L127:
	mov	r0,	#0
_$L128:
	mov	sp,	fp
	pop	xr4
	pop	xr12
	pop	pc

_fill_fn:
	push	lr
	push	xr12
	push	er4
	mov	fp,	sp
	mov	er4,	er0
	mov	r12,	#0FFh
	push	r12
	mov	er2,	#2
	push	er2
	mov	r0,	#64h
	mov	r1,	#26h
	push	er0
	mov	er2,	#4
	push	er2
	mov	r0,	#2
	mov	r1,	#26h
	push	er0
	push	er2
	mov	r0,	#2
	mov	r1,	#10h
	push	er0
	mov	er0,	sp
	push	r12
	mov	r2,	#byte1 offset _fill_str_1
	mov	r3,	#byte2 offset _fill_str_1
	push	er2
	mov	r2,	#36h
	mov	r3,	#28h
	push	er2
	mov	r2,	#byte1 offset _copy_str_1
	mov	r3,	#byte2 offset _copy_str_1
	push	er2
	mov	r2,	#36h
	mov	r3,	#14h
	push	er2
	mov	r2,	#byte1 offset _fill_str
	mov	r3,	#byte2 offset _fill_str
	push	er2
	mov	r2,	#0
	mov	r3,	#1
	push	er2
	mov	er2,	sp
	mov	bp,	er0
	bl	_input_screen
	cmp	r2,	#0
	beq	_$L129
	lea	[er4]
	l	er0,	02[bp]
	st	er0,	[ea+]
	l	er0,	[bp]
	st	er0,	[ea+]
	l	r0,	04[bp]
	st	r0,	[ea]
	mov	r0,	#8
	bal	_$L130
_$L129:
	mov	r0,	#0
_$L130:
	mov	sp,	fp
	pop	er4
	pop	xr12
	pop	pc

_insert_1_fn:
	mov	r0,	#0
	st	r0,	inst_insert
	mov	r0,	#1
	rt

_insert_2_fn:
	mov	r0,	#1
	st	r0,	inst_insert
	rt

_insert_3_fn:
	mov	r0,	#2
	st	r0,	inst_insert
	rt

_insert_set_screen:
	push	lr
	mov	r0,	#0
	push	r0
	mov	r0,	#byte1 offset _insert_set_table
	mov	r1,	#byte2 offset _insert_set_table
	push	er0
	mov	er0,	#0
	mov	er2,	#0
	bl	_optn_menu
	add	sp,	#4
	mov	r0,	#0
	pop	pc

_start_addr_set:
	push	lr
	bl	_address_input
	mov	r2,	r2
	beq	_$L125
	st	er0,	start_addr
_$L125:
	mov	r0,	#0
	pop	pc

_end_addr_set:
	push	lr
	bl	_address_input
	mov	r2,	r2
	beq	_$L126
	st	er0,	end_addr
_$L126:
	mov	r0,	#0
	pop	pc

;settings wont need extra handling in main function. simply return 0
_settings_screen:
	push	lr
	mov	r0,	#0
	push	r0
	mov	r0,	#byte1 offset _settings_table
	mov	r1,	#byte2 offset _settings_table
	push	er0
	mov	er0,	#0
	mov	er2,	#0
	bl	_optn_menu
	add	sp,	#4
	mov	r0,	#0
	pop	pc

;er0-position er2-size
_draw_rect:
	push	qr8
	push	xr4
	add	r2,	r0
	mov	r4,	#0
	mov	r5,	#0FFh
	mov	r6,	#0
	mov	r7,	#1
	srlc	r4,	r2
	srl	r5,	r0
	srlc	r6,	r2
	mov	r7,	#80h
	srl	r7,	r0
	srl	r0,	#3
	srl	r2,	#3
	mov	r8,	#18h
	mov	r12,	r8
	mul	er8,	r1
	mul	er12,	r3
	mov	r1,	#0
	mov	r3,	#0FFh
	l	r10,	curr_buffer
	bne	_$L37
	mov	r11,	#0E3h
	bal	_$L38
_$L37:
	mov	r11,	#0DDh
_$L38:
	mov	r10,	#0D4h
	add	er8,	er10
	add	er8,	er0
	add	er12,	er8
	mov	er14,	er8
	sub	r2,	r0
	bne	_$L39
	and	r4,	r5
	bal	_$L40
_$L39:
	l	r0,	[er8]
	or	r0,	r5
	st	r0,	[er8]
	l	r0,	[er12]
	or	r0,	r5
	st	r0,	[er12]
_$loop6:
	add	er8,	#1
	add	er12,	#1
	add	r2,	#-1
	beq	_$L40
	st	r3,	[er8]
	st	r3,	[er12]
	bal	_$loop6
_$L40:
	l	r0,	[er8]
	or	r0,	r4
	st	r0,	[er8]
	l	r0,	[er12]
	or	r0,	r4
	st	r0,	[er12]
	cmp	r6,	#0
	bne	_$loop7
	mov	r6,	#1
	add	er8,	#-1
_$loop7:
	add	er8,	#18h
	add	er14,	#18h
	cmp	er8,	er12
	bge	_$L41
	l	r0,	[er8]
	or	r0,	r6
	st	r0,	[er8]
	l	r0,	[er14]
	or	r0,	r7
	st	r0,	[er14]
	bal	_$loop7
_$L41:
	pop	xr4
	pop	qr8
	rt

_get_line_pointer:
	sll	r0,	#1
	mov	r1,	#0
	add	er0,	fp
	add	er0,	#-0Ah
	rt

_menu_handle:
	push	lr
	mov	r0,	#0
	st	r0,	undefined1
	st	r0,	undefined2
	st	r0,	undefined3
	st	r0,	key_identifier
	bl	_reset_SFR
	mov	r0,	#1
	st	r0,	screen_state
	bl	_display_menu
	mov	r1,	#0
	st	r1,	screen_state
	pop	pc

_reset_SFR:
	mov	r0,	#1
	st	r0,	FCON
	mov	r0,	#22h
	st	r0,	IE0
	mov	r0,	#3
	st	r0,	EXICON0
	mov	r0,	#17h
	st	r0,	BLKCON0
	rt

_get_keycode_fixed:
	push	lr
	bl	_enter
	mov	er8,	er0
	mov	r4,	#1
	mov	r1,	#1
	mov	r3,	#1
_$get_key_loop:
	st	r1,	KOD0
	mov	r2,	#0
	l	r0,	KID
	st	r2,	KOD0
	mov	r2,	r0
	cmp	r0,	#0FFh
	beq	_$continue
	st	r1,	01h[er8]
	xor	r0,	#0FFh
	st	r0,	[er8]
	bal	_$get_key_ret
_$continue:
	sll	r1,	#1
	add	r3,	#1
	cmp	r3,	#7
	ble	_$get_key_loop
	mov	r4,	#0
_$get_key_ret:
	bl	_reset_ko
	mov	r0,	r4
	b	_leave

;er0-pointer to the instruction
;return:er0-pointer to the next instruction
_ins_length:
	push	r2
	l	r2,	[er0]
	cmp	r2,	#0Ch
	blt	_$2_byte
	cmp	r2,	#10h
	blt	_$3_byte
	cmp	r2,	#22h
	blt	_$2_byte
	cmp	r2,	#24h
	blt	_$3_byte
	beq	_$2_byte
	cmp	r2,	#26h
	blt	_$3_byte
	cmp	r2,	#30h
	blt	_$3_byte
	cmp	r2,	#3Ch
	blt	_$1_byte
	cmp	r2,	#4Eh
	blt	_$3_byte
	cmp	r2,	#5Ah
	blt	_$1_byte
	cmp	r2,	#0C6h
	blt	_$2_byte
	cmp	r2,	#0DEh
	blt	_$3_byte
	cmp	r2,	#0F7h
	beq	_$2_byte
	cmp	r2,	#0FBh
	blt	_$1_byte
	cmp	r2,	#0FDh
	blt	_$3_byte
	beq	_$4_byte
_$1_byte:
	add	er0,	#1
	bal	_$L21
_$2_byte:
	add	er0,	#2
	bal	_$L21
_$3_byte:
	add	er0,	#3
	bal	_$L21
_$4_byte:
	add	er0,	#4
_$L21:
	pop	r2
	rt

;er0-pointer to the instruction er2-pointer to the target string
;return:er0-pointer to the next instruction
_decode_ins:
	push	lr
	bl	_enter
	mov	er8,	er0
	lea	[er2]
	l	r0,	[er8]
	add	er8,	#1
	mov	r1,	#0
	cmp	r0,	#10h
	blt	_$ins_00_0F
	cmp	r0,	#26h
	blt	_$ins_10_25
	cmp	r0,	#30h
	blt	_$ins_bcond
	cmp	r0,	#5Ah
	blt	_$ins_30_59
	cmp	r0, #0F6h
	blt	_$ins_5A_F5
;miscellaneous instructions
	add	r0,	#0Ah
	mov	r4,	r0
	bl	_extract_string
	cmp	r4,	#1
	beq	_$add_sp
	cmp	r4,	#5
	blt	_$ret
	cmp	r4,	#7
	blt	_$jump
	beq	_$call
	bal	_$ret
_$jump:
	bl	_imm16
	bal	_$ret
_$call:
	l	r0,	[er8]
	add	er8,	#1
	bl	_hex_byte
	st	r1,	[ea+]
	mov	r0,	#3Ah
	st	r0,	[ea+]
	bl	_imm8
	bl	_imm8
	bal	_$ret
_$add_sp:
	mov	r2,	#2Ch
	mov	r3,	#20h
	st	r2,	[ea+]
	st	r3,	[ea+]
	bl	_simm8
	bal	_$ret

_$ins_00_0F:
	cmp	r0,	#0Ch
	bge	_$ins_bcond
	add	r0,	#4Eh
	bal	_$ins_5A_F5
_$ins_bcond:
	bl	_extract_string
	bl	_imm16
	bal	_$ret

_$ins_10_25:
	l	r6,	[er8]
	add	er8,	#1
	cmp	r0,	#1Fh
	blt	_$ins_r_r
	sll	r0,	#1
	l	er4,	far _pointer_table[er0]
	bl	er4
	bal	_$ret
_$ins_r_r:
	bl	_extract_string
	mov	r2,	#72h
	mov	r3,	#20h
	mov	r4,	#2Ch
	mov	r0,	r6
	srl	r0,	#4
	bl	_reg_index
	st	r4,	[ea+]
	st	r3,	[ea+]
	st	r2,	[ea+]
	mov	r0,	r6
	and	r0,	#0Fh
	bl	_reg_index
	bal	_$ret

_$ins_30_59:
	mov	r4,	#6
	div	er0,	r4
	mov	r5,	r0
	add	er0,	#28h
	bl	_extract_string
	mov	r0,	r4
	sll	r0,	#1
	bl	_reg_index
	mov	r0,	#2Ch
	mov	r1,	#20h
	cmp	r5,	#8				;mov	ern,	sp
	beq	_$L3
	cmp	r5,	#0Ah
	blt	_$ret
	cmp	r5,	#0Ch
	bgt	_$ret
	st	r0,	[ea+]
	st	r1,	[ea+]
	bl	_imm16
	bal	_$ret
_$L3:
	mov	r2,	#73h
	mov	r3,	#70h
	st	r0,	[ea+]
	st	r1,	[ea+]
	st	r2,	[ea+]
	st	r3,	[ea+]
	bal	_$ret

_$ins_5A_F5:
	add	r0,	#6
	mov	r4,	#0Ch
	div	er0,	r4
	mov	r5,	r0
	add	er0,	#30h
	bl	_extract_string
	mov	r0,	r4
	bl	_reg_index
	cmp	r5,	#12h
	bgt	_$ret
	mov	r0,	#2Ch
	mov	r1,	#20h
	st	r0,	[ea+]
	st	r1,	[ea+]
	cmp	r5,	#11h
	blt	_$L5
	bl	_imm16
	bal	_$ret
_$L5:
	bl	_imm8

_$ret:
	mov	r0,	#0
	st	r0,	[ea]
	mov	er0,	er8
	b	_leave

_reg_index:
	push	lr
	add	r0,	#0
	daa	r0
	bl	_hex_byte
	cmp	r0,	#30h
	beq	_$L2
	st	r0,	[ea+]
_$L2:
	st	r1,	[ea+]
	nop
	pop	pc

_simm8:
	push	lr
	l	r0,	[er8]
	add	er8,	#1
	tb	r0.7
	beq	_$pos
	mov	r2,	#60h
	st	r2,	[ea+]
	neg	r0
_$pos:
	bl	_hex_byte
	st	r0,	[ea+]
	st	r1,	[ea+]
	nop
	pop	pc

_imm8:
	push	lr
	l	r0,	[er8]
	add	er8,	#1
	bl	_hex_byte
	st	r0,	[ea+]
	st	r1,	[ea+]
	nop
	pop	pc

_imm16:
	push	lr
	l	r2,	[er8]
	add	er8,	#1
	l	r0,	[er8]
	add	er8,	#1
	bl	_hex_byte
	st	r0,	[ea+]
	st	r1,	[ea+]
	mov	r0,	r2
	bl	_hex_byte
	st	r0,	[ea+]
	st	r1,	[ea+]
	nop
	pop	pc

_ins_1F:
	push	lr
	tb	r6.7
	bne	_$div
	mov	r2,	#byte1 offset _mul
	mov	r3,	#byte2 offset _mul
	bal	_$L4
_$div:
	mov	r2,	#byte1 offset _div
	mov	r3,	#byte2 offset _div
_$L4:
	bl	_$L1
	mov	r0,	r6
	srl	r0,	#3
	and	r0,	#0Eh
	bl	_reg_index
	mov	r2,	#2Ch
	mov	r3,	#20h
	mov	r4,	#72h
	st	r2,	[ea+]
	st	r3,	[ea+]
	st	r4,	[ea+]
	mov	r0,	r6
	and	r0,	#0Fh
	bl	_reg_index
	pop	pc

_ins_20:
	push	lr
	tb	r6.3
	bne	_$st
	mov	r2,	#byte1 offset _l_r
	mov	r3,	#byte2 offset _l_r
	bal	_$L6
_$st:
	mov	r2,	#byte1 offset _st_r
	mov	r3,	#byte2 offset _st_r
_$L6:
	bl	_$L1
	mov	r0,	r6
	srl	r0,	#4
	bl	_reg_index
	mov	r2,	#2Ch
	mov	r3,	#20h
	mov	r4,	#65h
	mov	r5,	#72h
	st	r2,	[ea+]
	st	r3,	[ea+]
	st	r4,	[ea+]
	st	r5,	[ea+]
	mov	r0,	r6
	and	r0,	#07h
	sll	r0,	#1
	bl	_reg_index
	pop	pc

_ins_21:
	push	lr
	tb	r6.7
	bne	_$L7
	tb	r6.3
	bne	_$L8
	mov	r2,	#byte1 offset _mov_er
	mov	r3,	#byte2 offset _mov_er
	bal	_$L10
_$L8:
	mov	r2,	#byte1 offset _add_er
	mov	r3,	#byte2 offset _add_er
	bal	_$L10
_$L7:
	tb	r6.3
	bne	_$L9
	mov	r2,	#byte1 offset _l_er
	mov	r3,	#byte2 offset _l_er
	bal	_$L10
_$L9:
	mov	r2,	#byte1 offset _st_er
	mov	r3,	#byte2 offset _st_er
_$L10:
	bl	_$L1
	mov	r0,	r6
	srl	r0,	#3
	and	r0,	#0Eh
	bl	_reg_index
	mov	r2,	#2Ch
	mov	r3,	#20h
	mov	r4,	#65h
	mov	r5,	#72h
	st	r2,	[ea+]
	st	r3,	[ea+]
	st	r4,	[ea+]
	st	r5,	[ea+]
	mov	r0,	r6
	and	r0,	#07h
	sll	r0,	#1
	bl	_reg_index
	pop	pc

_ins_22:
	push	lr
	tb	r6.7
	bne	_$L11
	tb	r6.3
	bne	_$L12
	mov	r2,	#byte1 offset _l_er
	mov	r3,	#byte2 offset _l_er
	bal	_$L13
_$L12:
	mov	r2,	#byte1 offset _st_er
	mov	r3,	#byte2 offset _st_er
_$L13:
	bl	_$L1
	mov	r0,	r6
	srl	r0,	#3
	and	r0,	#0Eh
_$L16:
	bl	_reg_index
	mov	r2,	#2Ch
	mov	r3,	#20h
	mov	r4,	#65h
	mov	r5,	#72h
	st	r2,	[ea+]
	st	r3,	[ea+]
	bl	_simm8
	mov	r2,	#5Bh
	mov	r3,	#5Dh
	st	r2,	[ea+]
	st	r4,	[ea+]
	st	r5,	[ea+]
	mov	r0,	r6
	and	r0,	#07h
	sll	r0,	#1
	bl	_reg_index
	st	r3,	[ea+]
	nop
	pop	pc
_$L11:
	mov	r2,	#byte1 offset _invalid
	mov	r3,	#byte2 offset _invalid
	bl	_$L1
	pop	pc

_ins_23:
	push	lr
	tb	r6.3
	bne	_$L14
	mov	r2,	#byte1 offset _l_r
	mov	r3,	#byte2 offset _l_r
	bal	_$L15
_$L14:
	mov	r2,	#byte1 offset _st_r
	mov	r3,	#byte2 offset _st_r
_$L15:
	bl	_$L1
	mov	r0,	r6
	srl	r0,	#4
	bal	_$L16

_ins_24:
	push	lr
	tb	r6.3
	bne	_$tb
	cmp	r6,	#80
	blt	_$cmp
	cmp	r6,	#0A0h
	blt	_$daa
	cmp	r6,	#0C0h
	blt	_$das
	cmp	r6,	#0E0h
	blt	_$neg
	cmp	r6,	#0F0h
	bge	_$L11
	mov	r2,	#byte1 offset _extbw_er
	mov	r3,	#byte2 offset _extbw_er
	bl	_$L1
	mov	r0,	r6
	sll	r0,	#1
	and	r0,	#0Eh
	bl	_reg_index
	pop	pc

_$cmp:
	mov	r2,	#byte1 offset _cmp_er
	mov	r3,	#byte2 offset _cmp_er
	bl	_$L1
	mov	r0,	r6
	srl	r0,	#3
	and	r0,	#0Eh
	bl	_reg_index
	mov	r2,	#2Ch
	mov	r3,	#20h
	mov	r4,	#65h
	mov	r5,	#72h
	st	r2,	[ea+]
	st	r3,	[ea+]
	st	r4,	[ea+]
	st	r5,	[ea+]
	mov	r0,	r6
	and	r0,	#07h
	sll	r0,	#1
	bl	_reg_index
	pop	pc
_$daa:
	mov	r2,	#byte1 offset _daa_r
	mov	r3,	#byte2 offset _daa_r
	bal	_$L17
_$das:
	mov	r2,	#byte1 offset _das_r
	mov	r3,	#byte2 offset _das_r
	bal	_$L17
_$neg:
	mov	r2,	#byte1 offset _neg_r
	mov	r3,	#byte2 offset _neg_r
_$L17:
	bl	_$L1
	mov	r0,	r6
	srl	r0,	#1
	and	r0,	#8
	or	r0,	r6
	and	r0,	#0Fh
	bl	_reg_index
	pop	pc

_$tb:
	mov	r2,	#byte1 offset _tb_r
	mov	r3,	#byte2 offset _tb_r
	bl	_$L1
	mov	r0,	r6
	srl	r0,	#4
	bl	_reg_index
	mov	r0,	#2Eh
	st	r0,	[ea+]
	mov	r0,	r6
	and	r0,	#7
	bl	_hex_byte
	st	r1,	[ea+]
	nop
	pop	pc

_ins_25:
	push	lr
	cmp	r6,	#10h
	blt	_$L18
	cmp	r6,	#20h
	blt	_$L19
	cmp	r6,	#30h
	bge	_$L11
	mov	r2,	#byte1 offset _sra_r
	mov	r3,	#byte2 offset _sra_r
	bal	_$L20
_$L18:
	mov	r2,	#byte1 offset _cmp_r
	mov	r3,	#byte2 offset _cmp_r
	bal	_$L20
_$L19:
	mov	r2,	#byte1 offset _cmpc_r
	mov	r3,	#byte2 offset _cmpc_r
_$L20:
	bl	_$L1
	mov	r0,	r6
	and	r0,	#0Fh
	bl	_reg_index
	mov	r2,	#2Ch
	mov	r3,	#20h
	st	r2,	[ea+]
	st	r3,	[ea+]
	bl	_imm8
	pop	pc

_extract_string:
	sll	r0,	#1
	l	er2,	far _pointer_table[er0]
	bal	_$L1
_$extract_loop:
	add	er2,	#1
	st	r0,	[ea+]
_$L1:
	l	r0,	2:[er2]
	bne	_$extract_loop
	rt

tseg	#2	at	0D55Ah

_pointer_table:
	dw	_nop, _add_sp, _sc, _rc, _cplc, _jmp, _call, _call_sys, _ret, _end, 0FFFFh, 0FFFFh, _bnv, _bov, _bps, _bns
	dw	_mov_r, _add_r, _addc_r, _sub_r, _subc_r, _and_r, _or_r, _xor_r, _sll_r, _sllc_r, _srl_r, _srlc_r
	dw	_sra_r, _cmp_r, _cmpc_r, _ins_1F, _ins_20, _ins_21, _ins_22, _ins_23, _ins_24, _ins_25, _bge, _blt
	dw	_bgt, _ble, _bges, _blts, _bgts, _bles, _bne, _beq, _mov_er, _mov_sp, _add_er, _l_er, _st_er
	dw	_push_er, _pop_er, _mov_r, _add_r,	_addc_r, _and_r, _or_r, _xor_r, _sll_r, _sllc_r, _srl_r, _srlc_r
	dw	_l_r, _st_r, _push_r, _pop_r

_optn_table:
	dw	_arithmetic_str, _arithmetic
	dw	_data_transfer_str, _data_transfer
	dw	_branch_inst_str, _branch_inst
	dw	_load_store_str, _load_store

	dw	_push_pop_str, _push_pop
	dw	_misc_str, _misc
	dw	4 dup 00000h

	dw	_goto_menu, _goto_screen
	dw	_copy_menu,	_copy_fn
	dw	_move_menu,	_move_fn
	dw	_fill_menu,	_fill_fn

	dw	_settings_menu,	_settings_screen
	dw	6 dup 00000h

_settings_table:
	dw	_settings_1, _insert_set_screen
	dw	_settings_2, _start_addr_set
	dw	_settings_3, _end_addr_set
	dw	2 dup 00000h

_insert_set_table:
	dw	_inst_set_1, _insert_1_fn
	dw	_inst_set_2, _insert_2_fn
	dw	_inst_set_3, _insert_3_fn

;instruction data
;bit7-need special handling bit6-is complex inst bit5-is branch inst bit4-imm length(1 for 16 bit) bit3-has immediate value bit2-type of operand2(1 for er) bit1-type of operand1(1 for er) bit0-has operand
;when bit 7 is set: bit0-2:instruction code bit3:has a second register operand bit4:has immediate value bit5: type of reg operand 1 bit6: type of reg operand 2
_push_pop_table:
	dw 00000h					;page num
	db 00000001b, 0DEh
	db 00000011b, 4Eh
	db 00000001b, 0EAh
	db 00000011b, 54h
	dw 8 dup 00000h

_load_store_table:
	dw 00000h
	db 00011001b, 0C6h
	db 11001001b, 02h
	db 11011100b, 0Ah
	db 00011011b, 42h
	db 11101010b, 06h
	db 11111011b, 08h
	db 00011001b, 0D2h
	db 11001001b, 03h
	db 11011100b, 0Bh
	db 00011011b, 48h
	db 11101010b, 07h
	db 11111011b, 09h

_misc_table:
	dw 00000h
	db 00111001b, 0FDh
	db 10001101b, 0Dh
	db 10100101b, 11h
	db 00001000b, 0F7h
	db 00000000b, 0F8h
	db 00000000b, 0F9h
	db 00000000b, 0FAh
	db 00000000b, 0F6h
	db 00000000b, 0FEh
	db 00000000b, 0FFh
	dw 2 dup 00000h

_branch_inst_table:
	dw 00001h
	db 00111001b, 26h
	db 00111001b, 27h
	db 00111001b, 28h
	db 00111001b, 29h
	db 00111001b, 2Ah
	db 00111001b, 2Bh
	db 00111001b, 2Ch
	db 00111001b, 2Dh
	db 00111001b, 2Eh
	db 00111001b, 2Fh
	db 00111001b, 0Ch
	db 00111001b, 0Dh
	db 00111001b, 0Eh
	db 00111001b, 0Fh
	db 00111001b, 0FBh
	db 00111001b, 0FCh
	dw 8 dup 00000h

_arithmetic_table:
	dw 00002h
	db 00001001b, 5Ah
	db 01000001b, 11h
	db 00001001b, 66h
	db 01000001b, 12h
	db 00011011b, 3Ch
	db 11101010b, 05h
	db 01000001b, 13h
	db 01000001b, 14h
	db 00001001b, 72h
	db 01000001b, 15h
	db 00001001b, 7Eh
	db 01000001b, 16h
	db 00001001b, 8Ah
	db 01000001b, 17h
	db 00001001b, 96h
	db 01000001b, 18h
	db 00001001b, 0A2h
	db 01000001b, 19h
	db 00001001b, 0AEh
	db 01000001b, 1Ah
	db 00001001b, 0BAh
	db 01000001b, 1Bh
	db 10010110b, 14h
	db 01000001b, 1Ch
	db 10101000b, 00h
	db 10101000b, 01h
	db 10010110b, 12h
	db 01000001b, 1Dh
	db 10010110b, 13h
	db 01000001b, 1Eh
	db 11101101b, 0Ch
	db 10000101b, 0Eh
	db 10000101b, 0Fh
	db 10000101b, 10h
	dw 2 dup 00000h

_data_transfer_table:
	dw 00000h
	db 00001001b, 00h
	db 01000001b, 10h
	db 11101010b, 04h
	db 00000011b, 30h
	db 00000011b, 36h
	dw 7 dup 00000h
	
;strings for instructions in extraordinary encoding are hard-coded to make things easier.
_inst_menu_str_table:
	dw	_mul_str, _div_str, _l_r_er, _st_r_er, _mov_er_er, _add_er_er, _l_er_er, _st_er_er, l_er_d_er, _st_er_d_er
	dw	_l_r_d_er, _st_r_d_er, _cmp_er_er, _tb_r_b, _daa_r, _das_r, _neg_r, _extbw_er, _cmp_r_i, _cmpc_r_i, _sra_r_i

_nop:
	db	"nop\0"
_add_sp:
	db	"add sp\0"
_sc:
	db	"sc\0"
_rc:
	db	"rc\0"
_cplc:
	db	"cplc\0"
_jmp:
	db	"jmp \0"
_call:
	db	"call \0"
_call_sys:
	db	"call_sys \0"
_ret:
	db	"ret\0"
_end:
	db	"end\0"
_bnv:
	db	"bnv \0"
_bov:
	db	"bov \0"
_bps:
	db	"bps \0"
_bns:
	db	"bns \0"
_bge:
	db	"bge \0"
_blt:
	db	"blt \0"
_bgt:
	db	"bgt \0"
_ble:
	db	"ble \0"
_bges:
	db	"bges \0"
_blts:
	db	"blts \0"
_bgts:
	db	"bgts \0"
_bles:
	db	"bles \0"
_bne:
	db	"bne \0"
_beq:
	db	"beq \0"
_mov_r:
	db	"mov r\0"
_mov_er:
	db	"mov er\0"
_mov_sp:
	db	"mov sp, er\0"
_add_r:
	db	"add r\0"
_add_er:
	db	"add er\0"
_addc_r:
	db	"addc r\0"
_sub_r:
	db	"sub r\0"
_subc_r:
	db	"subc r\0"
_and_r:
	db	"and r\0"
_or_r:
	db	"or r\0"
_xor_r:
	db	"xor r\0"
_sll_r:
	db	"sll r\0"
_sllc_r:
	db	"sllc r\0"
_srl_r:
	db	"srl r\0"
_srlc_r:
	db	"srlc r\0"
_sra_r:
	db	"sra r\0"
_cmp_r:
	db	"cmp r\0"
_cmp_er:
	db	"cmp er\0"
_cmpc_r:
	db	"cmpc r\0"
_mul:
	db	"mul er\0"
_div:
	db	"div er\0"
_l_r:
	db	"l r\0"
_l_er:
	db	"l er\0"
_st_r:
	db	"st r\0"
_st_er:
	db	"st er\0"
_push_r:
	db	"push r\0"
_push_er:
	db	"push er\0"
_pop_r:
	db	"pop r\0"
_pop_er:
	db	"pop er\0"
_daa_r:
	db	"daa r\0"
_das_r:
	db	"das r\0"
_neg_r:
	db	"neg r\0"
_extbw_er:
	db	"extbw er\0"
_tb_r:
	db	"tb r\0"
_invalid:
	db	"Invalid\0"

_mul_str:
	db	"mul ern, rm\0"
_div_str:
	db	"div ern, rm\0"
_l_r_er:
	db	"l rn, [erm]\0"
_st_r_er:
	db	"st rn, [erm]\0"
_mov_er_er:
	db	"mov ern, erm\0"
_add_er_er:
	db	"add ern, erm\0"
_l_er_er:
	db	"l ern, [erm]\0"
_st_er_er:
	db	"st ern, [erm]\0"
l_er_d_er:
	db	"l ern, #Disp8[erm]\0"
_st_er_d_er:
	db	"st ern, #Disp8[erm]\0"
_l_r_d_er:
	db	"l rn, #Disp8[erm]\0"
_st_r_d_er:
	db	"st rn, #Disp8[erm]\0"
_cmp_er_er:
	db	"cmp ern, erm\0"
_tb_r_b:
	db	"tb rn.m\0"
_cmp_r_i:
	db	"cmp rn, #imm8\0"
_cmpc_r_i:
	db	"cmpc rn, #imm8\0"
_sra_r_i:
	db	"sra rn, #imm8\0"

_addr_str:
	db	"#addr\0"

_imm8_str:
	db	", #imm8\0"

_imm16_str:
	db	", #imm16\0"

_erm_str:
	db	", erm\0"

_rm_str:
	db	", rm\0"

_sp_str:
	db	", sp\0"

_submode_0:
	db	"Disas Mode \0"

_submode_1:
	db	" Hex Mode  \0"

_goto_menu:
	db	"Go to...\0"

_copy_menu:
	db	"Copy\0"

_move_menu:
	db	"Move\0"

_fill_menu:
	db	"Fill\0"

_goto:
	db	"Go to:\0"

_settings_menu:
	db	"Settings\0"

_move_str:
	db	"Move data:\0"

_copy_str:
	db	"Copy data:\0"
_copy_str_1:
	db	"bytes from\0"
_copy_str_2:
	db	"to\0"

_fill_str:
	db	"Fill data:\0"
_fill_str_1:
	db	"with\0"

_settings_1:
	db	"New instruction\0"
_settings_2:
	db	"Set start addr\0"
_settings_3:
	db	"Set end addr\0"
_inst_set_1:
	db	"Overwrite\0"
_inst_set_2:
	db	"Move till FF\0"
_inst_set_3:
	db	"Move till end\0"

_arithmetic_str:
	db	"Arithmetic inst\0"
_data_transfer_str:
	db	"Data transfer\0"
_branch_inst_str:
	db	"Branch inst\0"
_load_store_str:
	db	"Load/store inst\0"

_push_pop_str:
	db	"Push/pop inst\0"
_misc_str:
	db	"Miscellaneous\0"

_sel_operand:
	db	"Select operand\0"
_sel_rn:
	db	"Rn? [0-B]\0"
_sel_ern:
	db	"ERn? [0-A]\0"
_sel_bit:
	db	"bit? [0-7]\0"

_sel_imm:
	db	"Input immediate\0"
_sel_imm_2:
	db	"value:\0"

_sel_sys_func:
	db	"Input function"
__sys_func:
	db	":\0"

_input_branch:
	db	"1.Input addr...\0"
_sel_branch:
	db	"2.Select...\0"
_sel_branch_addr:
	db	"Input address:\0"

_program_main	EQU	03h:01000h
_enter	EQU	00h:09D22h
_leave	EQU	00h:09D2Ah
_hex_byte	EQU	02h:02492h
_clear_DDD4	EQU	00h:07F00h
_render_DDD4	EQU	00h:08704h
_render_E3D4	EQU	00h:086F8h
_line_print	EQU	00h:0821Eh
_char_print	EQU	00h:082F6h
_convert_keycode	EQU	02h:052DCh
_reset_ko	EQU	00h:0939Ah
_shutdown	EQU	00h:09118h
_render_stat_bar	EQU	00h:08786h
_display_menu	EQU	02h:063C8h
_wait_input	EQU	00h:0F746h
_strcpy	EQU	00h:0D070h
_smart_memcpy	EQU	00h:09A3Ah
_memset	EQU	00h:0F1A8h
_draw_scroll_bar	EQU	02h:083C6h
_fill_screen	EQU	00h:07EACh
