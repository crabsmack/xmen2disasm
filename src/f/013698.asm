; ---------------------------------------------------------------------------
; CapedAcolyte_OnDeath	[jt 67]
; ---------------------------------------------------------------------------
CapedAcolyte_OnDeath:
	link.w	a6,#$0
	movem.l	d7/a4,-(a7)
	move.b	$13(a6),d7
	movea.l	$8(a6),a4
	cmpi.b	#$D,d7
	beq.s	loc_0136BA
	cmpi.b	#$E,d7
	beq.s	loc_0136BA
	cmpi.b	#$F,d7
	bne.s	loc_0136C8
loc_0136BA:
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$52(a0),a1
	jsr	(a1)
	addq.w	#$4,a7
	bra.s	loc_0136E6
loc_0136C8:
	ext.w	d7
	ext.l	d7
	move.l	d7,-(a7)
	move.b	$F(a6),d0
	ext.w	d0
	ext.l	d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$6E(a0),a1
	jsr	(a1)
	lea.l	$C(a7),a7
loc_0136E6:
	movem.l	-$8(a6),d7/a4
	unlk	a6
	rts
