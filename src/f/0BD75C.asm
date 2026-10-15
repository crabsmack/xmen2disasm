; ---------------------------------------------------------------------------
; Barbarian_TargetClose - BARBARIAN: is the target (+$A2) within $32 px horizontally
; In:  8(a6) = this
; Out: d0.b
; Evidence: caller Barbarian_StateApproach
; Found: link-after-rts
; ---------------------------------------------------------------------------
Barbarian_TargetClose:
	link.w	a6,#$0
	movem.l	d3/d7/a4,-(a7)
	movea.l	$8(a6),a4
	movea.l	$A2(a4),a0
	move.l	$8(a0),d7
	sub.l	$8(a4),d7
	tst.l	d7
	sge.b	d3
	neg.b	d3
	beq.s	loc_0BD780
	move.l	d7,d0
	bra.s	loc_0BD784
loc_0BD780:
	move.l	d7,d0
	neg.l	d0
loc_0BD784:
	cmpi.l	#$3200,d0
	slt.b	d3
	neg.b	d3
	move.b	d3,d0
	movem.l	-$C(a6),d3/d7/a4
	unlk	a6
	rts
