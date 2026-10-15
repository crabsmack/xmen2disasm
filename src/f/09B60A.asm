; ---------------------------------------------------------------------------
; BroodClaw_StateMoveToDrop - BROODCLAW state: move to x $6BE (speed $340), then drop the clone
; In:  8(a6) = this
; Out: d0
; Evidence: next BroodClaw_StateDropClone; TAS 52127-52265
; Found: link-after-rts
; ---------------------------------------------------------------------------
BroodClaw_StateMoveToDrop:
	link.w	a6,#$0
	movem.l	d3/d6-d7/a4,-(a7)
	movea.l	$8(a6),a4
	move.l	$8(a4),d6
	asr.l	#$8,d6
	move.w	#$6BE,d7
	clr.b	$90(a4)
	ext.l	d7
	ext.l	d6
	move.l	d7,d0
	sub.l	d6,d0
	sge.b	d3
	neg.b	d3
	beq.s	loc_09B63C
	ext.l	d7
	ext.l	d6
	move.l	d7,d0
	sub.l	d6,d0
	bra.s	loc_09B646
loc_09B63C:
	ext.l	d7
	ext.l	d6
	move.l	d7,d0
	sub.l	d6,d0
	neg.l	d0
loc_09B646:
	moveq	#$5,d1
	cmp.l	d0,d1
	blt.s	loc_09B66C
	clr.w	$1E(a4)
	clr.l	$16(a4)
	clr.w	$20(a4)
	clr.w	$6C(a4)
	lea.l	BroodClaw_StateDropClone(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_09B698
loc_09B66C:
	cmp.w	d6,d7
	slt.b	d3
	neg.b	d3
	beq.s	loc_09B67C
	move.l	#$FFFFFCC0,d0
	bra.s	loc_09B682
loc_09B67C:
	move.l	#$340,d0
loc_09B682:
	move.w	d0,$16(a4)
	clr.w	$6C(a4)
	lea.l	BroodClaw_StateMoveToDrop(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_09B698:
	movem.l	-$10(a6),d3/d6-d7/a4
	unlk	a6
	rts
