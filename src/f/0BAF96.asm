; ---------------------------------------------------------------------------
; sub_0BAF96	[jt 993]
; ---------------------------------------------------------------------------
sub_0BAF96:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	clr.w	$1E(a4)
	clr.l	$16(a4)
	clr.w	$20(a4)
	tst.w	$AE(a4)
	bgt.s	loc_0BAFD8
	lea.l	$1E12(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> sub_1F626A
	addq.w	#$8,a7
	move.w	#$FF,$6C(a4)
	lea.l	sub_0BAFF4(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_0BAFEC
loc_0BAFD8:
	move.w	#$10,$6C(a4)
	lea.l	sub_0BB0D6(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_0BAFEC:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
