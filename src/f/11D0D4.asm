; ---------------------------------------------------------------------------
; sub_11D0D4	[jt 1586]
; ---------------------------------------------------------------------------
sub_11D0D4:
	link.w	a6,#$0
	movem.l	d3/d7/a4,-(a7)
	movea.l	$8(a6),a4
	move.l	$9C(a4),d7
	asr.l	#$8,d7
	move.w	$AC(a4),d0
	cmp.w	$AE(a4),d0
	bne.s	loc_11D0FE
	clr.w	$1E(a4)
	clr.l	$16(a4)
	clr.w	$20(a4)
	bra.s	loc_11D168
loc_11D0FE:
	clr.w	$18(a4)
	clr.w	$20(a4)
	cmp.w	$AC(a4),d7
	bne.s	loc_11D13A
	andi.b	#$EF,$2E(a4)
	addi.l	#$100,$9C(a4)
	tst.w	$B4(a4)
	sge.b	d3
	neg.b	d3
	beq.s	loc_11D12C
	move.w	$B4(a4),d0
	ext.l	d0
	bra.s	loc_11D134
loc_11D12C:
	move.w	$B4(a4),d0
	ext.l	d0
	neg.l	d0
loc_11D134:
	move.w	d0,$16(a4)
	bra.s	loc_11D168
loc_11D13A:
	ori.b	#$10,$2E(a4)
	subi.l	#$100,$9C(a4)
	tst.w	$B4(a4)
	sge.b	d3
	neg.b	d3
	beq.s	loc_11D15A
	move.w	$B4(a4),d0
	ext.l	d0
	bra.s	loc_11D162
loc_11D15A:
	move.w	$B4(a4),d0
	ext.l	d0
	neg.l	d0
loc_11D162:
	neg.l	d0
	move.w	d0,$16(a4)
loc_11D168:
	clr.w	$6C(a4)
	lea.l	sub_11CFE8(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movem.l	-$C(a6),d3/d7/a4
	unlk	a6
	rts
