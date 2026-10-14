; ---------------------------------------------------------------------------
; sub_04BB22	[jt 337]
; ---------------------------------------------------------------------------
sub_04BB22:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	ori.w	#$1,$8C(a4)
	tst.w	$8E(a4)
	bne.s	loc_04BB7E
	andi.w	#$FFFE,$8C(a4)
	tst.l	$A4(a4)
	bne.s	loc_04BB50
	move.l	$64(a4),$5C(a4)
	clr.w	$6C(a4)
	bra.s	loc_04BB90
loc_04BB50:
	addq.w	#$1,$A2(a4)
	movea.l	$A4(a4),a0
	move.w	$A2(a4),d0
	cmp.w	(a0),d0
	blt.s	loc_04BB64
	clr.w	$A2(a4)
loc_04BB64:
	movea.l	$A4(a4),a0
	addq.l	#$2,a0
	move.w	$A2(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a4)
	clr.w	$6C(a4)
	bra.s	loc_04BB90
loc_04BB7E:
	clr.w	$6C(a4)
	lea.l	sub_04BB22(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_04BB90:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
