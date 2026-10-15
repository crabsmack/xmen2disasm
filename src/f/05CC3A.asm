; ---------------------------------------------------------------------------
; sub_05CC3A	[link-after-rts]
; ---------------------------------------------------------------------------
sub_05CC3A:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	tst.w	$6E(a4)
	bgt.s	loc_05CC64
	moveq	#-$4,d0
	and.b	$2E(a4),d0
	moveq	#$3,d1
	or.b	d0,d1
	move.b	d1,$2E(a4)
	lea.l	sub_05C92A(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$0,d0
	bra.s	loc_05CC8A
loc_05CC64:
	moveq	#$2,d0
	and.l	g_FrameCounter(a5),d0
	beq.s	loc_05CC7C
	moveq	#-$4,d0
	and.b	$2E(a4),d0
	moveq	#$3,d1
	or.b	d0,d1
	move.b	d1,$2E(a4)
	bra.s	loc_05CC8A
loc_05CC7C:
	moveq	#-$4,d0
	and.b	$2E(a4),d0
	moveq	#$1,d1
	or.b	d0,d1
	move.b	d1,$2E(a4)
loc_05CC8A:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
