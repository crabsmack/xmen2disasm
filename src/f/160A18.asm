; ---------------------------------------------------------------------------
; sub_160A18	[jt 2101]
; ---------------------------------------------------------------------------
sub_160A18:
	link.w	a6,#$0
	movem.l	d3/a4,-(a7)
	movea.l	$8(a6),a4
	lea.l	sub_16136E(pc),a0
	move.l	a0,$8(a4)
	lea.l	sub_160B0E(pc),a0
	move.l	a0,$10(a4)
	move.w	$E(a6),$3C(a4)
	move.w	$12(a6),$40(a4)
	move.w	$16(a6),$3E(a4)
	move.w	$1A(a6),$42(a4)
	move.w	#$40,$62(a4)
	move.w	#$E0,$64(a4)
	move.w	-$1754(a5),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	seq.b	d3
	neg.b	d3
	beq.s	loc_160A7C
	lea.l	g_Player1(a5),a0
	move.l	a0,d0
	bra.s	loc_160AA2
loc_160A7C:
	move.w	-$1844(a5),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	seq.b	d3
	neg.b	d3
	beq.s	loc_160AA0
	lea.l	g_Player2(a5),a0
	move.l	a0,d0
	bra.s	loc_160AA2
loc_160AA0:
	moveq	#$0,d0
loc_160AA2:
	move.l	d0,$24(a4)
	beq.s	loc_160AC0
	movea.l	$24(a4),a0
	move.l	$8(a0),d0
	asr.l	#$8,d0
	move.w	d0,$28(a4)
	move.l	$C(a0),d0
	asr.l	#$8,d0
	move.w	d0,$2A(a4)
loc_160AC0:
	movem.l	-$8(a6),d3/a4
	unlk	a6
	rts
