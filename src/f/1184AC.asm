; ---------------------------------------------------------------------------
; ICandy_Init - ICandy constructor: position, clear velocity/accel/animation, register with sub_1F9C92
; In:  8(a6) = this  $C/$10(a6) = x, y (16.16)
; Out: none
; Evidence: method 2 of ICANDY; +8/+$C position, +$14/+$16 velocity, +$18/+$1A accel, handle at +$3E
; ---------------------------------------------------------------------------
ICandy_Init:
	link.w	a6,#$0
	movem.l	d6-d7/a4,-(a7)
	move.l	$10(a6),d6
	move.l	$C(a6),d7
	movea.l	$8(a6),a4
	move.l	d7,$8(a4)
	move.l	d7,d0
	asr.l	#$8,d0
	move.w	d0,$10(a4)
	move.l	d6,$C(a4)
	move.l	d6,d0
	asr.l	#$8,d0
	move.w	d0,$12(a4)
	clr.l	$14(a4)
	clr.l	$18(a4)
	clr.w	$6(a4)
	moveq	#$0,d0
	move.l	d0,$32(a4)
	clr.b	$1C(a4)
	clr.b	$27(a4)
	clr.b	$1D(a4)
	move.l	d0,$1E(a4)
	move.b	#$FF,$26(a4)
	move.w	#$FFFF,$22(a4)
	clr.b	$3A(a4)
	move.b	#$FF,$29(a4)
	move.b	#$FF,$28(a4)
	move.b	#$FF,$2A(a4)
	move.b	#$FF,$2B(a4)
	move.l	d0,$1E(a4)
	move.l	d0,$2C(a4)
	move.b	#$7F,$30(a4)
	moveq	#$1,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	move.l	d0,-(a7)
	movea.l	(a4),a0
	move.l	$12(a0),-(a7)
	jsr	$4FD2(a5)	; -> Timer_Create
	move.l	d0,$3E(a4)
	movem.l	-$C(a6),d6-d7/a4
	unlk	a6
	rts
