; ---------------------------------------------------------------------------
; sub_0BB634	[link-after-rts]
; ---------------------------------------------------------------------------
sub_0BB634:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.w	$AE(a4),d0
	ext.l	d0
	subq.l	#$1,d0
	moveq	#$1,d1
	cmp.l	d0,d1
	ble.s	loc_0BB67A
	moveq	#$40,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$56(a0),a1
	jsr	(a1)
	clr.w	$AE(a4)
	moveq	#$0,d0
	move.l	d0,$B0(a4)
	addq.w	#$8,a7
	clr.w	$6C(a4)
	lea.l	sub_0BB6CE(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_0BB690
loc_0BB67A:
	subq.w	#$1,$AE(a4)
	clr.w	$6C(a4)
	lea.l	sub_0BB634(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_0BB690:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
