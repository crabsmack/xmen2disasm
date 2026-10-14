; ---------------------------------------------------------------------------
; sub_0AB41E	[link-after-rts]
; ---------------------------------------------------------------------------
sub_0AB41E:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	tst.w	$6E(a4)
	bne.s	loc_0AB464
	move.l	a4,-(a7)
	jsr	sub_0AB370(pc)
	move.l	a4,-(a7)
	jsr	sub_0AB24E(pc)
	subq.w	#$1,$A0(a4)
	tst.w	$A0(a4)
	addq.w	#$8,a7
	bgt.s	loc_0AB464
	move.w	$A2(a4),$A0(a4)
	move.w	$A4(a4),$6E(a4)
	clr.w	$6C(a4)
	lea.l	sub_0AB46C(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_0AB464:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
