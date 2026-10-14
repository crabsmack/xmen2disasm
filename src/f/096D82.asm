; ---------------------------------------------------------------------------
; sub_096D82	[jt 746]
; ---------------------------------------------------------------------------
sub_096D82:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	tst.l	$9C(a4)
	beq.s	loc_096DAC
	move.b	#$3,$B9(a4)
	clr.w	$6C(a4)
	lea.l	sub_096DF2(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_096DEA
loc_096DAC:
	tst.l	$98(a4)
	bne.s	loc_096DBE
	move.l	$64(a4),$5C(a4)
	clr.w	$6C(a4)
	bra.s	loc_096DEA
loc_096DBE:
	addq.w	#$1,$96(a4)
	movea.l	$98(a4),a0
	move.w	$96(a4),d0
	cmp.w	(a0),d0
	blt.s	loc_096DD2
	clr.w	$96(a4)
loc_096DD2:
	movea.l	$98(a4),a0
	addq.l	#$2,a0
	move.w	$96(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a4)
	clr.w	$6C(a4)
loc_096DEA:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
