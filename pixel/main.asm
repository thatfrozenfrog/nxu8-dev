type(ML620906)
model	large
romwindow 0, 0cfffh

_clear_DDD4			EQU 0:8C60H
_line_print			EQU 0:8F7EH
_render_DDD4		EQU 0:947CH
_render_E3D4		EQU 0:9470H
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

_set_pixel	        EQU 0:091FCH

_waitkey 			EQU 2:4080H
__return			EQU 1:0EA6H
_lrstack			EQU 2:9416H
_$$SP	EQU	0F000h


;cseg	#0	at	0000h
cseg	#3	at	1440h


_entry:
	
	gjmp _main


_plot_line	:
	_sx$2	set	-2
	_sy$6	set	-6
	_e2$10	set	-4

	push	lr
	bl	_enter
	add	sp,	#-06
	mov	r10,	r2
	mov	r8,	r0
	mov	r11,	r3
	mov	r9,	r1

;;  int dx =  abs (x1 - x0), sx = x0 < x1 ? 1 : -1;
	mov	r0,	r2
	mov	r1,	#00h
	mov	r3,	#00h
	sub	r0,	r8
	subc	r1,	r3
	bl	_abs
	mov	er4,	er0	;; _ldx$0
	cmp	r8,	r10
	bge	_$L6
	mov	er0,	#1 
	bal	_$L8
_$L6 :
	mov	er0,	#-1
_$L8 :
	st	er0,	_sx$2[fp]

;;  int dy = -abs (y1 - y0), sy = y0 < y1 ? 1 : -1;
	mov	r0,	r11
	mov	r1,	#00h
	mov	r3,	#00h
	sub	r0,	r9
	subc	r1,	r3
	bl	_abs
	mov	er2,	er0
	mov	er0,	#0 
	sub	r0,	r2
	subc	r1,	r3
	mov	er6,	er0	;; _ldy$4
	cmp	r9,	r11
	bge	_$L9
	mov	er0,	#1 
	bal	_$L11
_$L9 :
	mov	er0,	#-1
_$L11 :
	st	er0,	_sy$6[fp]

;;  int err = dx + dy, e2;
	mov	er0,	er4
	add	er0,	er6
	mov	bp,	er0	;; _lerr$8

;;  for (;;){
_$L14 :

;;    set_pixel (x0,y0);
	mov	r1,	r9
	mov	r0,	r8
	mov r2, #0h
	mov r3, #0h
	bl	_set_pixel

;;    if (x0 == x1 && y0 == y1) break;
	cmp	r10,	r8
	bne	_$L18
	cmp	r11,	r9
	bne	_$L18

;;}
	b	_leave

;;    if (x0 == x1 && y0 == y1) break;
_$L18 :

;;    e2 = 2 * err;
	mov	er0,	bp
	add	er0,	bp
	st	er0,	_e2$10[fp]

;;    if (e2 >= dy) { err += dy; x0 += sx; }
	cmp	er0,	er6
	blts	_$L25
	add	bp,	er6
	l	r1,	_sx$2[fp]
	add	r8,	r1
_$L25 :

;;    if (e2 <= dx) { err += dx; y0 += sy; }
	l	er0,	_e2$10[fp]
	cmp	er0,	er4
	bgts	_$L14
	add	bp,	er4
	l	r1,	_sy$6[fp]
	add	r9,	r1

;;  }
	bal	_$L14
	
_abs	:
	push lr
	mov	er2,	er0
	mov	er0,	er0
	bps	_absneg
	mov	er0,	#0 
	sub	r0,	r2
	subc	r1,	r3
_absrt:
	pop pc
_absneg:
	mov	er0,	er2
	bal	_absrt
	
_ssmain	:

;;{
;;*****************************************
;;	register/stack information
;;*****************************************
;;*****************************************


;;    plot_line(0x05,0x01,0xC0,0xC1);
	mov	r3,	#0c1h
	mov	r2,	#0c0h
	mov	r1,	#01h
	mov	r0,	#05h
	l er0, 0D900h
	l er2, 0D910h
	bl	_plot_line
	
	bl _render_DDD4
	gjmp _main
	
_drawLoop:

	push	lr
	bl	_enter
	mov	er8,	er0

;;    word line = l << 8 | 0x00;

	mov	bp,	er2	;; _lline$2

;;    for(i = 0; i < line * 4; i += 4)
	mov	er6,	#0 	;; _li$0
	bal	_$Loop7
_$Loop4 :

;;        blank(a,b,c,d);
	mov	er0,	er8
	add	er0,	er6
	l	r3,	03h[er0]
	l	r2,	02h[er0]
	l	r1,	01h[er0]
	mov	er4,	er8
	add	er4,	er6
	l	r0,	[er4]
	bl	_plot_line
	bl _render_DDD4
;;    for(i = 0; i < line * 4; i += 4)
	add	er6,	#4 
_$Loop7 :
	mov	er0,	bp
	sllc	r1,	#02h
	sll	r0,	#02h

	cmp	er6,	er0
	blt	_$Loop4

;;}
	b	_leave

_main:
	mov	r2,	#00h
	mov r3, #47h
	mov	r0,	#00h
	mov	r1,	#0e7h
	;gjmp _drawLoop
	bl _render_DDD4
	
_loop:
	bl _get_keycode
	gjmp _loop
