; ---------------------------------------------------------------------------
; sub_0115EA	[jt 44]
; ---------------------------------------------------------------------------
sub_0115EA:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	moveq	#$1,d0
	cmp.w	$A0(a4),d0
	bne.s	loc_011610
	clr.w	$6C(a4)
	lea.l	sub_011452(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_011634
loc_011610:
	move.w	#$1,$A0(a4)
	pea.l	($412).w
	move.l	a4,-(a7)
	jsr	sub_0108CE(pc)
	addq.w	#$8,a7
	clr.w	$6C(a4)
	lea.l	sub_0113A6(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_011634:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
