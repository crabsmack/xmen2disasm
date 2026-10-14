; ---------------------------------------------------------------------------
; sub_09B50C	[link-after-rts]
; ---------------------------------------------------------------------------
sub_09B50C:
	link.w	a6,#$0
	movem.l	d3/a4,-(a7)
	movea.l	$8(a6),a4
	tst.w	$16(a4)
	sgt.b	d3
	neg.b	d3
	beq.s	loc_09B52A
	move.l	#$340,d0
	bra.s	loc_09B530
loc_09B52A:
	move.l	#$FFFFFCC0,d0
loc_09B530:
	move.w	d0,$16(a4)
	move.b	#$1,$90(a4)
	move.w	#$50,$6E(a4)
	clr.w	$6C(a4)
	lea.l	sub_09B4BC(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movem.l	-$8(a6),d3/a4
	unlk	a6
	rts
