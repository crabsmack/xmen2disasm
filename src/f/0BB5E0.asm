; ---------------------------------------------------------------------------
; sub_0BB5E0	[link-after-rts]
; ---------------------------------------------------------------------------
sub_0BB5E0:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.w	$AE(a4),d0
	ext.l	d0
	addq.l	#$1,d0
	asl.l	#$3,d0
	add.l	$B0(a4),d0
	movea.l	d0,a0
	cmpi.w	#$3E8,(a0)
	blt.s	loc_0BB616
	move.w	#$14,$6C(a4)
	lea.l	sub_0BB698(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_0BB62C
loc_0BB616:
	addq.w	#$1,$AE(a4)
	clr.w	$6C(a4)
	lea.l	sub_0BB5E0(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_0BB62C:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
