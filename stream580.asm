type(ML620906)
model	large

;stream using ssio master mode (2MHz clock, type 0)
;16-grayscale managed by TM0INT
;buffer from D200 to E9FF

;__5A-sync signal(transmit)/start transmission
;__A5-sync signal(receive)/new frame
;FFFF-stop transmission
;__3C-key release
;other transmit data-kiko value
;a key is recognized if a valid ki_ko value is sent after a key release message.

transmit_data	EQU	0D000h
curr_addr	EQU	0D002h
sync_counter	EQU	0D004h
buf_counter	EQU	0D006h

;set flags as global variable for interrupt handler to detect
;bit0-time out bit1-key pressed bit2-key released bit3-optn pressed bit7-running
flags	EQU	0D106h

sync_thresh	EQU	0D104h

font_size	EQU	0D137h
font_color	EQU	0D138h
curr_buffer	EQU	0D139h
last_ki_ko	EQU	0D150h
keycode_comp	EQU	0775Ch

cseg	#0	at	0A1BCh

_SIO0INT:
	push	xr0
	l	er0,	SIO0BUF
	l	er2,	curr_addr
	st	er0,	[er2]
	cmp	r3,	#0EAh
	bge	frame_end
	add	er2,	#2
	st	er2,	curr_addr
ssioret:
	l	er0,	transmit_data
	st	er0,	SIO0BUF
	sb	S0EN
ssiobreak:
	pop	xr0
	rti
frame_end:
	l	r2,	transmit_data
	cmp	r2,	#5Ah
	beq	sync
	rb	EXI0
	mov	r0,	#5Ah
	st	r0,	transmit_data
	bal	ssioret
sync:
	cmp	r0,	#0A5h
	beq	new_frame
	l	er0,	sync_counter
	add	er0,	#1
	st	er0,	sync_counter
	l	er2,	sync_thresh
	cmp	er0,	er2
	blt	ssioret
	sb	flags.0
	bal	ssiobreak
new_frame:
	mov	er0,	#0
	st	er0,	transmit_data
	st	er0,	sync_counter
	mov	r1,	#0D2h
	st	er0,	curr_addr
	sb	EXI0
	bal	ssioret

cseg	#3	at	02AC4h

_TM0INT:
	push	elr,epsw,ea
	ei
	push	qr0
	push	qr8
	tb	flags.7
	beq	L1
;stops the transmission while doing buffer switch.
;this takes around 10% of the cpu time.
	rb	ESIO0
	l	r0,	buf_counter
	add	r0,	#1
	cmp	r0,	#0Eh
	ble	L2
	mov	r0,	#0
L2:
	st	r0,	buf_counter
	tb	r0.0
	bne	L3
	mov	r1,	#0D2h
	bal	paint
L3:
	tb	r0.1
	bne	L4
	mov	r1,	#0D8h
	bal	paint
L4:
	tb	r0.2
	bne	L5
	mov	r1,	#0DEh
	bal	paint
L5:
	mov	r1,	#0E4h
paint:
	mov	r0,	#0
	push	er0
	mov	r2,	#0
	mov	r3,	#0F8h
	mov	r0,	#40h
render_loop:
	pop	ea
	l	xr4,	[ea+]
	l	qr8,	[ea+]
	push	ea
	lea	[er2]
	st	xr4,	[ea+]
	st	qr8,	[ea+]
	add	er2,	#0Ch
	pop	ea
	l	xr4,	[ea+]
	l	qr8,	[ea+]
	push	ea
	lea	[er2]
	st	xr4,	[ea+]
	st	qr8,	[ea+]
	add	er2,	#14h
	add	r0,	#-1
	bne	render_loop
	pop	er0
	sb	ESIO0
TM0INT_ret:
	pop	qr8
	pop	qr0
	pop	pc,psw,ea
L1:
	push	lr
	bl	_solar_handle
	pop	lr
	bal	TM0INT_ret

_XI0INT:
	push	lr
	push	xr0
	tb	flags.7
	beq	xi0ret
	mov	r0,	#0
	st	r0,	KOD0
	mov	r0,	#byte1 last_ki_ko
	mov	r1,	#byte2 last_ki_ko
	bl	_get_keycode_fixed
	mov	r0,	r0
	beq	L14
	l	er0,	last_ki_ko
	cmp	r0,	#40h
	cmpc	r1,	#1
	bne	L16
	sb	flags.3
L16:
	st	er0,	transmit_data
	mov	r0,	#0
	st	r0,	KIMASK
	sb	flags.1
L14:
	rb	QXI0
	mov	r0,	#0FFh
	st	r0,	KOD0
xi0ret:
	pop	xr0
	pop	lr
	rti

start_transmission:
	mov	r0,	#0
	mov	r1,	#0EAh
	st	er0,	curr_addr
	mov	er0,	#0
	st	er0,	transmit_data
	st	er0,	sync_counter
	mov	r0,	#2
	st	r0,	flags
	ei
	sb	QSIO0
	sb	ESIO0
	sb	flags.7
	rt

stop_transmission:
	rb	ESIO0
wait_stop:
	tb	S0EN
	bne	wait_stop
	mov	er0,	#-1
	st	er0,	SIO0BUF
	sb	S0EN
	rb	flags.7
	sb	flags.0
	rt

clear_buffer:
	push	qr8
	lea	0D200h
	mov	er8,	#0
	mov	er10,	#0
	mov	er12,	#0
	mov	er14,	#0
	mov	r0,	#0
	mov	r1,	#3
clear_loop:
	st	qr8,	[ea+]
	add	er0,	#-1
	bne	clear_loop
	pop	qr8
	rt

stream_mode:
	push	lr
	rb	T0RUN
	rb	QTM0
	bl	stream_main
	bl	_reset_magic_string
	mov	r0,	#17h
	st	r0,	BLKCON0
	bl	_reset_screen_sfr
	mov	er0,	#1
	bl	_delay
	pop	pc

stream_main:
	push	lr
	bl	_enter
	add	sp,	#-10h
	mov	bp,	sp

	mov	er0,	#0
	st	er0,	buf_counter
	st	r0,	flags

	ei

;initialise SFRs
	rb	DTM0
	rb	DSIO0

	mov	r0,	#1
	st	r0,	FCON

	mov	er0,	#1
	st	r1,	P1D
	st	r0,	P1DIR
	mov	r0,	#6
	st	r0,	P1CON0
	mov	r0,	#7
	st	r0,	P1CON1
	st	r0,	P1MOD0

	mov	er0,	#0
	st	er0,	SIO0BUF
	st	r0,	SIO0CON
	mov	er0,	#0Fh
	st	r0,	SIO0MOD0
	st	r1,	SIO0MOD1

	mov	r0,	#6
	st	r0,	0F034h
	mov	r0,	#10h
	st	r0,	0F032h
	mov	r0,	#3
	st	r0,	0F033h
	mov	r0,	#30h
	st	r0,	0F035h
	mov	er0,	#1
	st	r0,	0F036h
	st	r1,	0F037h
	st	r1,	0F039h

	mov	er0,	#0
	lea	TM0D
	st	er0,	[ea+]
	st	er0,	[ea+]
	st	er0,	[ea]
;set the timer interval here
	mov	r0,	#0
	mov	r1,	#50h
	st	er0,	TM0D
	mov	r0,	#8
	st	r0,	TM0CON0
	mov	r0,	#1
	st	r0,	TM0CON1
	sb	ETM0

	mov	r0,	#0
	st	r0,	KICON
	st	r0,	KOMASK0

connect:
	mov	r0,	#0
	st	r0,	KIMASK
	mov	r0,	#0FFh
	st	r0,	KOD0
	rb	QXI0
	bl	clear_buffer
	bl	start_transmission

stream_loop:
	rb	flags.0
	beq	L6
	rb	ESIO0
	rb	flags.7
	bal	stop_scr_repaint
L6:
	tb	flags.7
	beq	stop_handle

	rb	flags.3
	bne	optn_handle

	tb	flags.1
	beq	L7
	l	er0,	last_ki_ko
	bl	is_key_pressed
	mov	r0,	r0
	bne	stream_loop
	rb	flags.1
	sb	flags.2
L7:
	tb	flags.2
	beq	stream_loop
	l	er0,	curr_addr
	cmp	r1,	#0EAh
	bge	stream_loop
	mov	er0,	#3Ch
	st	er0,	transmit_data
	rb	flags.2
	mov	r0,	#0FFh
	st	r0,	KIMASK
	st	r0,	KOD0
	bal	stream_loop

optn_handle:
	bl	stop_transmission
	bl	clear_buffer
	bl	stream_optn
	mov	r0,	r0
	bne	stop_scr_repaint
	bal	connect

stop_handle:
	mov	er0,	#0
	st	er0,	[bp]
	mov	er0,	bp
	bl	_get_keycode_fixed
	mov	r0,	r0
	bne	stream_key_press
	mov	er0,	#0
	st	er0,	last_ki_ko
	bal	stream_loop

stream_key_press:
	l	er0,	[bp]
	l	er2,	last_ki_ko
	bne	stream_loop
	st	er0,	last_ki_ko
	mov	er0,	bp
	mov	r2,	#byte1 keycode_comp
	mov	r3,	#byte2 keycode_comp
	bl	_convert_keycode
	cmp	r1,	#0FCh
	bne	stream_loop
	cmp	r0,	#2Dh
	beq	connect
	cmp	r0,	#1
	beq	optn
	cmp	r0,	#24h
	bne	stream_loop
	bl	_menu_handle
	b	_leave

optn:
	bl	stream_optn
	mov	r0,	r0
	bne	connect
	
stop_scr_repaint:
	bl	_clear_DDD4
	mov	er0,	#0Eh
	st	r0,	font_size
	st	r1,	font_color
	mov	r0,	#1
	st	r0,	curr_buffer

	lea	[bp]
	mov	r2,	#byte1 offset _stop_str_1
	mov	r3,	#byte2 offset _stop_str_1
	bl	extract_str
	st	r0,	[ea]
	mov	r0,	#0
	mov	r1,	#1
	mov	er2,	bp
	bl	_line_print

	lea	[bp]
	mov	r2,	#byte1 offset _stop_str_2
	mov	r3,	#byte2 offset _stop_str_2
	bl	extract_str
	st	r0,	[ea]
	mov	r0,	#0
	mov	r1,	#31h
	mov	er2,	bp
	bl	_line_print

	bl	_render_DDD4
	gjmp	stream_loop

stream_optn:
	push	lr
	bl	_enter
	add	sp,	#-10h
	mov	bp,	sp

optn_repaint:
	bl	_clear_DDD4
	mov	er0,	#0Eh
	st	r0,	font_size
	st	r1,	font_color
	mov	r0,	#1
	st	r0,	curr_buffer

	mov	r2,	#byte1 offset _optn_str
	mov	r3,	#byte2 offset _optn_str
	push	er2
	mov	r4,	#1
	mov	r5,	#4
print_loop:
	lea	[bp]
	pop	er2
	bl	extract_str
	st	r0,	[ea]
	add	er2,	#1
	push	er2
	mov	r0,	#0
	mov	r1,	r4
	mov	er2,	bp
	bl	_line_print
	add	r4,	#10h
	add	r5,	#-1
	bne	print_loop
	add	sp,	#2
	bl	_render_DDD4

optn_loop:
	mov	er0,	#0
	st	er0,	[bp]
	mov	er0,	bp
	bl	_get_keycode_fixed
	mov	r0,	r0
	bne	optn_key_press
	mov	er0,	#0
	st	er0,	last_ki_ko
	bal	optn_loop

optn_key_press:
	l	er0,	[bp]
	l	er2,	last_ki_ko
	bne	optn_loop
	st	er0,	last_ki_ko
	mov	er0,	bp
	mov	r2,	#byte1 keycode_comp
	mov	r3,	#byte2 keycode_comp
	bl	_convert_keycode
	mov	er2,	#31h
	cmp	er0,	er2
	blt	optn_loop
	mov	er2,	#34h
	cmp	er0,	er2
	ble	select
	cmp	r0,	#26h
	cmpc	r1,	#0FCh
	beq	optn_ret
	cmp	r0,	#1
	cmpc	r1,	#0FCh
	bne	optn_loop
optn_ret:
	mov	r0,	#0
	b	_leave

select:
	cmp	r0,	#31h
	bne	L10
	mov	r0,	#1
	b	_leave
L10:
	cmp	r0,	#32h
	bne	L11
	mov	r0,	#20h
	mov	r1,	#0F0h
	mov	r2,	#25h
	mov	r3,	#0F0h
	bal	L13
L11:
	cmp	r0,	#33h
	bne	L12
	mov	r0,	#30h
	mov	r1,	#0F0h
	mov	r2,	#3Fh
	mov	r3,	#0F0h
	bal	L13
L12:
	mov	r0,	#byte1 sync_thresh
	mov	r1,	#byte2 sync_thresh
	mov	er2,	er0
	add	er2,	#1
L13:
	bl	hex_editor
	bal	optn_repaint

;range from [er0] to [er2]
;no auto refresh
hex_editor:
	push	lr
	bl	_enter
	add	sp,	#-0Eh
	mov	bp,	sp
	mov	er8,	er0
	mov	er10,	er2
	st	er0,	-02[fp]
	and	r0,	#0F8h
	st	er0,	-04[fp]
	mov	er0,	#0
	st	er0,	-06[fp]
	bal	hexed_repaint

hexed_loop:
	mov	er0,	#0
	st	er0,	[bp]
	mov	er0,	bp
	bl	_get_keycode_fixed
	mov	r0,	r0
	bne	hexed_key_press
	mov	er0,	#0
	st	er0,	last_ki_ko
	bal	hexed_loop

hexed_key_press:
	l	er0,	[bp]
	l	er2,	last_ki_ko
	bne	hexed_loop
	st	er0,	last_ki_ko
	mov	er0,	bp
	mov	r2,	#byte1 keycode_comp
	mov	r3,	#byte2 keycode_comp
	bl	_convert_keycode
	mov	er2,	#30h
	cmp	er0,	er2
	blt	hexed_loop
	mov	er2,	#3Fh
	cmp	er0,	er2
	ble	_type
	cmp	r1,	#0FCh
	bne	hexed_loop
	cmp	r0,	#1Ch
	beq	hex_up
	cmp	r0,	#1Dh
	beq	hex_down
	cmp	r0,	#1Eh
	beq	hex_right
	cmp	r0,	#1Fh
	beq	hex_left
	cmp	r0,	#26h
	bne	hexed_loop
	b	_leave

_type:
	l	r2,	-05[fp]
	bne	write
	st	r0,	-06[fp]
	mov	r0,	#1
	st	r0,	-05[fp]
	bal	hexed_loop
write:
	l	r1,	-06[fp]
	sll	r1,	#4
	and	r0,	#0Fh
	or	r0,	r1
	l	er2,	-02[fp]
	st	r0,	[er2]
	mov	r0,	#0
	st	r0,	-05[fp]
	bal	hex_right

hex_up:
	mov	er0,	#-8
	bal	change_addr

hex_down:
	mov	er0,	#8
	bal	change_addr

hex_left:
	mov	er0,	#-1
	bal	change_addr

hex_right:
	mov	er0,	#1

change_addr:
	l	er2,	-02[fp]
	add	er2,	er0
	cmp	er2,	er8
	blt	hexed_repaint
	cmp	er2,	er10
	bgt	hexed_repaint
	st	er2,	-02[fp]
	mov	r4,	#0
	st	r4,	-05[fp]
	l	er0,	-04[fp]
	cmp	er0,	er2
	bgt	L9

	add	er0,	#20h
	cmp	er0,	er2
	bgt	hexed_repaint
	add	er2,	#-18h
L9:
	and	r2,	#0F8h
	st	er2,	-04[fp]

hexed_repaint:
	bl	_clear_DDD4
	mov	er0,	#1
	st	r0,	curr_buffer
	st	r1,	font_color
	mov	r0,	#0Ah
	st	r0,	font_size
	mov	r0,	#4
	st	r0,	06[bp]
	mov	r7,	#1
	l	er4,	-04[fp]
loop1:
	lea	[bp]
	mov	r0,	r5
	bl	_hex_byte
	st	er0,	[ea+]
	mov	r0,	r4
	bl	_hex_byte
	st	er0,	[ea+]
	mov	r0,	#0
	st	r0,	[ea]
	mov	er2,	bp
	mov	r6,	#0
	mov	er0,	er6
	bl	_line_print
	mov	r6,	#3Ch
	mov	r0,	#8
	st	r0,	07[bp]
loop2:
	cmp	er4,	er8
	blt	skip
	l	r0,	[er4]
	bl	_hex_byte
	st	er0,	[bp]
	mov	r0,	#0
	st	r0,	02h[bp]
	l	er0,	-02[fp]
	cmp	er0,	er4
	bne	L8
	mov	r0,	#4
	st	r0,	font_color
L8:
	mov	er0,	er6
	mov	er2,	bp
	bl	_line_print
	mov	r0,	#0
	st	r0,	font_color
skip:
	add	er6,	#10h
	add	er4,	#1
	cmp	er4,	er10
	bgt	break
	l	r0,	07[bp]
	add	r0,	#-1
	st	r0,	07[bp]
	bne	loop2

	add	r7,	#0Ah
	l	r0,	06[bp]
	add	r0,	#-1
	st	r0,	06[bp]
	bne	loop1

break:
	lea	[bp]
	l	er2,	-02[fp]
	mov	r0,	r3
	bl	_hex_byte
	st	er0,	[ea+]
	mov	r0,	r2
	bl	_hex_byte
	st	er0,	[ea+]
	mov	er0,	#0Eh
	st	r1,	[ea]
	st	r0,	0D137h
	mov	r0,	#2
	mov	r1,	#30h
	mov	er2,	bp
	bl	_line_print
	bl	_render_DDD4

	gjmp	hexed_loop

is_key_pressed:
	push	er4
	mov	r2,	#0
	st	r2,	KOD0
	st	r2,	KOMASK0
	st	r1,	KOD0
	mov	r3,	#1
	mov	er4,	#4
	bal	delay
delay:
	l	r2,	KID
	xor	r2,	#0FFh
	and	r2,	r0
	bne	L15
	add	r4,	#-1
	bne	delay
	mov	r3,	#0
L15:
	mov	r0,	r3
	st	r5,	KOD0
	pop	er4
	rt

tseg	#2	at	0E0DAh

_stop_str_1:
	db	"Not connected\0"
_stop_str_2:
	db	"[=]:Connect\0"

_optn_str:
	db	"1:Start/stop\0"
	db	"2:Set timer\0"
	db	"3:Set screen\0"
	db	"4:Set time out\0"

_enter	EQU	00h:0AC30h
_leave	EQU	00h:0AC38h
_clear_DDD4	EQU	00h:08C60h
_render_DDD4	EQU	00h:0947Ch
_line_print	EQU	00h:08F7Eh
_convert_keycode	EQU	02h:09892h
_hex_byte	EQU	02h:04010h
_solar_handle	EQU	01h:0FDAAh
_delay	EQU	00h:09F3Ah
_reset_magic_string	EQU	00h:09E90h
_reset_screen_sfr	EQU	00h:0A0DAh

_get_keycode_fixed	EQU	02h:0F5E8h
_menu_handle	EQU	03h:02042h
extract_str	EQU	03h:024B2h
