; ---------------------------------------------------------------------------
; sub_0BE656	[jt 1053]
; ---------------------------------------------------------------------------
sub_0BE656:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.l	a4,-(a7)
	lea.l	$211A(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$76(a0),a1
	jsr	(a1)
	move.w	#$5000,d0
	and.w	$96(a4),d0
	or.w	d0,$6(a4)
	tst.b	$BF(a4)
	beq.s	loc_0BE69C
	lea.l	sub_0BDC9A(pc),a0
	move.l	a0,$5C(a4)
	move.w	#$5,$6C(a4)
	clr.w	$1E(a4)
	clr.w	$16(a4)
loc_0BE69C:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
