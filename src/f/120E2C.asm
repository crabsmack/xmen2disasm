; ---------------------------------------------------------------------------
; sub_120E2C	[link-after-rts]
; ---------------------------------------------------------------------------
sub_120E2C:
	link.w	a6,#$0
	movem.l	d4-d7/a3-a4,-(a7)
	movea.l	$8(a6),a4
	move.b	$F(a6),d0
	addq.b	#$1,d0
	beq.s	loc_120E4A
	subq.b	#$1,d0
	beq.s	loc_120E60
	subq.b	#$1,d0
	beq.s	loc_120E74
	bra.s	loc_120E74
loc_120E4A:
	move.l	#$3400,d7
	move.l	#$FFFFB200,d5
	move.w	#$258,d6
	move.w	#$FF4C,d4
	bra.s	loc_120E88
loc_120E60:
	move.l	#$3A00,d7
	move.l	#$FFFFCD00,d5
	move.w	#$3C0,d6
	clr.w	d4
	bra.s	loc_120E88
loc_120E74:
	move.l	#$3000,d7
	move.l	#$FFFFD500,d5
	move.w	#$258,d6
	move.w	#$B4,d4
loc_120E88:
	moveq	#$10,d0
	and.b	$2E(a4),d0
	beq.s	loc_120E9E
	move.l	d7,d0
	neg.l	d0
	move.l	d0,d7
	ext.l	d6
	move.l	d6,d0
	neg.l	d0
	move.w	d0,d6
loc_120E9E:
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	d5,d1
	add.l	$C(a4),d1
	move.l	d1,-(a7)
	move.l	d7,d1
	add.l	$8(a4),d1
	move.l	d1,-(a7)
	lea.l	$32E2(a5),a0
	move.l	$2(a0),-(a7)
	move.l	d0,-(a7)
	lea.l	$32E2(a5),a0
	movea.l	$2(a0),a0
	movea.l	$E(a0),a1
	jsr	(a1)
	movea.l	d0,a3
	move.l	a3,d0
	lea.l	$14(a7),a7
	beq.s	loc_120EF6
	moveq	#$4,d0
	and.b	$2E(a4),d0
	moveq	#$0,d1
	move.b	d0,d1
	move.l	d1,-(a7)
	ext.l	d4
	move.l	d4,-(a7)
	ext.l	d6
	move.l	d6,-(a7)
	move.l	a3,-(a7)
	jsr	$32D2(a5)	; -> BioBullet_SetVelocity
	subq.w	#$1,$A2(a4)
	lea.l	$10(a7),a7
loc_120EF6:
	movem.l	-$18(a6),d4-d7/a3-a4
	unlk	a6
	rts
