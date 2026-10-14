; ---------------------------------------------------------------------------
; sub_03A01C	[link-after-rts]
; ---------------------------------------------------------------------------
sub_03A01C:
	link.w	a6,#$0
	movem.l	d3/a4,-(a7)
	movea.l	$8(a6),a4
	move.w	$12(a4),d0
	ext.l	d0
	lsl.l	#$8,d0
	move.l	d0,$C(a4)
	andi.w	#$EFFF,$6(a4)
	moveq	#$0,d0
	move.b	$2F(a4),d0
	tst.l	d0
	seq.b	d3
	neg.b	d3
	lea.l	sub_03A05A(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$0,d0
	movem.l	-$8(a6),d3/a4
	unlk	a6
	rts
