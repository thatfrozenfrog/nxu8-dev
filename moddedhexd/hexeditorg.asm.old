;replacing ratio mode in fx-580vnx
;begins at 3:1000H

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

cseg	#3	at	1000h

_hex_editor_mode:
	push	lr
	push	xr4
	mov	r4,	#0
	st	r4,	0D110h
	bal	_$start
_$ret_main:
	bl	_restore_SFR
	pop	xr4
	pop	pc

_$start:
	bl	_startup_screen

	bl	_hex_editor

	bal	_$ret_main

_startup_screen:
	push	lr
	bl	_enter	;0:9D22
	add	sp,	#-16h
	mov	bp,	sp
	mov	r0,	#0Ah
	st	r0,	0D137h
	mov	r0,	#1
	st	r0,	0D139h
	bl	_clear_DDD4	;0:7F00
	mov	r8,	#BYTE3 startup_str_1
	mov	r10,	#BYTE1 startup_str_1
	mov	r11,	#BYTE2 startup_str_1
	push	r8
	push	er10
	mov	er0,	bp
	bl	_extract_string
	add	sp,	#4

	mov	r0,	#2
	mov	r1,	#2
	mov	er2,	bp
	bl	_line_print	;0:821E

	add	er10,	#startup_str_1_len
	push	r8
	push	er10
	mov	er0,	bp
	bl	_extract_string
	add	sp,	#4

	mov	r0,	#2
	mov	r1,	#10h
	mov	er2,	bp
	bl	_line_print	;0:821E

	mov	r0,	#2
	mov	r1,	#30h
	mov	r2,	#BYTE1 press_ac_str
	mov	r3,	#BYTE2 press_ac_str
	bl	_line_print	;0:821E

	bl	_render_DDD4	;0:8704

	bl	_wait_AC

	b	_leave	;0:9D2A

_extract_string:
	push	fp
	mov	fp,	sp
	push	xr4
	mov	er6,	er0
_$extract_loop:
	l	r2,	04h[fp]
	l	er4,	02h[fp]
	l	r0,	r2:[er4]
	st	r0,	[er6]
	add	er4,	#1
	st	er4,	02h[fp]
	add	er6,	#1
	mov	r0,	r0
	bne		_$extract_loop

	pop	xr4
	mov	sp,	fp
	pop	fp
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

;main function of the hex editor
_hex_editor:
	push	lr
	bl	_enter
	add	sp,	#-6
	mov	bp,	sp
	mov 	r0, 	#00h
	mov 	r1,	#212
	st 	er0, 	0D400h
	mov	er0,	#0
	st	er0,	02h[bp]	
	gjmp	_$full_repaint
_$hexed_loop:
	mov	er0,	#0
	st	er0,	[bp]
	mov	r0,	#1
	st	er0,	04h[bp]
	mov	er0,	bp
	bl 	_get_keycode_fixed
	mov	r0,	r0
	bne	_$has_key_press
	mov	er0,	#0
	st	er0,	last_ki_ko
	gjmp	_$refresh

_$has_key_press:
	l	er0,	[bp]
	l	er2,	0D150h
	cmp	er0,	er2
	gbeq	_$refresh
	st	er0,	0D150h
	mov	r0,	#0
	st	r0,	04h[bp]
	mov	er0,	bp
	mov	r2,	#BYTE1 keytable
	mov	r3,	#BYTE2 keytable
	bl	_convert_keycode	;2:52DC
	mov	er2,	#30h
	cmp	er0,	er2
	gblt	_$refresh
	mov	er2,	#3Fh
	cmp	er0,	er2
	gble	_$type
	cmp	r1,	#0FCh
	gbne	_$refresh
	cmp	r0,	#1Fh
	gbeq	_$L1
	cmp	r0,	#1Eh
	gbeq	_$L2
	cmp	r0,	#1Ch
	gbeq	_$L3
	cmp	r0,	#1Dh
	gbeq	_$L4
	cmp	r0,	#28h
	gbeq	_$alpha
	cmp	r0,	#29h
	gbeq	_$shift
	cmp	r0,	#26h
	gbeq	_$ac
	cmp	r0,	#24h
	gbne	_$refresh
;if menu pressed
	tb	0D110h.2
	gbne	_$refresh
	bl	_menu_handle
	cmp	r0,	#0
	gbne	_$hexed_ret
	gjmp	_$full_repaint

_$L1:
	mov	r0,	#0FFh
	mov	r1,	r0
	mov	r2,	r1
	gjmp	_$change_addr
_$L2:
	mov	r0,	#1
	mov	r1,	#0
	mov	r2,	r1
	gjmp	_$change_addr
_$L3:
	mov	r0,	#0
	mov	r2,	#0FFh
	tb	0D110h.2
	gbne	_$L3_1
	mov	r1,	r2
	tb	0D110h.3
	gbne	_$change_addr
	mov	r0,	#0F8h
	gjmp	_$change_addr
_$L3_1:
	mov	r1,	r0
	gjmp	_$change_addr
_$L4:
	mov	r0,	#0
	tb	0D110h.2
	gbne	_$L4_1
	mov	r2,	r0
	tb	0D110h.3
	gbne	_$L4_2
	mov	r1,	r0
	mov	r0,	#8
	gjmp	_$change_addr
_$L4_1:
	mov	r1,	r0
	mov	r2,	#1
	gjmp	_$change_addr
_$L4_2:
	mov	r1,	#1
_$change_addr:
	mov	er4,	#1
	st	r5,	02h[bp]
	st	r4,	04h[bp]
	l	er4,	0D400h
	l	r6,	0D402h
	add	er4,	er0
	addc	r6,	r2
	and	r6,	#1Fh	;dsr is masked with 0x1F
	st	er4,	0D400h
	st	r6,	0D402h
	l	er0,	0D404h
	l	r2,	0D406h
	cmp	er0,	er4
	cmpc	r2,	r6
	gbgt	_$L5

	add	er0,	#20h
	addc	r2,	#0
	cmp	er0,	er4
	cmpc	r2,	r6
	gbgt	_$full_repaint

	mov	er0,	#18h
	sub	r4,	r0
	subc	r5,	r1
	subc	r6,	r1
	and	r6,	#1Fh

_$L5:
	and	r4,	#0F8h
	st	er4,	0D404h
	st	r6,	0D406h
	gjmp	_$full_repaint

_$shift:
	rb	0D110h.2
	l	r0,	0D110h
	xor	r0,	#8
	st	r0,	0D110h
	gjmp	_$refresh_stat_bar

_$alpha:
	rb	0D110h.3
	l	r0,	0D110h
	xor	r0,	#4
	st	r0,	0D110h
	gjmp	_$refresh_stat_bar

_$ac:
	l 	er14, 	0D400h
	mov 	sp,	er14
	pop lr
	add sp, #-4h
	pop pc
	brk

_$type:
	l	r2,	02h[bp]
	gbne	_$write
	st	r0,	0D180h
	mov	r0,	#1
	st	r0,	02h[bp]
	gjmp	_$refresh
_$write:
	l	r1,	0D180h
	sll	r1,	#4
	and	r0,	#0Fh
	or	r0,	r1
	l	er2,	0D400h
	l	r4,	0D402h
	st	r0,	r4:[er2]
	mov	r0,	#0
	st	r0,	02h[bp]
	gjmp 	_$L2
_$full_repaint:
	mov	r0,	#1
	gjmp	_$repaint
_$refresh_stat_bar:
	bl	_render_stat_bar
	mov	r0,	#1
	st	r0,	04h[bp]
_$refresh:
	mov	r0,	#0
_$repaint:
	l	r2,	04h[bp]
	bne	_$keep_stat
	mov	r2,	#0
	st	r2,	0D110h
_$keep_stat:
	push	r0
	bl	_repaint
	add	sp,	#2
	gjmp	_$hexed_loop
	
_$hexed_ret:
	b	_leave

_menu_handle:
	push	lr
;backup the SFRs related to the timer
	l	r0,	0F00Ah
	push	r0
	l	er0,	0F010h
	push	er0
	l	r0,	0F018h
	push	r0
	l	er0,	0F020h
	push	er0
	l	er0,	0F024h
	push	er0
	l	r0,	0F028h
	push	r0
	bl	_restore_SFR

;also handle settings menu here
	mov	r0,	#0
	st	r0,	0D142h
	st	r0,	0D164h
	st	r0,	0D165h
	tb	0D110h.3
	bne	_$settings
	mov	r0,	#1
	st	r0,	0D113h
	mov	r0,	#0
	st	r0,	0D110h
	bl	_display_menu	;2:63C8
	bal	_$menu_ret
_$settings:
	mov	r0,	#2
	st	r0,	0D113h
	mov	r0,	#0
	st	r0,	0D110h
	bl	_display_settings	;2:88EE
	mov	r0,	#0

_$menu_ret:
	mov	r2,	r0
	mov	r0,	#0
	st	r0,	0D113h

	pop	r0
	st	r0,	0F028h
	pop	er0
	st	er0,	0F024h
	pop	er0
	st	er0,	0F020h
	pop	r0
	st	r0,	0F018h
	pop	er0
	st	er0,	0F010h
	pop	r0
	st	r0,	0F00Ah

	mov	r0,	r2
	pop	pc

_repaint:
	push	lr
	bl	_enter
	add	sp,	#-0Eh
	mov	bp,	sp
	mov	er2,	#0
	l	r0,	10h[fp]
	beq	_$L6
	bl	_clear_DDD4	;0:7F00
	mov	er2,	#1
_$L6:
	st	er2,	0Ah[bp]
	mov	er0,	#1
	st	r0,	0D139h
	st	r1,	0D138h
	mov	r0,	#0Ah
	st	r0,	0D137h
	mov	r0,	#0
	mov	r1,	#2
	st	er0,	08h[bp]
	mov	r0,	#10h
	mov	r1,	#0D4h
	st	er0,	0Ch[bp]
	mov	r7,	#4
	l	er4,	0D400h
	l	r6,	0D402h
	l	er8,	0D404h
	l	r10,	0D406h
_$loop1:
	l	r0,	10h[fp]
	beq	_$L7
	lea	[bp]
	mov	r0,	r10
	bl	_hex_byte	;2:2492
	st	er0,	[ea+]
	mov	r0,	#3Ah
	st	r0,	[ea+]
	mov	r0,	r9
	bl	_hex_byte	;2:2492
	st	r0,	[ea+]
	st	r1,	[ea+]
	mov	r0,	r8
	bl	_hex_byte	;2:2492
	st	r0,	[ea+]
	st	r1,	[ea+]
	mov	r0,	#0
	st	r0,	[ea]
	mov	er2,	bp
	l	r1,	09h[bp]
	mov	r0,	#2
	bl	_line_print	;0:821E
_$L7:
	mov	r0,	#3Ch
	st	r0,	08h[bp]
	mov	r11,	#8
_$loop2:
	l	r0,	r10:[er8]
	l	er2,	0Ch[bp]
	l	r1,	[er2]
	st	r0,	[er2]
	add	er2,	#1
	st	er2,	0Ch[bp]
	l	r2,	10h[fp]
	bne	_$L8
	cmp	r0,	r1
	beq	_$L10
	mov	r1,	#1
	st	r1,	0Ah[bp]
_$L8:
	bl	_hex_byte	;2:2492
	st	er0,	[bp]
	mov	r0,	#0
	st	r0,	02h[bp]
	cmp	er4,	er8
	cmpc	r6,	r10
	bne	_$L9
	mov	r0,	#4
	st	r0,	0D138h
_$L9:
	l	er0,	08h[bp]
	mov	er2,	bp
	bl	_line_print	;0:821E
	mov	r0,	#0
	st	r0,	0D138h
_$L10:
	l	er0,	08h[bp]
	add	er0,	#10h
	st	er0,	08h[bp]
	add	er8,	#1
	addc	r10,	#0
	and	r10,	#1Fh
	add	r11,	#-1
	bne	_$loop2

	l	r1,	09h[bp]
	add	r1,	#0Ah
	st	r1,	09h[bp]

	add	r7,	#-1
	bne	_$loop1
	
	l	r0,	10h[fp]
	beq	_$skip_addr_print
	lea	[bp]
	mov	r0,	r6
	bl	_hex_byte
	st	er0,	[ea+]
	mov	r0,	#3Ah
	st	r0,	[ea+]
	mov	r0,	r5
	bl	_hex_byte
	st	r0,	[ea+]
	st	r1,	[ea+]
	mov	r0,	r4
	bl	_hex_byte
	st	r0,	[ea+]
	st	r1,	[ea+]
	mov	r0,	#0
	st	r0,	[ea]
	mov	r0,	#0Eh
	st	r0,	0D137h
	mov	r0,	#2
	mov	r1,	#30h
	mov	er2,	bp
	bl	_line_print

_$skip_addr_print:
	l	r0,	0Ah[bp]
	beq	_$L11
	bl	_render_DDD4	;0:8704

_$L11:
	bl	_render_stat_bar
	b	_leave

_restore_SFR:
	mov	r0,	#1
	st	r0,	0F00Ah
	mov	er0,	#22h
	st	er0,	0F010h
	mov	r0,	#3
	st	r0,	0F018h
	mov	r0,	#17h
	st	r0,	0F028h
	rt
_$delay_keycode:
	bl	_get_keycode
	push 	er0
	mov 	r0, 	#10h
	mov 	r1, 	#00h
	bl 	_delay
	pop 	er0
	nop
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
