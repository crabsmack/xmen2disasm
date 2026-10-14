; ---------------------------------------------------------------------------
; sub_0E9F24	[jt 1254]
; ---------------------------------------------------------------------------
sub_0E9F24:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	tst.w	$6E(a4)
	bgt.s	loc_0E9F50
	move.l	a4,-(a7)
	jsr	sub_0E9C5E(pc)
	addq.w	#$4,a7
	move.w	#$1E,$6C(a4)
	lea.l	sub_0E9F58(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_0E9F50:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
