; ---------------------------------------------------------------------------
; EvilDrop_StateBounce1 - EVILDROP state: second fall, bounce at a quarter speed
; In:  8(a6) = this
; Out: d0
; Evidence: vy = -vy/4; next EvilDrop_StateBounce2
; Found: link-after-rts
; ---------------------------------------------------------------------------
EvilDrop_StateBounce1:
	link.w	a6,#$0
	movem.l	d7/a4,-(a7)
	movea.l	$8(a6),a4
	move.l	$C(a4),d7
	asr.l	#$8,d7
	cmp.w	$C2(a4),d7
	blt.s	loc_094FF8
	move.w	$C2(a4),d0
	ext.l	d0
	lsl.l	#$8,d0
	move.l	d0,$C(a4)
	move.w	$18(a4),d0
	asr.w	#$2,d0
	ext.l	d0
	neg.l	d0
	move.w	d0,$18(a4)
	clr.w	$6C(a4)
	lea.l	EvilDrop_StateBounce2(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_09500A
loc_094FF8:
	clr.w	$6C(a4)
	lea.l	EvilDrop_StateBounce1(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_09500A:
	movem.l	-$8(a6),d7/a4
	unlk	a6
	rts
