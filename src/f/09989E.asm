; ---------------------------------------------------------------------------
; sub_09989E	[link-after-rts]
; ---------------------------------------------------------------------------
sub_09989E:
	link.w	a6,#$0
	movem.l	d3/d6-d7,-(a7)
	clr.w	d6
	moveq	#$2A,d7
	lsl.w	#$1,d7
	cmp.w	d6,d7
	slt.b	d3
	neg.b	d3
	beq.s	loc_0998B8
	move.w	d6,d0
	bra.s	loc_0998BA
loc_0998B8:
	move.w	d7,d0
loc_0998BA:
	move.w	d0,d6
	lea.l	$1912(a5),a0
	movea.l	$2(a0),a0
	movea.l	$6(a0),a1
	jsr	(a1)
	move.w	d0,d7
	cmp.w	d6,d7
	slt.b	d3
	neg.b	d3
	beq.s	loc_0998D8
	move.w	d6,d0
	bra.s	loc_0998DA
loc_0998D8:
	move.w	d7,d0
loc_0998DA:
	move.w	d0,d6
	movem.l	-$C(a6),d3/d6-d7
	unlk	a6
	rts
