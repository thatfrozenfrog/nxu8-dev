;; Compile Options : 
;; Version Number  : Ver.1.30.0
;; File Name       : main.c

	.ident "TYPE:"
	.ident "CODE:large"
	.ident "DATA:far"
	.file  "main.c"

	.text
	.globl	CheckButtons
	.type	CheckButtons,@function
	.p2align	2
CheckButtons :
	push	lr
	bl	__regpushu8lw
	mov	r0, #70
	mov	r1, #-16
	mov	r2, #0
	mov	r4, #-128
	st	r4, r2:[er0]
	mov	r0, #64
	mov	r1, #-16
	mov	r2, #0
	l	r1, r2:[er0]
	mov	r2, r1
	xor	r3, r3
	mov	r0, 0x00
	cmp	r1, 0x00
	blts	.LBB0_1
	b	.LBB0_64

.LBB0_1:
	mov	r0, #64
	mov	r1, #0
	mov	er4, er2
	and	r4, r0
	and	r5, r1
	mov	r0, 0x01
	mov	er6, #0
	cmp	er4, er6
	bne	.LBB0_2
	b	.LBB0_64

.LBB0_2:
	mov	er0, #32
	mov	er4, er2
	and	r4, r0
	and	r5, r1
	mov	r0, 0x02
	mov	er6, #0
	cmp	er4, er6
	bne	.LBB0_3
	b	.LBB0_64

.LBB0_3:
	mov	er0, #16
	mov	er4, er2
	and	r4, r0
	and	r5, r1
	mov	r0, 0x03
	mov	er6, #0
	cmp	er4, er6
	bne	.LBB0_4
	b	.LBB0_64

.LBB0_4:
	mov	er0, #8
	mov	er4, er2
	and	r4, r0
	and	r5, r1
	mov	r0, 0x04
	mov	er6, #0
	cmp	er4, er6
	bne	.LBB0_5
	b	.LBB0_64

.LBB0_5:
	mov	er0, #4
	mov	er4, er2
	and	r4, r0
	and	r5, r1
	mov	r0, 0x05
	mov	er6, #0
	cmp	er4, er6
	bne	.LBB0_6
	b	.LBB0_64

.LBB0_6:
	mov	er0, #2
	mov	er4, er2
	and	r4, r0
	and	r5, r1
	mov	r0, 0x06
	mov	er6, #0
	cmp	er4, er6
	bne	.LBB0_7
	b	.LBB0_64

.LBB0_7:
	mov	er0, #1
	and	r2, r0
	and	r3, r1
	mov	r0, 0x07
	mov	er4, #0
	cmp	er2, er4
	bne	.LBB0_8
	b	.LBB0_64

.LBB0_8:
	mov	r0, #70
	mov	r1, #-16
	mov	r2, #0
	mov	r4, 0x040
	st	r4, r2:[er0]
	mov	r0, #64
	mov	r1, #-16
	mov	r2, #0
	l	r1, r2:[er0]
	mov	r2, r1
	xor	r3, r3
	mov	r0, 0x08
	cmp	r1, #-1
	bles	.LBB0_9
	b	.LBB0_64

.LBB0_9:
	mov	r0, #64
	mov	r1, #0
	mov	er4, er2
	and	r4, r0
	and	r5, r1
	mov	r0, 0x09
	mov	er6, #0
	cmp	er4, er6
	bne	.LBB0_10
	b	.LBB0_64

.LBB0_10:
	mov	er0, #32
	mov	er4, er2
	and	r4, r0
	and	r5, r1
	mov	r0, 0x0A
	mov	er6, #0
	cmp	er4, er6
	bne	.LBB0_11
	b	.LBB0_64

.LBB0_11:
	mov	er0, #16
	mov	er4, er2
	and	r4, r0
	and	r5, r1
	mov	r0, 0x0B
	mov	er6, #0
	cmp	er4, er6
	bne	.LBB0_12
	b	.LBB0_64

.LBB0_12:
	mov	er0, #8
	mov	er4, er2
	and	r4, r0
	and	r5, r1
	mov	r0, 0x0C
	mov	er6, #0
	cmp	er4, er6
	bne	.LBB0_13
	b	.LBB0_64

.LBB0_13:
	mov	er0, #4
	mov	er4, er2
	and	r4, r0
	and	r5, r1
	mov	r0, 0x0D
	mov	er6, #0
	cmp	er4, er6
	bne	.LBB0_14
	b	.LBB0_64

.LBB0_14:
	mov	er0, #2
	mov	er4, er2
	and	r4, r0
	and	r5, r1
	mov	r0, 0x0E
	mov	er6, #0
	cmp	er4, er6
	bne	.LBB0_15
	b	.LBB0_64

.LBB0_15:
	mov	er0, #1
	and	r2, r0
	and	r3, r1
	mov	r0, 0x0F
	mov	er4, #0
	cmp	er2, er4
	bne	.LBB0_16
	b	.LBB0_64

.LBB0_16:
	mov	r0, #70
	mov	r1, #-16
	mov	r2, #0
	mov	r4, 0x020
	st	r4, r2:[er0]
	mov	r0, #64
	mov	r1, #-16
	mov	r2, #0
	l	r1, r2:[er0]
	mov	r2, r1
	xor	r3, r3
	mov	r0, 0x010
	cmp	r1, #-1
	bles	.LBB0_17
	b	.LBB0_64

.LBB0_17:
	mov	r0, #64
	mov	r1, #0
	mov	er4, er2
	and	r4, r0
	and	r5, r1
	mov	r0, 0x011
	mov	er6, #0
	cmp	er4, er6
	bne	.LBB0_18
	b	.LBB0_64

.LBB0_18:
	mov	er0, #32
	mov	er4, er2
	and	r4, r0
	and	r5, r1
	mov	r0, 0x012
	mov	er6, #0
	cmp	er4, er6
	bne	.LBB0_19
	b	.LBB0_64

.LBB0_19:
	mov	er0, #16
	mov	er4, er2
	and	r4, r0
	and	r5, r1
	mov	r0, 0x013
	mov	er6, #0
	cmp	er4, er6
	bne	.LBB0_20
	b	.LBB0_64

.LBB0_20:
	mov	er0, #8
	mov	er4, er2
	and	r4, r0
	and	r5, r1
	mov	r0, 0x014
	mov	er6, #0
	cmp	er4, er6
	bne	.LBB0_21
	b	.LBB0_64

.LBB0_21:
	mov	er0, #4
	mov	er4, er2
	and	r4, r0
	and	r5, r1
	mov	r0, 0x015
	mov	er6, #0
	cmp	er4, er6
	bne	.LBB0_22
	b	.LBB0_64

.LBB0_22:
	mov	er0, #2
	mov	er4, er2
	and	r4, r0
	and	r5, r1
	mov	r0, 0x016
	mov	er6, #0
	cmp	er4, er6
	bne	.LBB0_23
	b	.LBB0_64

.LBB0_23:
	mov	er0, #1
	and	r2, r0
	and	r3, r1
	mov	r0, 0x017
	mov	er4, #0
	cmp	er2, er4
	bne	.LBB0_24
	b	.LBB0_64

.LBB0_24:
	mov	r0, #70
	mov	r1, #-16
	mov	r2, #0
	mov	r4, 0x010
	st	r4, r2:[er0]
	mov	r0, #64
	mov	r1, #-16
	mov	r2, #0
	l	r1, r2:[er0]
	mov	r2, r1
	xor	r3, r3
	mov	r0, 0x018
	cmp	r1, #-1
	bles	.LBB0_25
	b	.LBB0_64

.LBB0_25:
	mov	r0, #64
	mov	r1, #0
	mov	er4, er2
	and	r4, r0
	and	r5, r1
	mov	r0, 0x019
	mov	er6, #0
	cmp	er4, er6
	bne	.LBB0_26
	b	.LBB0_64

.LBB0_26:
	mov	er0, #32
	mov	er4, er2
	and	r4, r0
	and	r5, r1
	mov	r0, 0x01A
	mov	er6, #0
	cmp	er4, er6
	bne	.LBB0_27
	b	.LBB0_64

.LBB0_27:
	mov	er0, #16
	mov	er4, er2
	and	r4, r0
	and	r5, r1
	mov	r0, 0x01B
	mov	er6, #0
	cmp	er4, er6
	bne	.LBB0_28
	b	.LBB0_64

.LBB0_28:
	mov	er0, #8
	mov	er4, er2
	and	r4, r0
	and	r5, r1
	mov	r0, 0x01C
	mov	er6, #0
	cmp	er4, er6
	bne	.LBB0_29
	b	.LBB0_64

.LBB0_29:
	mov	er0, #4
	mov	er4, er2
	and	r4, r0
	and	r5, r1
	mov	r0, 0x01D
	mov	er6, #0
	cmp	er4, er6
	bne	.LBB0_30
	b	.LBB0_64

.LBB0_30:
	mov	er0, #2
	mov	er4, er2
	and	r4, r0
	and	r5, r1
	mov	r0, 0x01E
	mov	er6, #0
	cmp	er4, er6
	bne	.LBB0_31
	b	.LBB0_64

.LBB0_31:
	mov	er0, #1
	and	r2, r0
	and	r3, r1
	mov	r0, 0x01F
	mov	er4, #0
	cmp	er2, er4
	bne	.LBB0_32
	b	.LBB0_64

.LBB0_32:
	mov	r0, #70
	mov	r1, #-16
	mov	r2, #0
	mov	r4, 0x08
	st	r4, r2:[er0]
	mov	r0, #64
	mov	r1, #-16
	mov	r2, #0
	l	r1, r2:[er0]
	mov	r2, r1
	xor	r3, r3
	mov	r0, 0x020
	cmp	r1, #-1
	bles	.LBB0_33
	b	.LBB0_64

.LBB0_33:
	mov	r0, #64
	mov	r1, #0
	mov	er4, er2
	and	r4, r0
	and	r5, r1
	mov	r0, 0x021
	mov	er6, #0
	cmp	er4, er6
	bne	.LBB0_34
	b	.LBB0_64

.LBB0_34:
	mov	er0, #32
	mov	er4, er2
	and	r4, r0
	and	r5, r1
	mov	r0, 0x022
	mov	er6, #0
	cmp	er4, er6
	bne	.LBB0_35
	b	.LBB0_64

.LBB0_35:
	mov	er0, #16
	mov	er4, er2
	and	r4, r0
	and	r5, r1
	mov	r0, 0x023
	mov	er6, #0
	cmp	er4, er6
	bne	.LBB0_36
	b	.LBB0_64

.LBB0_36:
	mov	er0, #8
	mov	er4, er2
	and	r4, r0
	and	r5, r1
	mov	r0, 0x024
	mov	er6, #0
	cmp	er4, er6
	bne	.LBB0_37
	b	.LBB0_64

.LBB0_37:
	mov	er0, #4
	mov	er4, er2
	and	r4, r0
	and	r5, r1
	mov	r0, 0x025
	mov	er6, #0
	cmp	er4, er6
	bne	.LBB0_38
	b	.LBB0_64

.LBB0_38:
	mov	er0, #2
	mov	er4, er2
	and	r4, r0
	and	r5, r1
	mov	r0, 0x026
	mov	er6, #0
	cmp	er4, er6
	bne	.LBB0_39
	b	.LBB0_64

.LBB0_39:
	mov	er0, #1
	and	r2, r0
	and	r3, r1
	mov	r0, 0x027
	mov	er4, #0
	cmp	er2, er4
	bne	.LBB0_40
	b	.LBB0_64

.LBB0_40:
	mov	r0, #70
	mov	r1, #-16
	mov	r2, #0
	mov	r4, 0x04
	st	r4, r2:[er0]
	mov	r0, #64
	mov	r1, #-16
	mov	r2, #0
	l	r1, r2:[er0]
	mov	r2, r1
	xor	r3, r3
	mov	r0, 0x028
	cmp	r1, #-1
	bles	.LBB0_41
	b	.LBB0_64

.LBB0_41:
	mov	r0, #64
	mov	r1, #0
	mov	er4, er2
	and	r4, r0
	and	r5, r1
	mov	r0, 0x029
	mov	er6, #0
	cmp	er4, er6
	bne	.LBB0_42
	b	.LBB0_64

.LBB0_42:
	mov	er0, #32
	mov	er4, er2
	and	r4, r0
	and	r5, r1
	mov	r0, 0x02A
	mov	er6, #0
	cmp	er4, er6
	bne	.LBB0_43
	b	.LBB0_64

.LBB0_43:
	mov	er0, #16
	mov	er4, er2
	and	r4, r0
	and	r5, r1
	mov	r0, 0x02B
	mov	er6, #0
	cmp	er4, er6
	bne	.LBB0_44
	b	.LBB0_64

.LBB0_44:
	mov	er0, #8
	mov	er4, er2
	and	r4, r0
	and	r5, r1
	mov	r0, 0x02C
	mov	er6, #0
	cmp	er4, er6
	bne	.LBB0_45
	b	.LBB0_64

.LBB0_45:
	mov	er0, #4
	mov	er4, er2
	and	r4, r0
	and	r5, r1
	mov	r0, 0x02D
	mov	er6, #0
	cmp	er4, er6
	bne	.LBB0_46
	b	.LBB0_64

.LBB0_46:
	mov	er0, #2
	mov	er4, er2
	and	r4, r0
	and	r5, r1
	mov	r0, 0x02E
	mov	er6, #0
	cmp	er4, er6
	bne	.LBB0_47
	b	.LBB0_64

.LBB0_47:
	mov	er0, #1
	and	r2, r0
	and	r3, r1
	mov	r0, 0x02F
	mov	er4, #0
	cmp	er2, er4
	bne	.LBB0_48
	b	.LBB0_64

.LBB0_48:
	mov	r0, #70
	mov	r1, #-16
	mov	r2, #0
	mov	r4, 0x02
	st	r4, r2:[er0]
	mov	r0, #64
	mov	r1, #-16
	mov	r2, #0
	l	r1, r2:[er0]
	mov	r2, r1
	xor	r3, r3
	mov	r0, 0x030
	cmp	r1, #-1
	bles	.LBB0_49
	b	.LBB0_64

.LBB0_49:
	mov	r0, #64
	mov	r1, #0
	mov	er4, er2
	and	r4, r0
	and	r5, r1
	mov	r0, 0x031
	mov	er6, #0
	cmp	er4, er6
	bne	.LBB0_50
	b	.LBB0_64

.LBB0_50:
	mov	er0, #32
	mov	er4, er2
	and	r4, r0
	and	r5, r1
	mov	r0, 0x032
	mov	er6, #0
	cmp	er4, er6
	bne	.LBB0_51
	b	.LBB0_64

.LBB0_51:
	mov	er0, #16
	mov	er4, er2
	and	r4, r0
	and	r5, r1
	mov	r0, 0x033
	mov	er6, #0
	cmp	er4, er6
	bne	.LBB0_52
	b	.LBB0_64

.LBB0_52:
	mov	er0, #8
	mov	er4, er2
	and	r4, r0
	and	r5, r1
	mov	r0, 0x034
	mov	er6, #0
	cmp	er4, er6
	bne	.LBB0_53
	b	.LBB0_64

.LBB0_53:
	mov	er0, #4
	mov	er4, er2
	and	r4, r0
	and	r5, r1
	mov	r0, 0x035
	mov	er6, #0
	cmp	er4, er6
	bne	.LBB0_54
	b	.LBB0_64

.LBB0_54:
	mov	er0, #2
	mov	er4, er2
	and	r4, r0
	and	r5, r1
	mov	r0, 0x036
	mov	er6, #0
	cmp	er4, er6
	bne	.LBB0_55
	b	.LBB0_64

.LBB0_55:
	mov	er0, #1
	and	r2, r0
	and	r3, r1
	mov	r0, 0x037
	mov	er4, #0
	cmp	er2, er4
	bne	.LBB0_56
	b	.LBB0_64

.LBB0_56:
	mov	r0, #70
	mov	r1, #-16
	mov	r2, #0
	mov	r4, 0x01
	st	r4, r2:[er0]
	mov	r0, #64
	mov	r1, #-16
	mov	r2, #0
	l	r1, r2:[er0]
	mov	r2, r1
	xor	r3, r3
	mov	r0, 0x038
	cmp	r1, #-1
	bles	.LBB0_57
	b	.LBB0_64

.LBB0_57:
	mov	r0, #64
	mov	r1, #0
	mov	er4, er2
	and	r4, r0
	and	r5, r1
	mov	r0, 0x039
	mov	er6, #0
	cmp	er4, er6
	bne	.LBB0_58
	b	.LBB0_64

.LBB0_58:
	mov	er0, #32
	mov	er4, er2
	and	r4, r0
	and	r5, r1
	mov	r0, 0x03A
	mov	er6, #0
	cmp	er4, er6
	beq	.LBB0_64
	b	.LBB0_59

.LBB0_59:
	mov	er0, #16
	mov	er4, er2
	and	r4, r0
	and	r5, r1
	mov	r0, 0x03B
	mov	er6, #0
	cmp	er4, er6
	beq	.LBB0_64
	b	.LBB0_60

.LBB0_60:
	mov	er0, #8
	mov	er4, er2
	and	r4, r0
	and	r5, r1
	mov	r0, 0x03C
	mov	er6, #0
	cmp	er4, er6
	beq	.LBB0_64
	b	.LBB0_61

.LBB0_61:
	mov	er0, #4
	mov	er4, er2
	and	r4, r0
	and	r5, r1
	mov	r0, 0x03D
	mov	er6, #0
	cmp	er4, er6
	beq	.LBB0_64
	b	.LBB0_62

.LBB0_62:
	mov	er0, #2
	mov	er4, er2
	and	r4, r0
	and	r5, r1
	mov	r0, 0x03E
	mov	er6, #0
	cmp	er4, er6
	beq	.LBB0_64
	b	.LBB0_63

.LBB0_63:
	mov	er0, #1
	mov	er4, er2
	and	r4, r0
	and	r5, r1
	mov	r2, #-1
	mov	r1, 0x050
	mov	r0, 0x03F
	mov	er6, #0
	cmp	er4, er6
	beq	.LBB0_64
	b	.LBB0_65

.LBB0_64:
	mov	r3, r0
	mov	r0, #-1
	l	r4, FAR lastbutton
	mov	r1, r3
	mov	r2, r3
	cmp	r3, r4
	beq	.LBB0_66
	b	.LBB0_65

.LBB0_65:
	st	r1, FAR lastbutton
	mov	r0, r2

.LBB0_66:
	xor	r1, r1
	mov	er2, #0
	b	__regpopu8lw
	rt

.Lfunc_end0:
	.size	CheckButtons, .Lfunc_end0-CheckButtons

	.globl	drawbitmap
	.type	drawbitmap,@function
	.p2align	2
drawbitmap :
	push	lr
	bl	__regpushu8lw
	add	sp, #-22
	st	er0, -8[fp]
	st	er2, -6[fp]
	mov	r4, #55
	mov	r5, #-16
	mov	r6, #0
	mov	r8, 0x00
	st	r8, r6:[er4]
	mov	er6, #0
	l	r5, 20[fp]
	l	r4, 18[fp]
	l	r10, 0x010[fp]
	l	r11, 0x011[fp]
	mov	er8, er6
	cmp	er10, er6
	beq	.LBB1_5
	b	.LBB1_1

.LBB1_1:
	mov	bp, #0
	mov	er6, #31
	b	.LBB1_3

.LBB1_2:
	mov	r0, #-1
	mov	r1, #-1
	mov	er2, er8
	add	er2, er0
	mov	er0, #0
	mov	er8, bp
	mov	er10, er2
	cmp	er2, er0
	beq	.LBB1_5
	b	.LBB1_3

.LBB1_3:
	mov	er8, er10
	mov	er10, bp
	add	er10, 0x01
	mov	er0, er10
	and	r0, r6
	and	r1, r7
	add	bp, 0x09
	mov	er2, #24
	cmp	er0, er2
	beq	.LBB1_2
	b	.LBB1_4

.LBB1_4:
	mov	bp, er10
	b	.LBB1_2

.LBB1_5:
	mov	r0, r5
	xor	r1, r1
	st	er0, -14[fp]
	cmp	r5, 0x00
	bne	.LBB1_6
	b	.LBB1_15

.LBB1_6:
	mov	r0, r4
	xor	r1, r1
	mov	er10, #32
	st	er0, -2[fp]
	sub	r10, r0
	subc	r11, r1
	st	er10, -16[fp]
	cmp	r4, 0x00
	bne	.LBB1_7
	b	.LBB1_15

.LBB1_7:
	mov	er10, #0
	mov	er4, er10
	st	er10, -18[fp]
	b	.LBB1_9

.LBB1_8:
	l	er0, -10[fp]
	add	er0, 0x01
	l	er4, -12[fp]
	mov	er10, er0
	l	er2, -14[fp]
	cmp	er0, er2
	bne	.LBB1_9
	b	.LBB1_15

.LBB1_9:
	st	er10, -10[fp]
	st	er4, -4[fp]
	mov	er2, er4
	l	er0, -2[fp]
	add	er2, er0
	st	er2, -12[fp]
	l	er10, -18[fp]
	mov	bp, er8
	b	.LBB1_11

.LBB1_10:
	mov	er0, er10
	add	er0, 0x01
	mov	er10, er0
	mov	bp, er8
	l	er2, -2[fp]
	cmp	er2, er0
	bne	.LBB1_11
	b	.LBB1_13

.LBB1_11:
	mov	er8, bp
	l	bp, -4[fp]
	add	bp, er10
	mov	er4, bp
	mov	r6, 0x00
	l	er0, -8[fp]
	l	er2, -6[fp]
	add	er0, er4
	l	r0, r2:[er0]
	mov	r2, #0
	mov	r3, #-8
	mov	er4, er8
	add	er4, er2
	mov	er4, er4
	mov	r6, 0x00
	st	r0, r6:[er4]
	mov	bp, er8
	add	bp, 0x01
	mov	er0, #31
	mov	er2, bp
	and	r2, r0
	and	r3, r1
	add	er8, 0x09
	mov	er0, #24
	cmp	er2, er0
	beq	.LBB1_10
	b	.LBB1_12

.LBB1_12:
	mov	er8, bp
	b	.LBB1_10

.LBB1_13:
	mov	er4, er8
	l	er0, -16[fp]
	add	er4, er0
	mov	er0, #31
	mov	er2, er4
	and	r2, r0
	and	r3, r1
	mov	er8, er4
	add	er8, 0x08
	mov	er0, #24
	cmp	er2, er0
	bne	.LBB1_14
	b	.LBB1_8

.LBB1_14:
	mov	er8, er4
	b	.LBB1_8

.LBB1_15:
	b	__regpopu8lw
	rt

.Lfunc_end1:
	.size	drawbitmap, .Lfunc_end1-drawbitmap

	.globl	print
	.type	print,@function
	.p2align	2
print :
	push	lr
	bl	__regpushu8lw
	add	sp, #-20
	l	r4, r2:[er0]
	mov	er10, #0
	l	r5, 18[fp]
	l	r6, 16[fp]
	cmp	r4, 0x00
	bne	.LBB2_1
	b	.LBB2_68

.LBB2_1:
	xor	r7, r7
	mov	r8, r5
	xor	r9, r9
	mov	er10, er8
	mov	r11, r10
	mov	r10, 0x00
	or	r10, r6
	or	r11, r7
	sllc	r9, 0x07
	sll	r8, 0x07
	add	er10, er8
	mov	er6, #0
	mov	r5, 0x00
	st	r5, -17[fp]
	mov	er8, er10
	b	.LBB2_3

.LBB2_2:
	l	er2, -6[fp]
	add	er0, er2
	mov	er0, er0
	mov	r2, 0x00
	l	er4, -4[fp]
	l	r6, -2[fp]
	l	r4, r6:15[er4]
	st	r4, r2:[er0]
	mov	er4, #1
	mov	r6, #0
	l	er0, -14[fp]
	l	r2, -12[fp]
	l	r12, r2:1[er0]
	add	er0, er4
	l	er10, -10[fp]
	add	er10, 0x01
	l	er8, -8[fp]
	add	er8, 0x01
	mov	r4, r12
	mov	er6, er10
	cmp	r12, 0x00
	bne	.LBB2_3
	b	.LBB2_68

.LBB2_3:
	st	er0, -14[fp]
	st	r2, -12[fp]
	mov	er10, er8
	st	er6, -10[fp]
	mov	r0, #55
	mov	r1, #-16
	mov	r2, #0
	l	r5, -17[fp]
	st	r5, r2:[er0]
	mov	r0, r4
	xor	r1, r1
	xor	r2, r2
	sllc	r2, 0x04
	sllc	r1, 0x04
	sll	r0, 0x04
	mov	r4, #BYTE1 OFFSET image_raw
	mov	r5, #BYTE2 OFFSET image_raw
	mov	r6, #SEG image_raw
	add	er4, er0
	st	er4, -4[fp]
	st	r6, -2[fp]
	mov	er0, #0
	mov	bp, er0
	cmp	er10, er0
	beq	.LBB2_8
	b	.LBB2_4

.LBB2_4:
	mov	er0, #0
	mov	er8, er0
	b	.LBB2_6

.LBB2_5:
	mov	er8, er0
	mov	er4, er2
	add	er4, 0x01
	mov	bp, er8
	mov	er0, er4
	cmp	er10, er4
	beq	.LBB2_8
	b	.LBB2_6

.LBB2_6:
	mov	er2, er0
	mov	er0, er8
	mov	er8, er0
	add	er8, 0x01
	mov	er4, #31
	mov	er6, er8
	and	r6, r4
	and	r7, r5
	add	er0, 0x09
	mov	er4, #24
	cmp	er6, er4
	beq	.LBB2_5
	b	.LBB2_7

.LBB2_7:
	mov	er0, er8
	b	.LBB2_5

.LBB2_8:
	st	er10, -8[fp]
	mov	r0, #0
	mov	r1, #-8
	mov	er2, bp
	mov	er4, er0
	add	er2, er0
	mov	er8, er2
	mov	r10, 0x00
	l	er0, -4[fp]
	l	r2, -2[fp]
	l	r2, r2:[er0]
	st	r2, r10:[er8]
	mov	er0, bp
	add	er0, 0x01
	mov	er2, #31
	mov	er10, er0
	and	r10, r2
	and	r11, r3
	add	bp, 0x09
	mov	er8, #24
	cmp	er10, er8
	beq	.LBB2_10
	b	.LBB2_9

.LBB2_9:
	mov	bp, er0

.LBB2_10:
	mov	er0, bp
	mov	bp, er0
	add	bp, 0x01F
	mov	er10, bp
	and	r10, r2
	and	r11, r3
	add	er0, 0x027
	st	er8, -16[fp]
	cmp	er10, er8
	beq	.LBB2_12
	b	.LBB2_11

.LBB2_11:
	mov	er0, bp

.LBB2_12:
	mov	er10, er0
	st	er4, -6[fp]
	add	er10, er4
	mov	er8, er10
	mov	r10, 0x00
	l	er4, -4[fp]
	l	r6, -2[fp]
	l	r6, r6:1[er4]
	st	r6, r10:[er8]
	mov	er10, er0
	add	er10, 0x01
	mov	er6, er10
	and	r6, r2
	and	r7, r3
	add	er0, 0x09
	l	bp, -16[fp]
	cmp	er6, bp
	beq	.LBB2_14
	b	.LBB2_13

.LBB2_13:
	mov	er0, er10

.LBB2_14:
	mov	er10, er0
	add	er10, 0x01F
	mov	er6, er10
	and	r6, r2
	and	r7, r3
	add	er0, 0x027
	cmp	er6, bp
	beq	.LBB2_16
	b	.LBB2_15

.LBB2_15:
	mov	er0, er10

.LBB2_16:
	mov	er6, er0
	l	er4, -6[fp]
	add	er6, er4
	mov	er8, er6
	mov	r10, 0x00
	l	er4, -4[fp]
	l	r6, -2[fp]
	l	r6, r6:2[er4]
	st	r6, r10:[er8]
	mov	er10, er0
	add	er10, 0x01
	mov	er6, er10
	and	r6, r2
	and	r7, r3
	add	er0, 0x09
	cmp	er6, bp
	beq	.LBB2_18
	b	.LBB2_17

.LBB2_17:
	mov	er0, er10

.LBB2_18:
	mov	er10, er0
	add	er10, 0x01F
	mov	er6, er10
	and	r6, r2
	and	r7, r3
	add	er0, 0x027
	cmp	er6, bp
	beq	.LBB2_20
	b	.LBB2_19

.LBB2_19:
	mov	er0, er10

.LBB2_20:
	mov	er6, er0
	l	er4, -6[fp]
	add	er6, er4
	mov	er8, er6
	mov	r10, 0x00
	l	er4, -4[fp]
	l	r6, -2[fp]
	l	r6, r6:3[er4]
	st	r6, r10:[er8]
	mov	er10, er0
	add	er10, 0x01
	mov	er6, er10
	and	r6, r2
	and	r7, r3
	add	er0, 0x09
	cmp	er6, bp
	beq	.LBB2_22
	b	.LBB2_21

.LBB2_21:
	mov	er0, er10

.LBB2_22:
	mov	er10, er0
	add	er10, 0x01F
	mov	er6, er10
	and	r6, r2
	and	r7, r3
	add	er0, 0x027
	cmp	er6, bp
	beq	.LBB2_24
	b	.LBB2_23

.LBB2_23:
	mov	er0, er10

.LBB2_24:
	mov	er6, er0
	l	er4, -6[fp]
	add	er6, er4
	mov	er8, er6
	mov	r10, 0x00
	l	er4, -4[fp]
	l	r6, -2[fp]
	l	r6, r6:4[er4]
	st	r6, r10:[er8]
	mov	er10, er0
	add	er10, 0x01
	mov	er6, er10
	and	r6, r2
	and	r7, r3
	add	er0, 0x09
	cmp	er6, bp
	beq	.LBB2_26
	b	.LBB2_25

.LBB2_25:
	mov	er0, er10

.LBB2_26:
	mov	er10, er0
	add	er10, 0x01F
	mov	er6, er10
	and	r6, r2
	and	r7, r3
	add	er0, 0x027
	cmp	er6, bp
	beq	.LBB2_28
	b	.LBB2_27

.LBB2_27:
	mov	er0, er10

.LBB2_28:
	mov	er6, er0
	l	er4, -6[fp]
	add	er6, er4
	mov	er8, er6
	mov	r10, 0x00
	l	er4, -4[fp]
	l	r6, -2[fp]
	l	r6, r6:5[er4]
	st	r6, r10:[er8]
	mov	er10, er0
	add	er10, 0x01
	mov	er6, er10
	and	r6, r2
	and	r7, r3
	add	er0, 0x09
	cmp	er6, bp
	beq	.LBB2_30
	b	.LBB2_29

.LBB2_29:
	mov	er0, er10

.LBB2_30:
	mov	er10, er0
	add	er10, 0x01F
	mov	er6, er10
	and	r6, r2
	and	r7, r3
	add	er0, 0x027
	cmp	er6, bp
	beq	.LBB2_32
	b	.LBB2_31

.LBB2_31:
	mov	er0, er10

.LBB2_32:
	mov	er6, er0
	l	er4, -6[fp]
	add	er6, er4
	mov	er8, er6
	mov	r10, 0x00
	l	er4, -4[fp]
	l	r6, -2[fp]
	l	r6, r6:6[er4]
	st	r6, r10:[er8]
	mov	er10, er0
	add	er10, 0x01
	mov	er6, er10
	and	r6, r2
	and	r7, r3
	add	er0, 0x09
	cmp	er6, bp
	beq	.LBB2_34
	b	.LBB2_33

.LBB2_33:
	mov	er0, er10

.LBB2_34:
	mov	er10, er0
	add	er10, 0x01F
	mov	er6, er10
	and	r6, r2
	and	r7, r3
	add	er0, 0x027
	cmp	er6, bp
	beq	.LBB2_36
	b	.LBB2_35

.LBB2_35:
	mov	er0, er10

.LBB2_36:
	mov	er6, er0
	l	er4, -6[fp]
	add	er6, er4
	mov	er8, er6
	mov	r10, 0x00
	l	er4, -4[fp]
	l	r6, -2[fp]
	l	r6, r6:7[er4]
	st	r6, r10:[er8]
	mov	er10, er0
	add	er10, 0x01
	mov	er6, er10
	and	r6, r2
	and	r7, r3
	add	er0, 0x09
	cmp	er6, bp
	beq	.LBB2_38
	b	.LBB2_37

.LBB2_37:
	mov	er0, er10

.LBB2_38:
	mov	er10, er0
	add	er10, 0x01F
	mov	er6, er10
	and	r6, r2
	and	r7, r3
	add	er0, 0x027
	cmp	er6, bp
	beq	.LBB2_40
	b	.LBB2_39

.LBB2_39:
	mov	er0, er10

.LBB2_40:
	mov	er6, er0
	l	er4, -6[fp]
	add	er6, er4
	mov	er8, er6
	mov	r10, 0x00
	l	er4, -4[fp]
	l	r6, -2[fp]
	l	r6, r6:8[er4]
	st	r6, r10:[er8]
	mov	er10, er0
	add	er10, 0x01
	mov	er6, er10
	and	r6, r2
	and	r7, r3
	add	er0, 0x09
	cmp	er6, bp
	beq	.LBB2_42
	b	.LBB2_41

.LBB2_41:
	mov	er0, er10

.LBB2_42:
	mov	er10, er0
	add	er10, 0x01F
	mov	er6, er10
	and	r6, r2
	and	r7, r3
	add	er0, 0x027
	cmp	er6, bp
	beq	.LBB2_44
	b	.LBB2_43

.LBB2_43:
	mov	er0, er10

.LBB2_44:
	mov	er6, er0
	l	er4, -6[fp]
	add	er6, er4
	mov	er8, er6
	mov	r10, 0x00
	l	er4, -4[fp]
	l	r6, -2[fp]
	l	r6, r6:9[er4]
	st	r6, r10:[er8]
	mov	er10, er0
	add	er10, 0x01
	mov	er6, er10
	and	r6, r2
	and	r7, r3
	add	er0, 0x09
	cmp	er6, bp
	beq	.LBB2_46
	b	.LBB2_45

.LBB2_45:
	mov	er0, er10

.LBB2_46:
	mov	er10, er0
	add	er10, 0x01F
	mov	er6, er10
	and	r6, r2
	and	r7, r3
	add	er0, 0x027
	cmp	er6, bp
	beq	.LBB2_48
	b	.LBB2_47

.LBB2_47:
	mov	er0, er10

.LBB2_48:
	mov	er6, er0
	l	er4, -6[fp]
	add	er6, er4
	mov	er8, er6
	mov	r10, 0x00
	l	er4, -4[fp]
	l	r6, -2[fp]
	l	r6, r6:10[er4]
	st	r6, r10:[er8]
	mov	er10, er0
	add	er10, 0x01
	mov	er6, er10
	and	r6, r2
	and	r7, r3
	add	er0, 0x09
	cmp	er6, bp
	beq	.LBB2_50
	b	.LBB2_49

.LBB2_49:
	mov	er0, er10

.LBB2_50:
	mov	er10, er0
	add	er10, 0x01F
	mov	er6, er10
	and	r6, r2
	and	r7, r3
	add	er0, 0x027
	cmp	er6, bp
	beq	.LBB2_52
	b	.LBB2_51

.LBB2_51:
	mov	er0, er10

.LBB2_52:
	mov	er6, er0
	l	er4, -6[fp]
	add	er6, er4
	mov	er8, er6
	mov	r10, 0x00
	l	er4, -4[fp]
	l	r6, -2[fp]
	l	r6, r6:11[er4]
	st	r6, r10:[er8]
	mov	er10, er0
	add	er10, 0x01
	mov	er6, er10
	and	r6, r2
	and	r7, r3
	add	er0, 0x09
	cmp	er6, bp
	beq	.LBB2_54
	b	.LBB2_53

.LBB2_53:
	mov	er0, er10

.LBB2_54:
	mov	er10, er0
	add	er10, 0x01F
	mov	er6, er10
	and	r6, r2
	and	r7, r3
	add	er0, 0x027
	cmp	er6, bp
	beq	.LBB2_56
	b	.LBB2_55

.LBB2_55:
	mov	er0, er10

.LBB2_56:
	mov	er6, er0
	l	er4, -6[fp]
	add	er6, er4
	mov	er8, er6
	mov	r10, 0x00
	l	er4, -4[fp]
	l	r6, -2[fp]
	l	r6, r6:12[er4]
	st	r6, r10:[er8]
	mov	er10, er0
	add	er10, 0x01
	mov	er6, er10
	and	r6, r2
	and	r7, r3
	add	er0, 0x09
	cmp	er6, bp
	beq	.LBB2_58
	b	.LBB2_57

.LBB2_57:
	mov	er0, er10

.LBB2_58:
	mov	er10, er0
	add	er10, 0x01F
	mov	er6, er10
	and	r6, r2
	and	r7, r3
	add	er0, 0x027
	cmp	er6, bp
	beq	.LBB2_60
	b	.LBB2_59

.LBB2_59:
	mov	er0, er10

.LBB2_60:
	mov	er6, er0
	l	er4, -6[fp]
	add	er6, er4
	mov	er8, er6
	mov	r10, 0x00
	l	er4, -4[fp]
	l	r6, -2[fp]
	l	r6, r6:13[er4]
	st	r6, r10:[er8]
	mov	er10, er0
	add	er10, 0x01
	mov	er6, er10
	and	r6, r2
	and	r7, r3
	add	er0, 0x09
	cmp	er6, bp
	beq	.LBB2_62
	b	.LBB2_61

.LBB2_61:
	mov	er0, er10

.LBB2_62:
	mov	er10, er0
	add	er10, 0x01F
	mov	er6, er10
	and	r6, r2
	and	r7, r3
	add	er0, 0x027
	cmp	er6, bp
	beq	.LBB2_64
	b	.LBB2_63

.LBB2_63:
	mov	er0, er10

.LBB2_64:
	mov	er6, er0
	l	er4, -6[fp]
	add	er6, er4
	mov	er8, er6
	mov	r10, 0x00
	l	er4, -4[fp]
	l	r6, -2[fp]
	l	r6, r6:14[er4]
	st	r6, r10:[er8]
	mov	er10, er0
	add	er10, 0x01
	mov	er6, er10
	and	r6, r2
	and	r7, r3
	add	er0, 0x09
	cmp	er6, bp
	beq	.LBB2_66
	b	.LBB2_65

.LBB2_65:
	mov	er0, er10

.LBB2_66:
	mov	er10, er0
	add	er10, 0x01F
	mov	er6, er10
	and	r6, r2
	and	r7, r3
	add	er0, 0x027
	cmp	er6, bp
	bne	.LBB2_67
	b	.LBB2_2

.LBB2_67:
	mov	er0, er10
	b	.LBB2_2

.LBB2_68:
	mov	er0, er10
	mov	er2, #0
	b	__regpopu8lw
	rt

.Lfunc_end2:
	.size	print, .Lfunc_end2-print

	.globl	PrintWord
	.type	PrintWord,@function
	.p2align	2
PrintWord :
	push	lr
	bl	__regpushu8lw
	add	sp, #-20
	mov	er4, #15
	mov	er8, er0
	and	r8, r4
	and	r9, r5
	mov	r7, r8
	mov	r6, r7
	or	r6, 0x030
	add	r7, 0x057
	mov	er10, #9
	cmp	er8, er10
	bgt	.LBB3_2
	b	.LBB3_1

.LBB3_1:
	mov	r7, r6

.LBB3_2:
	st	r7, FAR printdwordbuf+3
	mov	r8, #BYTE1 OFFSET printdwordbuf
	mov	r9, #BYTE2 OFFSET printdwordbuf
	add	r8, 0x03
	addc	r9, 0x00
	mov	r10, #SEG printdwordbuf
	mov	r6, r7
	cmp	er0, er4
	bgt	.LBB3_3
	b	.LBB3_9

.LBB3_3:
	mov	er4, er0
	srlc	r4, 0x04
	srl	r5, 0x04
	mov	er6, #15
	mov	er8, er4
	and	r8, r6
	and	r9, r7
	mov	r5, r8
	mov	r4, r5
	or	r4, 0x030
	add	r5, 0x057
	mov	er6, #9
	cmp	er8, er6
	bgt	.LBB3_5
	b	.LBB3_4

.LBB3_4:
	mov	r5, r4

.LBB3_5:
	mov	r6, r5
	st	r6, FAR printdwordbuf+2
	mov	r8, #BYTE1 OFFSET printdwordbuf
	mov	r9, #BYTE2 OFFSET printdwordbuf
	add	r8, 0x02
	addc	r9, 0x00
	mov	r10, #SEG printdwordbuf
	mov	r4, #0
	mov	r5, #1
	cmp	er0, er4
	blt	.LBB3_9
	b	.LBB3_6

.LBB3_6:
	mov	er4, er0
	mov	r4, r5
	mov	r5, 0x00
	mov	er6, #15
	mov	er8, er4
	and	r8, r6
	and	r9, r7
	mov	r5, r8
	mov	r4, r5
	or	r4, 0x030
	add	r5, 0x057
	mov	er6, #9
	cmp	er8, er6
	bgt	.LBB3_8
	b	.LBB3_7

.LBB3_7:
	mov	r5, r4

.LBB3_8:
	mov	r6, r5
	st	r6, FAR printdwordbuf+1
	mov	r8, #BYTE1 OFFSET printdwordbuf
	mov	r9, #BYTE2 OFFSET printdwordbuf
	add	r8, 0x01
	addc	r9, 0x00
	mov	r10, #SEG printdwordbuf
	mov	r4, #0
	mov	r5, #16
	cmp	er0, er4
	blt	.LBB3_9
	b	.LBB3_76

.LBB3_9:
	mov	r0, r2
	xor	r1, r1
	mov	r2, r3
	xor	r3, r3
	mov	er4, er2
	mov	r5, r4
	mov	r4, 0x00
	or	r4, r0
	or	r5, r1
	sllc	r3, 0x07
	sll	r2, 0x07
	add	er4, er2
	mov	r0, 0x00
	st	r0, -15[fp]
	mov	er0, #0
	st	er0, -18[fp]
	mov	r0, r6
	b	.LBB3_11

.LBB3_10:
	l	er0, -6[fp]
	add	er6, er0
	mov	er0, er6
	mov	r2, 0x00
	l	er4, -4[fp]
	l	r6, -2[fp]
	l	r4, r6:15[er4]
	st	r4, r2:[er0]
	mov	er0, #1
	mov	r2, #0
	l	er8, -12[fp]
	l	r10, -10[fp]
	l	r6, r10:1[er8]
	add	er8, er0
	l	er4, -8[fp]
	add	er4, 0x01
	mov	r0, r6
	cmp	r6, 0x00
	bne	.LBB3_11
	b	.LBB3_145

.LBB3_11:
	st	er8, -12[fp]
	st	r10, -10[fp]
	mov	bp, er4
	mov	r8, #55
	mov	r9, #-16
	mov	r10, #0
	l	r1, -15[fp]
	st	r1, r10:[er8]
	xor	r1, r1
	xor	r2, r2
	mov	er8, er0
	mov	er10, er2
	sllc	r10, 0x04
	sllc	r9, 0x04
	sll	r8, 0x04
	mov	r0, #BYTE1 OFFSET image_raw
	mov	r1, #BYTE2 OFFSET image_raw
	mov	r2, #SEG image_raw
	add	er0, er8
	st	er0, -4[fp]
	st	r2, -2[fp]
	l	er0, -18[fp]
	mov	er4, er0
	cmp	bp, er0
	beq	.LBB3_16
	b	.LBB3_12

.LBB3_12:
	mov	er10, #0
	mov	er8, er10
	b	.LBB3_14

.LBB3_13:
	mov	er8, er10
	mov	er0, er6
	add	er0, 0x01
	mov	er4, er8
	mov	er10, er0
	cmp	bp, er0
	beq	.LBB3_16
	b	.LBB3_14

.LBB3_14:
	mov	er6, er10
	mov	er0, er8
	mov	er8, er0
	add	er8, 0x01
	mov	er2, #31
	mov	er4, er8
	and	r4, r2
	and	r5, r3
	add	er0, 0x09
	mov	er2, #24
	mov	er10, er0
	cmp	er4, er2
	beq	.LBB3_13
	b	.LBB3_15

.LBB3_15:
	mov	er10, er8
	b	.LBB3_13

.LBB3_16:
	st	bp, -8[fp]
	mov	r0, #0
	mov	r1, #-8
	mov	er8, er4
	st	er0, -6[fp]
	add	er8, er0
	mov	er8, er8
	mov	r10, 0x00
	l	er0, -4[fp]
	l	r2, -2[fp]
	l	r12, r2:[er0]
	st	r12, r10:[er8]
	mov	er6, er4
	add	er6, 0x01
	mov	bp, #31
	mov	er10, er6
	and	r10, r12
	and	r11, r13
	add	er4, 0x09
	mov	er2, #24
	cmp	er10, er2
	beq	.LBB3_18
	b	.LBB3_17

.LBB3_17:
	mov	er4, er6

.LBB3_18:
	mov	er6, er4
	mov	er4, er6
	add	er4, 0x01F
	mov	er10, er4
	and	r10, r12
	and	r11, r13
	add	er6, 0x027
	st	er2, -14[fp]
	cmp	er10, er2
	beq	.LBB3_20
	b	.LBB3_19

.LBB3_19:
	mov	er6, er4

.LBB3_20:
	mov	er4, er6
	l	er0, -6[fp]
	add	er4, er0
	mov	er8, er4
	mov	r10, 0x00
	l	er0, -4[fp]
	l	r2, -2[fp]
	l	r2, r2:1[er0]
	st	r2, r10:[er8]
	mov	er10, er6
	add	er10, 0x01
	mov	er2, er10
	and	r2, r12
	and	r3, r13
	add	er6, 0x09
	l	er4, -14[fp]
	cmp	er2, er4
	beq	.LBB3_22
	b	.LBB3_21

.LBB3_21:
	mov	er6, er10

.LBB3_22:
	mov	er10, er6
	add	er10, 0x01F
	mov	er2, er10
	and	r2, r12
	and	r3, r13
	add	er6, 0x027
	cmp	er2, er4
	beq	.LBB3_24
	b	.LBB3_23

.LBB3_23:
	mov	er6, er10

.LBB3_24:
	mov	er2, er6
	l	er0, -6[fp]
	add	er2, er0
	mov	er8, er2
	mov	r10, 0x00
	l	er0, -4[fp]
	l	r2, -2[fp]
	l	r2, r2:2[er0]
	st	r2, r10:[er8]
	mov	er10, er6
	add	er10, 0x01
	mov	er2, er10
	and	r2, r12
	and	r3, r13
	add	er6, 0x09
	cmp	er2, er4
	beq	.LBB3_26
	b	.LBB3_25

.LBB3_25:
	mov	er6, er10

.LBB3_26:
	mov	er10, er6
	add	er10, 0x01F
	mov	er2, er10
	and	r2, r12
	and	r3, r13
	add	er6, 0x027
	cmp	er2, er4
	beq	.LBB3_28
	b	.LBB3_27

.LBB3_27:
	mov	er6, er10

.LBB3_28:
	mov	er2, er6
	l	er0, -6[fp]
	add	er2, er0
	mov	er8, er2
	mov	r10, 0x00
	l	er0, -4[fp]
	l	r2, -2[fp]
	l	r2, r2:3[er0]
	st	r2, r10:[er8]
	mov	er10, er6
	add	er10, 0x01
	mov	er2, er10
	and	r2, r12
	and	r3, r13
	add	er6, 0x09
	cmp	er2, er4
	beq	.LBB3_30
	b	.LBB3_29

.LBB3_29:
	mov	er6, er10

.LBB3_30:
	mov	er10, er6
	add	er10, 0x01F
	mov	er2, er10
	and	r2, r12
	and	r3, r13
	add	er6, 0x027
	cmp	er2, er4
	beq	.LBB3_32
	b	.LBB3_31

.LBB3_31:
	mov	er6, er10

.LBB3_32:
	mov	er2, er6
	l	er0, -6[fp]
	add	er2, er0
	mov	er8, er2
	mov	r10, 0x00
	l	er0, -4[fp]
	l	r2, -2[fp]
	l	r2, r2:4[er0]
	st	r2, r10:[er8]
	mov	er10, er6
	add	er10, 0x01
	mov	er2, er10
	and	r2, r12
	and	r3, r13
	add	er6, 0x09
	cmp	er2, er4
	beq	.LBB3_34
	b	.LBB3_33

.LBB3_33:
	mov	er6, er10

.LBB3_34:
	mov	er10, er6
	add	er10, 0x01F
	mov	er2, er10
	and	r2, r12
	and	r3, r13
	add	er6, 0x027
	cmp	er2, er4
	beq	.LBB3_36
	b	.LBB3_35

.LBB3_35:
	mov	er6, er10

.LBB3_36:
	mov	er2, er6
	l	er0, -6[fp]
	add	er2, er0
	mov	er8, er2
	mov	r10, 0x00
	l	er0, -4[fp]
	l	r2, -2[fp]
	l	r2, r2:5[er0]
	st	r2, r10:[er8]
	mov	er10, er6
	add	er10, 0x01
	mov	er2, er10
	and	r2, r12
	and	r3, r13
	add	er6, 0x09
	cmp	er2, er4
	beq	.LBB3_38
	b	.LBB3_37

.LBB3_37:
	mov	er6, er10

.LBB3_38:
	mov	er10, er6
	add	er10, 0x01F
	mov	er2, er10
	and	r2, r12
	and	r3, r13
	add	er6, 0x027
	cmp	er2, er4
	beq	.LBB3_40
	b	.LBB3_39

.LBB3_39:
	mov	er6, er10

.LBB3_40:
	mov	er2, er6
	l	er0, -6[fp]
	add	er2, er0
	mov	er8, er2
	mov	r10, 0x00
	l	er0, -4[fp]
	l	r2, -2[fp]
	l	r2, r2:6[er0]
	st	r2, r10:[er8]
	mov	er10, er6
	add	er10, 0x01
	mov	er2, er10
	and	r2, r12
	and	r3, r13
	add	er6, 0x09
	cmp	er2, er4
	beq	.LBB3_42
	b	.LBB3_41

.LBB3_41:
	mov	er6, er10

.LBB3_42:
	mov	er10, er6
	add	er10, 0x01F
	mov	er2, er10
	and	r2, r12
	and	r3, r13
	add	er6, 0x027
	cmp	er2, er4
	beq	.LBB3_44
	b	.LBB3_43

.LBB3_43:
	mov	er6, er10

.LBB3_44:
	mov	er2, er6
	l	er0, -6[fp]
	add	er2, er0
	mov	er8, er2
	mov	r10, 0x00
	l	er0, -4[fp]
	l	r2, -2[fp]
	l	r2, r2:7[er0]
	st	r2, r10:[er8]
	mov	er10, er6
	add	er10, 0x01
	mov	er2, er10
	and	r2, r12
	and	r3, r13
	add	er6, 0x09
	cmp	er2, er4
	beq	.LBB3_46
	b	.LBB3_45

.LBB3_45:
	mov	er6, er10

.LBB3_46:
	mov	er10, er6
	add	er10, 0x01F
	mov	er2, er10
	and	r2, r12
	and	r3, r13
	add	er6, 0x027
	cmp	er2, er4
	beq	.LBB3_48
	b	.LBB3_47

.LBB3_47:
	mov	er6, er10

.LBB3_48:
	mov	er2, er6
	l	er0, -6[fp]
	add	er2, er0
	mov	er8, er2
	mov	r10, 0x00
	l	er0, -4[fp]
	l	r2, -2[fp]
	l	r2, r2:8[er0]
	st	r2, r10:[er8]
	mov	er10, er6
	add	er10, 0x01
	mov	er2, er10
	and	r2, r12
	and	r3, r13
	add	er6, 0x09
	cmp	er2, er4
	beq	.LBB3_50
	b	.LBB3_49

.LBB3_49:
	mov	er6, er10

.LBB3_50:
	mov	er10, er6
	add	er10, 0x01F
	mov	er2, er10
	and	r2, r12
	and	r3, r13
	add	er6, 0x027
	cmp	er2, er4
	beq	.LBB3_52
	b	.LBB3_51

.LBB3_51:
	mov	er6, er10

.LBB3_52:
	mov	er2, er6
	l	er0, -6[fp]
	add	er2, er0
	mov	er8, er2
	mov	r10, 0x00
	l	er0, -4[fp]
	l	r2, -2[fp]
	l	r2, r2:9[er0]
	st	r2, r10:[er8]
	mov	er10, er6
	add	er10, 0x01
	mov	er2, er10
	and	r2, r12
	and	r3, r13
	add	er6, 0x09
	cmp	er2, er4
	beq	.LBB3_54
	b	.LBB3_53

.LBB3_53:
	mov	er6, er10

.LBB3_54:
	mov	er10, er6
	add	er10, 0x01F
	mov	er2, er10
	and	r2, r12
	and	r3, r13
	add	er6, 0x027
	cmp	er2, er4
	beq	.LBB3_56
	b	.LBB3_55

.LBB3_55:
	mov	er6, er10

.LBB3_56:
	mov	er2, er6
	l	er0, -6[fp]
	add	er2, er0
	mov	er8, er2
	mov	r10, 0x00
	l	er0, -4[fp]
	l	r2, -2[fp]
	l	r2, r2:10[er0]
	st	r2, r10:[er8]
	mov	er10, er6
	add	er10, 0x01
	mov	er2, er10
	and	r2, r12
	and	r3, r13
	add	er6, 0x09
	cmp	er2, er4
	beq	.LBB3_58
	b	.LBB3_57

.LBB3_57:
	mov	er6, er10

.LBB3_58:
	mov	er10, er6
	add	er10, 0x01F
	mov	er2, er10
	and	r2, r12
	and	r3, r13
	add	er6, 0x027
	cmp	er2, er4
	beq	.LBB3_60
	b	.LBB3_59

.LBB3_59:
	mov	er6, er10

.LBB3_60:
	mov	er2, er6
	l	er0, -6[fp]
	add	er2, er0
	mov	er8, er2
	mov	r10, 0x00
	l	er0, -4[fp]
	l	r2, -2[fp]
	l	r2, r2:11[er0]
	st	r2, r10:[er8]
	mov	er10, er6
	add	er10, 0x01
	mov	er2, er10
	and	r2, r12
	and	r3, r13
	add	er6, 0x09
	cmp	er2, er4
	beq	.LBB3_62
	b	.LBB3_61

.LBB3_61:
	mov	er6, er10

.LBB3_62:
	mov	er10, er6
	add	er10, 0x01F
	mov	er2, er10
	and	r2, r12
	and	r3, r13
	add	er6, 0x027
	cmp	er2, er4
	beq	.LBB3_64
	b	.LBB3_63

.LBB3_63:
	mov	er6, er10

.LBB3_64:
	mov	er2, er6
	l	er0, -6[fp]
	add	er2, er0
	mov	er8, er2
	mov	r10, 0x00
	l	er0, -4[fp]
	l	r2, -2[fp]
	l	r2, r2:12[er0]
	st	r2, r10:[er8]
	mov	er10, er6
	add	er10, 0x01
	mov	er2, er10
	and	r2, r12
	and	r3, r13
	add	er6, 0x09
	cmp	er2, er4
	beq	.LBB3_66
	b	.LBB3_65

.LBB3_65:
	mov	er6, er10

.LBB3_66:
	mov	er10, er6
	add	er10, 0x01F
	mov	er2, er10
	and	r2, r12
	and	r3, r13
	add	er6, 0x027
	cmp	er2, er4
	beq	.LBB3_68
	b	.LBB3_67

.LBB3_67:
	mov	er6, er10

.LBB3_68:
	mov	er2, er6
	l	er0, -6[fp]
	add	er2, er0
	mov	er8, er2
	mov	r10, 0x00
	l	er0, -4[fp]
	l	r2, -2[fp]
	l	r2, r2:13[er0]
	st	r2, r10:[er8]
	mov	er10, er6
	add	er10, 0x01
	mov	er2, er10
	and	r2, r12
	and	r3, r13
	add	er6, 0x09
	cmp	er2, er4
	beq	.LBB3_70
	b	.LBB3_69

.LBB3_69:
	mov	er6, er10

.LBB3_70:
	mov	er10, er6
	add	er10, 0x01F
	mov	er2, er10
	and	r2, r12
	and	r3, r13
	add	er6, 0x027
	cmp	er2, er4
	beq	.LBB3_72
	b	.LBB3_71

.LBB3_71:
	mov	er6, er10

.LBB3_72:
	mov	er2, er6
	l	er0, -6[fp]
	add	er2, er0
	mov	er8, er2
	mov	r10, 0x00
	l	er0, -4[fp]
	l	r2, -2[fp]
	l	r2, r2:14[er0]
	st	r2, r10:[er8]
	mov	er10, er6
	add	er10, 0x01
	mov	er2, er10
	and	r2, r12
	and	r3, r13
	add	er6, 0x09
	cmp	er2, er4
	beq	.LBB3_74
	b	.LBB3_73

.LBB3_73:
	mov	er6, er10

.LBB3_74:
	mov	er10, er6
	add	er10, 0x01F
	mov	er2, er10
	and	r2, r12
	and	r3, r13
	add	er6, 0x027
	cmp	er2, er4
	bne	.LBB3_75
	b	.LBB3_10

.LBB3_75:
	mov	er6, er10
	b	.LBB3_10

.LBB3_76:
	mov	er4, er0
	mov	r4, r5
	srl	r4, 0x04
	mov	r5, 0x00
	mov	r5, r4
	mov	r4, r5
	or	r4, 0x030
	add	r5, 0x057
	mov	r6, #-1
	mov	r7, #-97
	cmp	er0, er6
	bgt	.LBB3_78
	b	.LBB3_77

.LBB3_77:
	mov	r5, r4

.LBB3_78:
	st	r5, FAR printdwordbuf
	mov	r0, r2
	xor	r1, r1
	mov	r2, r3
	xor	r3, r3
	mov	er6, er2
	mov	r7, r6
	mov	r6, 0x00
	or	r6, r0
	or	r7, r1
	sllc	r3, 0x07
	sll	r2, 0x07
	add	er6, er2
	mov	r8, #BYTE1 OFFSET printdwordbuf
	mov	r9, #BYTE2 OFFSET printdwordbuf
	mov	r10, #SEG printdwordbuf
	mov	r0, 0x00
	st	r0, -15[fp]
	mov	er0, #0
	st	er0, -18[fp]
	mov	r0, r5
	mov	er4, er6
	b	.LBB3_80

.LBB3_79:
	l	er0, -6[fp]
	add	er6, er0
	mov	er0, er6
	mov	r2, 0x00
	l	er4, -4[fp]
	l	r6, -2[fp]
	l	r4, r6:15[er4]
	st	r4, r2:[er0]
	mov	er0, #1
	mov	r2, #0
	l	er8, -12[fp]
	l	r10, -10[fp]
	l	r6, r10:1[er8]
	add	er8, er0
	l	er4, -8[fp]
	add	er4, 0x01
	mov	r0, r6
	cmp	r6, 0x00
	bne	.LBB3_80
	b	.LBB3_145

.LBB3_80:
	st	er8, -12[fp]
	st	r10, -10[fp]
	mov	bp, er4
	mov	r8, #55
	mov	r9, #-16
	mov	r10, #0
	l	r1, -15[fp]
	st	r1, r10:[er8]
	xor	r1, r1
	xor	r2, r2
	mov	er8, er0
	mov	er10, er2
	sllc	r10, 0x04
	sllc	r9, 0x04
	sll	r8, 0x04
	mov	r0, #BYTE1 OFFSET image_raw
	mov	r1, #BYTE2 OFFSET image_raw
	mov	r2, #SEG image_raw
	add	er0, er8
	st	er0, -4[fp]
	st	r2, -2[fp]
	l	er0, -18[fp]
	mov	er4, er0
	cmp	bp, er0
	beq	.LBB3_85
	b	.LBB3_81

.LBB3_81:
	mov	er10, #0
	mov	er8, er10
	b	.LBB3_83

.LBB3_82:
	mov	er8, er10
	mov	er0, er6
	add	er0, 0x01
	mov	er4, er8
	mov	er10, er0
	cmp	bp, er0
	beq	.LBB3_85
	b	.LBB3_83

.LBB3_83:
	mov	er6, er10
	mov	er0, er8
	mov	er8, er0
	add	er8, 0x01
	mov	er2, #31
	mov	er4, er8
	and	r4, r2
	and	r5, r3
	add	er0, 0x09
	mov	er2, #24
	mov	er10, er0
	cmp	er4, er2
	beq	.LBB3_82
	b	.LBB3_84

.LBB3_84:
	mov	er10, er8
	b	.LBB3_82

.LBB3_85:
	st	bp, -8[fp]
	mov	r0, #0
	mov	r1, #-8
	mov	er8, er4
	st	er0, -6[fp]
	add	er8, er0
	mov	er8, er8
	mov	r10, 0x00
	l	er0, -4[fp]
	l	r2, -2[fp]
	l	r12, r2:[er0]
	st	r12, r10:[er8]
	mov	er6, er4
	add	er6, 0x01
	mov	bp, #31
	mov	er10, er6
	and	r10, r12
	and	r11, r13
	add	er4, 0x09
	mov	er2, #24
	cmp	er10, er2
	beq	.LBB3_87
	b	.LBB3_86

.LBB3_86:
	mov	er4, er6

.LBB3_87:
	mov	er6, er4
	mov	er4, er6
	add	er4, 0x01F
	mov	er10, er4
	and	r10, r12
	and	r11, r13
	add	er6, 0x027
	st	er2, -14[fp]
	cmp	er10, er2
	beq	.LBB3_89
	b	.LBB3_88

.LBB3_88:
	mov	er6, er4

.LBB3_89:
	mov	er4, er6
	l	er0, -6[fp]
	add	er4, er0
	mov	er8, er4
	mov	r10, 0x00
	l	er0, -4[fp]
	l	r2, -2[fp]
	l	r2, r2:1[er0]
	st	r2, r10:[er8]
	mov	er10, er6
	add	er10, 0x01
	mov	er2, er10
	and	r2, r12
	and	r3, r13
	add	er6, 0x09
	l	er4, -14[fp]
	cmp	er2, er4
	beq	.LBB3_91
	b	.LBB3_90

.LBB3_90:
	mov	er6, er10

.LBB3_91:
	mov	er10, er6
	add	er10, 0x01F
	mov	er2, er10
	and	r2, r12
	and	r3, r13
	add	er6, 0x027
	cmp	er2, er4
	beq	.LBB3_93
	b	.LBB3_92

.LBB3_92:
	mov	er6, er10

.LBB3_93:
	mov	er2, er6
	l	er0, -6[fp]
	add	er2, er0
	mov	er8, er2
	mov	r10, 0x00
	l	er0, -4[fp]
	l	r2, -2[fp]
	l	r2, r2:2[er0]
	st	r2, r10:[er8]
	mov	er10, er6
	add	er10, 0x01
	mov	er2, er10
	and	r2, r12
	and	r3, r13
	add	er6, 0x09
	cmp	er2, er4
	beq	.LBB3_95
	b	.LBB3_94

.LBB3_94:
	mov	er6, er10

.LBB3_95:
	mov	er10, er6
	add	er10, 0x01F
	mov	er2, er10
	and	r2, r12
	and	r3, r13
	add	er6, 0x027
	cmp	er2, er4
	beq	.LBB3_97
	b	.LBB3_96

.LBB3_96:
	mov	er6, er10

.LBB3_97:
	mov	er2, er6
	l	er0, -6[fp]
	add	er2, er0
	mov	er8, er2
	mov	r10, 0x00
	l	er0, -4[fp]
	l	r2, -2[fp]
	l	r2, r2:3[er0]
	st	r2, r10:[er8]
	mov	er10, er6
	add	er10, 0x01
	mov	er2, er10
	and	r2, r12
	and	r3, r13
	add	er6, 0x09
	cmp	er2, er4
	beq	.LBB3_99
	b	.LBB3_98

.LBB3_98:
	mov	er6, er10

.LBB3_99:
	mov	er10, er6
	add	er10, 0x01F
	mov	er2, er10
	and	r2, r12
	and	r3, r13
	add	er6, 0x027
	cmp	er2, er4
	beq	.LBB3_101
	b	.LBB3_100

.LBB3_100:
	mov	er6, er10

.LBB3_101:
	mov	er2, er6
	l	er0, -6[fp]
	add	er2, er0
	mov	er8, er2
	mov	r10, 0x00
	l	er0, -4[fp]
	l	r2, -2[fp]
	l	r2, r2:4[er0]
	st	r2, r10:[er8]
	mov	er10, er6
	add	er10, 0x01
	mov	er2, er10
	and	r2, r12
	and	r3, r13
	add	er6, 0x09
	cmp	er2, er4
	beq	.LBB3_103
	b	.LBB3_102

.LBB3_102:
	mov	er6, er10

.LBB3_103:
	mov	er10, er6
	add	er10, 0x01F
	mov	er2, er10
	and	r2, r12
	and	r3, r13
	add	er6, 0x027
	cmp	er2, er4
	beq	.LBB3_105
	b	.LBB3_104

.LBB3_104:
	mov	er6, er10

.LBB3_105:
	mov	er2, er6
	l	er0, -6[fp]
	add	er2, er0
	mov	er8, er2
	mov	r10, 0x00
	l	er0, -4[fp]
	l	r2, -2[fp]
	l	r2, r2:5[er0]
	st	r2, r10:[er8]
	mov	er10, er6
	add	er10, 0x01
	mov	er2, er10
	and	r2, r12
	and	r3, r13
	add	er6, 0x09
	cmp	er2, er4
	beq	.LBB3_107
	b	.LBB3_106

.LBB3_106:
	mov	er6, er10

.LBB3_107:
	mov	er10, er6
	add	er10, 0x01F
	mov	er2, er10
	and	r2, r12
	and	r3, r13
	add	er6, 0x027
	cmp	er2, er4
	beq	.LBB3_109
	b	.LBB3_108

.LBB3_108:
	mov	er6, er10

.LBB3_109:
	mov	er2, er6
	l	er0, -6[fp]
	add	er2, er0
	mov	er8, er2
	mov	r10, 0x00
	l	er0, -4[fp]
	l	r2, -2[fp]
	l	r2, r2:6[er0]
	st	r2, r10:[er8]
	mov	er10, er6
	add	er10, 0x01
	mov	er2, er10
	and	r2, r12
	and	r3, r13
	add	er6, 0x09
	cmp	er2, er4
	beq	.LBB3_111
	b	.LBB3_110

.LBB3_110:
	mov	er6, er10

.LBB3_111:
	mov	er10, er6
	add	er10, 0x01F
	mov	er2, er10
	and	r2, r12
	and	r3, r13
	add	er6, 0x027
	cmp	er2, er4
	beq	.LBB3_113
	b	.LBB3_112

.LBB3_112:
	mov	er6, er10

.LBB3_113:
	mov	er2, er6
	l	er0, -6[fp]
	add	er2, er0
	mov	er8, er2
	mov	r10, 0x00
	l	er0, -4[fp]
	l	r2, -2[fp]
	l	r2, r2:7[er0]
	st	r2, r10:[er8]
	mov	er10, er6
	add	er10, 0x01
	mov	er2, er10
	and	r2, r12
	and	r3, r13
	add	er6, 0x09
	cmp	er2, er4
	beq	.LBB3_115
	b	.LBB3_114

.LBB3_114:
	mov	er6, er10

.LBB3_115:
	mov	er10, er6
	add	er10, 0x01F
	mov	er2, er10
	and	r2, r12
	and	r3, r13
	add	er6, 0x027
	cmp	er2, er4
	beq	.LBB3_117
	b	.LBB3_116

.LBB3_116:
	mov	er6, er10

.LBB3_117:
	mov	er2, er6
	l	er0, -6[fp]
	add	er2, er0
	mov	er8, er2
	mov	r10, 0x00
	l	er0, -4[fp]
	l	r2, -2[fp]
	l	r2, r2:8[er0]
	st	r2, r10:[er8]
	mov	er10, er6
	add	er10, 0x01
	mov	er2, er10
	and	r2, r12
	and	r3, r13
	add	er6, 0x09
	cmp	er2, er4
	beq	.LBB3_119
	b	.LBB3_118

.LBB3_118:
	mov	er6, er10

.LBB3_119:
	mov	er10, er6
	add	er10, 0x01F
	mov	er2, er10
	and	r2, r12
	and	r3, r13
	add	er6, 0x027
	cmp	er2, er4
	beq	.LBB3_121
	b	.LBB3_120

.LBB3_120:
	mov	er6, er10

.LBB3_121:
	mov	er2, er6
	l	er0, -6[fp]
	add	er2, er0
	mov	er8, er2
	mov	r10, 0x00
	l	er0, -4[fp]
	l	r2, -2[fp]
	l	r2, r2:9[er0]
	st	r2, r10:[er8]
	mov	er10, er6
	add	er10, 0x01
	mov	er2, er10
	and	r2, r12
	and	r3, r13
	add	er6, 0x09
	cmp	er2, er4
	beq	.LBB3_123
	b	.LBB3_122

.LBB3_122:
	mov	er6, er10

.LBB3_123:
	mov	er10, er6
	add	er10, 0x01F
	mov	er2, er10
	and	r2, r12
	and	r3, r13
	add	er6, 0x027
	cmp	er2, er4
	beq	.LBB3_125
	b	.LBB3_124

.LBB3_124:
	mov	er6, er10

.LBB3_125:
	mov	er2, er6
	l	er0, -6[fp]
	add	er2, er0
	mov	er8, er2
	mov	r10, 0x00
	l	er0, -4[fp]
	l	r2, -2[fp]
	l	r2, r2:10[er0]
	st	r2, r10:[er8]
	mov	er10, er6
	add	er10, 0x01
	mov	er2, er10
	and	r2, r12
	and	r3, r13
	add	er6, 0x09
	cmp	er2, er4
	beq	.LBB3_127
	b	.LBB3_126

.LBB3_126:
	mov	er6, er10

.LBB3_127:
	mov	er10, er6
	add	er10, 0x01F
	mov	er2, er10
	and	r2, r12
	and	r3, r13
	add	er6, 0x027
	cmp	er2, er4
	beq	.LBB3_129
	b	.LBB3_128

.LBB3_128:
	mov	er6, er10

.LBB3_129:
	mov	er2, er6
	l	er0, -6[fp]
	add	er2, er0
	mov	er8, er2
	mov	r10, 0x00
	l	er0, -4[fp]
	l	r2, -2[fp]
	l	r2, r2:11[er0]
	st	r2, r10:[er8]
	mov	er10, er6
	add	er10, 0x01
	mov	er2, er10
	and	r2, r12
	and	r3, r13
	add	er6, 0x09
	cmp	er2, er4
	beq	.LBB3_131
	b	.LBB3_130

.LBB3_130:
	mov	er6, er10

.LBB3_131:
	mov	er10, er6
	add	er10, 0x01F
	mov	er2, er10
	and	r2, r12
	and	r3, r13
	add	er6, 0x027
	cmp	er2, er4
	beq	.LBB3_133
	b	.LBB3_132

.LBB3_132:
	mov	er6, er10

.LBB3_133:
	mov	er2, er6
	l	er0, -6[fp]
	add	er2, er0
	mov	er8, er2
	mov	r10, 0x00
	l	er0, -4[fp]
	l	r2, -2[fp]
	l	r2, r2:12[er0]
	st	r2, r10:[er8]
	mov	er10, er6
	add	er10, 0x01
	mov	er2, er10
	and	r2, r12
	and	r3, r13
	add	er6, 0x09
	cmp	er2, er4
	beq	.LBB3_135
	b	.LBB3_134

.LBB3_134:
	mov	er6, er10

.LBB3_135:
	mov	er10, er6
	add	er10, 0x01F
	mov	er2, er10
	and	r2, r12
	and	r3, r13
	add	er6, 0x027
	cmp	er2, er4
	beq	.LBB3_137
	b	.LBB3_136

.LBB3_136:
	mov	er6, er10

.LBB3_137:
	mov	er2, er6
	l	er0, -6[fp]
	add	er2, er0
	mov	er8, er2
	mov	r10, 0x00
	l	er0, -4[fp]
	l	r2, -2[fp]
	l	r2, r2:13[er0]
	st	r2, r10:[er8]
	mov	er10, er6
	add	er10, 0x01
	mov	er2, er10
	and	r2, r12
	and	r3, r13
	add	er6, 0x09
	cmp	er2, er4
	beq	.LBB3_139
	b	.LBB3_138

.LBB3_138:
	mov	er6, er10

.LBB3_139:
	mov	er10, er6
	add	er10, 0x01F
	mov	er2, er10
	and	r2, r12
	and	r3, r13
	add	er6, 0x027
	cmp	er2, er4
	beq	.LBB3_141
	b	.LBB3_140

.LBB3_140:
	mov	er6, er10

.LBB3_141:
	mov	er2, er6
	l	er0, -6[fp]
	add	er2, er0
	mov	er8, er2
	mov	r10, 0x00
	l	er0, -4[fp]
	l	r2, -2[fp]
	l	r2, r2:14[er0]
	st	r2, r10:[er8]
	mov	er10, er6
	add	er10, 0x01
	mov	er2, er10
	and	r2, r12
	and	r3, r13
	add	er6, 0x09
	cmp	er2, er4
	beq	.LBB3_143
	b	.LBB3_142

.LBB3_142:
	mov	er6, er10

.LBB3_143:
	mov	er10, er6
	add	er10, 0x01F
	mov	er2, er10
	and	r2, r12
	and	r3, r13
	add	er6, 0x027
	cmp	er2, er4
	bne	.LBB3_144
	b	.LBB3_79

.LBB3_144:
	mov	er6, er10
	b	.LBB3_79

.LBB3_145:
	b	__regpopu8lw
	rt

.Lfunc_end3:
	.size	PrintWord, .Lfunc_end3-PrintWord

	.globl	main
	.type	main,@function
	.p2align	2
main :
	mov	r4, #32
	mov	r5, #-8

.LBB4_1:
	bl	CheckButtons
	mov	r1, r0
	cmp	r0, #-1
	beq	.LBB4_1
	b	.LBB4_2

.LBB4_2:
	mov	er8, er4
	mov	r10, 0x00
	st	r1, r10:[er8]
	add	er4, 0x01
	b	.LBB4_1

.Lfunc_end4:
	.size	main, .Lfunc_end4-main

	.type	image_raw,@object
	.section	.rodata,"a",@progbits
	.globl	image_raw
image_raw:
	.asciz	"U\252U\252U\252U\252U\252U\252U\252U\200\200\200\200\200\200\200\200\200\200\200\200\200\200\200\200\377\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\377\200\200\200\200\200\200\200\200\200\200\200\200\200\200\200\377\252T\252T\252T\252T\252T\252T\252T\000\201\201\201\201\201\201\201\201\201\201\201\201\201\201\201\201\377\001\001\001\001\001\001\001\001\001\001\001\001\001\001\001\377\201\201\201\201\201\201\201\201\201\201\201\201\201\201\201\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\377\200\200\200\200\200\200\200\200\200\200\200\200\200\200\200\377\377\000\000\000\000\000\000\000\000\000\000\000\000\000\000\377\377\200\200\200\200\200\200\200\200\200\200\200\200\200\200\377\001\001\001\001\001\001\001\001\001\001\001\001\001\001\001\377\201\201\201\201\201\201\201\201\201\201\201\201\201\201\201\377\377\001\001\001\001\001\001\001\001\001\001\001\001\001\001\377\377\201\201\201\201\201\201\201\201\201\201\201\201\201\201\377\001\001\002\002\004\004\b\b\020\020  @@\200\200\200\200@@  \020\020\b\b\004\004\002\002\001\001\000\000\000\000\000\000\000\000\377\377\377\377\377\377\377\377\017\017\017\017\017\017\017\017\360\360\360\360\360\360\360\360\377\252U\252U\252U\252U\252U\252U\252U\000\000\000\000\000\000\000\000\000\000\000\000\000\377\377\377\377\377\377\377\377\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000<B\201\201\201\201B<\000\000\000\000\000\000\000\000<~\377\377\377\377~<\000\000\000\000\377\252\325\252\325\252\325\252\325\252\325\252\325\252\325\200\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\200\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\001\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\200\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\001\000\000\000\000\000\000\000\377\377\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\b\b\b\b\b\b\b\000\b\b\000\000\000\000\"\"\"\"\000\000\000\000\000\000\000\000\000\000\000\000\000\000\022\022\022~$$~HHH\000\000\000\000\000\000\b>IH8\016\tI>\b\000\000\000\000\000\0001JJ4\b\b\026))F\000\000\000\000\000\000\034\"\"\024\030)EBF9\000\000\000\000\b\b\b\b\000\000\000\000\000\000\000\000\000\000\000\000\000\004\b\b\020\020\020\020\020\020\b\b\004\000\000\000\000 \020\020\b\b\b\b\b\b\020\020 \000\000\000\000\000\000\000\bI*\034*I\b\000\000\000\000\000\000\000\000\000\b\b\b\177\b\b\b\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\030\b\b\020\000\000\000\000\000\000\000\000\000<\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\030\030\000\000\000\000\000\000\002\002\004\b\b\020\020 @@\000\000\000\000\000\000\030$BFJRbB$\030\000\000\000\000\000\000\b\030(\b\b\b\b\b\b>\000\000\000\000\000\000<BB\002\f\020 @@~\000\000\000\000\000\000<BB\002\034\002\002BB<\000\000\000\000\000\000\004\f\024$DD~\004\004\004\000\000\000\000\000\000~@@@|\002\002\002B<\000\000\000\000\000\000\034 @@|BBBB<\000\000\000\000\000\000~\002\002\004\004\004\b\b\b\b\000\000\000\000\000\000<BBB<BBBB<\000\000\000\000\000\000<BBB>\002\002\002\0048\000\000\000\000\000\000\000\000\030\030\000\000\000\030\030\000\000\000\000\000\000\000\000\000\030\030\000\000\000\030\b\b\020\000\000\000\000\000\000\002\004\b\020 \020\b\004\002\000\000\000\000\000\000\000\000\000~\000\000\000~\000\000\000\000\000\000\000\000\000@ \020\b\004\b\020 @\000\000\000\000\000\000<BB\002\004\b\b\000\b\b\000\000\000\000\000\000\034\"JVRRRN \036\000\000\000\000\000\000\030$$BB~BBBB\000\000\000\000\000\000|BBB|BBBB|\000\000\000\000\000\000<BB@@@@BB<\000\000\000\000\000\000xDBBBBBBDx\000\000\000\000\000\000~@@@|@@@@~\000\000\000\000\000\000~@@@|@@@@@\000\000\000\000\000\000<BB@@NBBF:\000\000\000\000\000\000BBBB~BBBBB\000\000\000\000\000\000>\b\b\b\b\b\b\b\b>\000\000\000\000\000\000\037\004\004\004\004\004\004DD8\000\000\000\000\000\000BDHP``PHDB\000\000\000\000\000\000@@@@@@@@@~\000\000\000\000\000\000BBffZZBBBB\000\000\000\000\000\000BbbRRJJFFB\000\000\000\000\000\000<BBBBBBBB<\000\000\000\000\000\000|BBB|@@@@@\000\000\000\000\000\000<BBBBBBZf<\003\000\000\000\000\000|BBB|HDDBB\000\000\000\000\000\000<BB@0\f\002BB<\000\000\000\000\000\000\177\b\b\b\b\b\b\b\b\b\000\000\000\000\000\000BBBBBBBBB<\000\000\000\000\000\000AAA\"\"\"\024\024\b\b\000\000\000\000\000\000BBBBZZffBB\000\000\000\000\000\000BB$$\030\030$$BB\000\000\000\000\000\000AA\"\"\024\b\b\b\b\b\000\000\000\000\000\000~\002\002\004\b\020 @@~\000\000\000\000\000\016\b\b\b\b\b\b\b\b\b\b\016\000\000\000\000\000@@ \020\020\b\b\004\002\002\000\000\000\000\000p\020\020\020\020\020\020\020\020\020\020p\000\000\000\030$B\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\177\000\000 \020\b\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000<B\002>BBF:\000\000\000\000\000@@@\\bBBBBb\\\000\000\000\000\000\000\000\000<B@@@@B<\000\000\000\000\000\002\002\002:FBBBBF:\000\000\000\000\000\000\000\000<BB~@@B<\000\000\000\000\000\f\020\020\020|\020\020\020\020\020\020\000\000\000\000\000\000\000\002:DDD8 <BB<\000\000\000@@@\\bBBBBBB\000\000\000\000\000\b\b\000\030\b\b\b\b\b\b>\000\000\000\000\000\004\004\000\f\004\004\004\004\004\004\004H0\000\000\000@@@DHP`PHDB\000\000\000\000\000\030\b\b\b\b\b\b\b\b\b>\000\000\000\000\000\000\000\000vIIIIIII\000\000\000\000\000\000\000\000\\bBBBBBB\000\000\000\000\000\000\000\000<BBBBBB<\000\000\000\000\000\000\000\000\\bBBBBb\\@@\000\000\000\000\000\000:FBBBBF:\002\002\000\000\000\000\000\000\\bB@@@@@\000\000\000\000\000\000\000\000<B@0\f\002B<\000\000\000\000\000\000\020\020\020|\020\020\020\020\020\f\000\000\000\000\000\000\000\000BBBBBBF:\000\000\000\000\000\000\000\000BBB$$$\030\030\000\000\000\000\000\000\000\000AIIIIII6\000\000\000\000\000\000\000\000BB$\030\030$BB\000\000\000\000\000\000\000\000BBBBB&\032\002\002<\000\000\000\000\000\000~\002\004\b\020 @~\000\000\000\000\000\f\020\020\b\b\020 \020\b\b\020\020\f\000\000\b\b\b\b\b\b\b\b\b\b\b\b\b\b\000\000\0000\b\b\020\020\b\004\b\020\020\b\b0\000\000\0001IF\000\000\000\000\000\000\000\000\000\000\000\001\001\003\003\007\007\017\017\037\037??\177\177\377\000\200\200\300\300\340\340\360\360\370\370\374\374\376\376\377\000\000\000\000\000\000\000\000\000\000\000\000\000\000\377\377\000\000\000\000\000\000\000\000\000\000\000\000\000\377\377\377\000\000\000\000\000\000\000\000\000\000\000\377\377\377\377\377\000\000\000\000\000\000\000\000\000\000\377\377\377\377\377\377\000\000\000\000\377\377\377\377\377\377\377\377\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\001\003\007\017\000\000\000\000\000\000\000\000\000\000\000\000\200\300\340\360\360\340\300\200\000\000\000\000\000\000\000\000\000\000\000\000\017\007\003\001\000\000\000\000\000\000\000\000\000\000\000\000\030\030\030\030\030\030\030\037\037\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\037\037\030\030\030\030\030\000\000\000\000\000\000\000\000\000\370\370\030\030\030\030\030\030\030\030\030\030\030\030\030\370\370\000\000\000\000\000\000\000\030\030\030\030\030\030\030\377\377\000\000\000\000\000\000\000\030\030\030\030\030\030\030\037\037\030\030\030\030\030\030\030\000\000\000\000\000\000\000\377\377\030\030\030\030\030\030\030\030\030\030\030\030\030\030\370\370\030\030\030\030\030\030\030\030\030\030\030\030\030\030\377\377\030\030\030\030\030\030\030\377\000~\377\377\377\377\377\377\377\377\377\377~\000\377\377\000\000\000\000~\377\377\377\377\377\377\377~\000\377\340\030\004\002\002\001\001\001\001\001\001\002\002\004\030\340\007\030 @@\200\200\200\200\200\200@@ \030\007\340\370\374\376\376\377\377\377\377\377\377\376\376\374\370\340\007\037?\177\177\377\377\377\377\377\377\177\177?\037\007\210\"\210\"\210\"\210\"\210\"\210\"\210\"\210\"\200\000\000\000\b\000\000\000\200\000\000\000\b\000\000\000\340\370\374\376\376\377\377\377\377\377\377\377\377\377\377\377\007\037?\177\177\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\177\177?\037\007\377\377\377\377\377\377\377\377\377\377\377\376\376\374\370\340\3000\f\003\3000\f\003\3000\f\003\3000\f\003\021\021\"\"DD\210\210\021\021\"\"DD\210\210\000\000\000\000\b\b\000\b\b\b\b\b\b\b\000\000\000\000\000\000\b\b>IHHI>\b\b\000\000\000\000\000\000\016\020\020\020|\020\020\020>a\000\000\000\000\000\000\000B<$BB$<B\000\000\000\000\000\000\000A\"\024\b\177\b\177\b\b\b\000\000\000\000\000\000\b\b\b\b\000\000\b\b\b\b\000\000\000\000\000\000<B@<BB<\002B<\000\000$$\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000<B\231\245\241\241\245\231B<\000\000\000\000\034\002\036\"\036\000>\000\000\000\000\000\000\000\000\000\000\000\000\022\022$$H$$\022\022\000\000\000\000\000\000\000\000\000\000\000\000~\002\002\002\000\000\377\252\324\252\324\252\324\252\324\252\324\252\324\252\324\200\000\000\000\000<B\271\245\245\271\251\245B<\000\000\000\000~\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\030$$\030\000\000\000\000\000\000\000\000\000\000\000\000\b\b\b\177\b\b\b\000\177\000\000\000\000\000\0008D\004\030 @|\000\000\000\000\000\000\000\000\0008D\0048\004D8\000\000\000\000\000\000\000\004\b\020\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000BBBBBBfY@\200\000\000\000\000?zzz:\n\n\n\n\n\n\000\000\000\000\000\000\000\000\000\030\030\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\b0\000\000\000\0200P\020\020\020|\000\000\000\000\000\000\000\000\034\"\"\"\034\000>\000\000\000\000\000\000\000\000\000\000\000\000HH$$\022$$HH\000\000\000\000\000\000\"b$((\022\026*NB\000\000\000\000\000\000\"b$((\024\032\"DN\000\000\000\000\000\000b\022$\030h\022\026*NB\000\000\000\000\000\000\020\020\000\020\020 @BB<\000\0000\f\000\000\030$$BB~BBBB\000\000\f0\000\000\030$$BB~BBBB\000\000\030$\000\000\030$$BB~BBBB\000\0002L\000\000\030$$BB~BBBB\000\000$$\000\000\030$$BB~BBBB\000\000\030$\030\000\030$$BB~BBBB\000\000\000\000\000\000\037(HH\177HHHHO\000\000\000\000\000\000<BB@@@@BB<\b00\f\000\000~@@@|@@@@~\000\000\f0\000\000~@@@|@@@@~\000\000\030$\000\000~@@@|@@@@~\000\000$$\000\000~@@@|@@@@~\000\000\030\006\000\000>\b\b\b\b\b\b\b\b>\000\000\f0\000\000>\b\b\b\b\b\b\b\b>\000\000\030$\000\000>\b\b\b\b\b\b\b\b>\000\000$$\000\000>\b\b\b\b\b\b\b\b>\000\000\000\000\000\000xDBB\362BBBDx\000\0002L\000\000BbbRRJJFFB\000\0000\f\000\000<BBBBBBBB<\000\000\f0\000\000<BBBBBBBB<\000\000\030$\000\000<BBBBBBBB<\000\0002L\000\000<BBBBBBBB<\000\000$$\000\000<BBBBBBBB<\000\000\000\000\000\000\000\000\000B$\030$B\000\000\000\000\000\000\000\002:DFJJRRb\"\\@\0000\f\000\000BBBBBBBBB<\000\000\f0\000\000BBBBBBBBB<\000\000\030$\000\000BBBBBBBBB<\000\000$$\000\000BBBBBBBBB<\000\000\f0\000\000AA\"\"\024\b\b\b\b\b\000\000\000\000\000@@xDBBDx@@@\000\000\000\000\000\0008DDHXDBBRL\000\000\000\0000\f\000\000<B\002>BBF:\000\000\000\000\f0\000\000<B\002>BBF:\000\000\000\000\030$\000\000<B\002>BBF:\000\000\000\0002L\000\000<B\002>BBF:\000\000\000\000$$\000\000<B\002>BBF:\000\000\000\030$\030\000\000<B\002>BBF:\000\000\000\000\000\000\000\000>I\t?HHI>\000\000\000\000\000\000\000\000<B@@@@B<\b0\000\0000\f\000\000<BB~@@B<\000\000\000\000\f0\000\000<BB~@@B<\000\000\000\000\030$\000\000<BB~@@B<\000\000\000\000$$\000\000<BB~@@B<\000\000\000\0000\f\000\000\030\b\b\b\b\b\b>\000\000\000\000\f0\000\000\030\b\b\b\b\b\b>\000\000\000\000\030$\000\000\030\b\b\b\b\b\b>\000\000\000\000$$\000\000\030\b\b\b\b\b\b>\000\000\000\0002\f\024\"\002>BBBBB<\000\000\000\0002L\000\000\\bBBBBBB\000\000\000\0000\f\000\000<BBBBBB<\000\000\000\000\f0\000\000<BBBBBB<\000\000\000\000\030$\000\000<BBBBBB<\000\000\000\0002L\000\000<BBBBBB<\000\000\000\000$$\000\000<BBBBBB<\000\000\000\000\000\000\000\000\030\000\000~\000\000\030\000\000\000\000\000\000\000\000\002<FJJRRb<@\000\000\0000\f\000\000BBBBBBF:\000\000\000\000\f0\000\000BBBBBBF:\000\000\000\000\030$\000\000BBBBBBF:\000\000\000\000$$\000\000BBBBBBF:\000\000\000\000\f0\000\000BBBBB&\032\002\002<\000\000\000@@@\\bBBBBb\\@@\000\000$$\000\000BBBBB&\032\002\002<"
	.size	image_raw, 4096

	.type	lastbutton,@object
	.data
	.globl	lastbutton
lastbutton:
	.byte	255
	.size	lastbutton, 1

	.type	printdwordbuf,@object
	.section	.bss,"aw",@nobits
	.globl	printdwordbuf
printdwordbuf:
	.zero	5
	.size	printdwordbuf, 5


	.ident	"clang version 1.30"

