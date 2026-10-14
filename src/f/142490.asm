; ---------------------------------------------------------------------------
; sub_142490	[link-after-rts]
; ---------------------------------------------------------------------------
sub_142490:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	moveq	#$10,d0
	and.b	$2E(a4),d0
	beq.s	loc_1424A6
	moveq	#$5,d0
	bra.s	loc_1424A8
loc_1424A6:
	moveq	#$2,d0
loc_1424A8:
	move.l	d0,-(a7)
	pea.l	sub_14286A(pc)
	lea.l	$3CCA(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	sub_14241C(pc)
	lea.l	$10(a7),a7
	clr.w	$6C(a4)
	lea.l	sub_1423D6(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
