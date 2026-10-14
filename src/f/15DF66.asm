; ---------------------------------------------------------------------------
; sub_15DF66	[jt 2057]
; ---------------------------------------------------------------------------
sub_15DF66:
	link.w	a6,#$0
	movem.l	a3-a4,-(a7)
	movea.l	$C(a6),a3
	movea.l	$8(a6),a4
	move.l	a4,d0
	beq.s	loc_15DF9E
	tst.l	$4(a4)
	beq.s	loc_15DF86
	movea.l	$4(a4),a0
	move.l	(a4),(a0)
loc_15DF86:
	tst.l	(a4)
	beq.s	loc_15DF92
	movea.l	(a4),a0
	move.l	$4(a4),$4(a0)
loc_15DF92:
	cmpa.l	(a3),a4
	bne.s	loc_15DF98
	move.l	(a4),(a3)
loc_15DF98:
	moveq	#$0,d0
	move.l	d0,$8(a4)
loc_15DF9E:
	movem.l	-$8(a6),a3-a4
	unlk	a6
	rts
