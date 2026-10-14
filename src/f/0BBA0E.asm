; ---------------------------------------------------------------------------
; sub_0BBA0E	[link-after-rts]
; ---------------------------------------------------------------------------
sub_0BBA0E:
	link.w	a6,#$0
	movem.l	d7/a4,-(a7)
	movea.l	$8(a6),a4
	move.l	$8(a4),d7
	asr.l	#$8,d7
	cmp.w	$9E(a4),d7
	beq.s	loc_0BBA2C
	cmp.w	$A0(a4),d7
	bne.s	loc_0BBA78
loc_0BBA2C:
	clr.w	$1E(a4)
	clr.l	$16(a4)
	clr.w	$20(a4)
	tst.l	$98(a4)
	bne.s	loc_0BBA4A
	move.l	$64(a4),$5C(a4)
	clr.w	$6C(a4)
	bra.s	loc_0BBA8A
loc_0BBA4A:
	addq.w	#$1,$96(a4)
	movea.l	$98(a4),a0
	move.w	$96(a4),d0
	cmp.w	(a0),d0
	blt.s	loc_0BBA5E
	clr.w	$96(a4)
loc_0BBA5E:
	movea.l	$98(a4),a0
	addq.l	#$2,a0
	move.w	$96(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a4)
	clr.w	$6C(a4)
	bra.s	loc_0BBA8A
loc_0BBA78:
	clr.w	$6C(a4)
	lea.l	sub_0BBA0E(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_0BBA8A:
	movem.l	-$8(a6),d7/a4
	unlk	a6
	rts
