; ---------------------------------------------------------------------------
; EvilDrop_StateFall - EVILDROP state: fall to the floor (+$C2), bounce at half speed
; In:  8(a6) = this
; Out: d0
; Evidence: y >= floor: y = floor, vy = -vy/2; next EvilDrop_StateBounce1
; Found: link-after-rts
; ---------------------------------------------------------------------------
EvilDrop_StateFall:
	link.w	a6,#$0
	movem.l	d7/a4,-(a7)
	movea.l	$8(a6),a4
	move.l	$C(a4),d7
	asr.l	#$8,d7
	cmp.w	$C2(a4),d7
	blt.s	loc_094F96
	move.w	$C2(a4),d0
	ext.l	d0
	lsl.l	#$8,d0
	move.l	d0,$C(a4)
	move.w	$18(a4),d0
	asr.w	#$1,d0
	ext.l	d0
	neg.l	d0
	move.w	d0,$18(a4)
	clr.w	$6C(a4)
	lea.l	EvilDrop_StateBounce1(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_094FA8
loc_094F96:
	clr.w	$6C(a4)
	lea.l	EvilDrop_StateFall(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_094FA8:
	movem.l	-$8(a6),d7/a4
	unlk	a6
	rts
