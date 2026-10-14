; ---------------------------------------------------------------------------
; sub_06DDE0	[link-after-rts]
; ---------------------------------------------------------------------------
sub_06DDE0:
	link.w	a6,#$0
	movem.l	d7/a4,-(a7)
	movea.l	$8(a6),a4
	subq.w	#$1,$B4(a4)
	bne.s	loc_06DE18
	moveq	#$3,d0
	and.b	$2E(a4),d0
	moveq	#$0,d1
	move.b	d0,d1
	moveq	#$2,d0
	eor.b	d0,d1
	move.w	d1,d7
	moveq	#-$4,d0
	and.b	$2E(a4),d0
	ext.w	d0
	move.w	d7,d1
	or.w	d0,d1
	move.b	d1,$2E(a4)
	move.w	#$4,$B4(a4)
loc_06DE18:
	tst.w	$6E(a4)
	bne.s	loc_06DE30
	clr.w	$6C(a4)
	lea.l	sub_06DE3A(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_06DE30:
	movem.l	-$8(a6),d7/a4
	unlk	a6
	rts
