; ---------------------------------------------------------------------------
; sub_084EEA	[jt 595]
; ---------------------------------------------------------------------------
sub_084EEA:
	link.w	a6,#$FFFE
	movem.l	d4-d7/a3-a4,-(a7)
	movea.l	$8(a6),a4
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$56(a0),a1
	jsr	(a1)
	addq.w	#$8,a7
	tst.w	$B0(a4)
	bne.s	loc_084F50
	move.w	$AE(a4),$B0(a4)
	tst.l	$98(a4)
	bne.s	loc_084F24
	move.l	$64(a4),$5C(a4)
	clr.w	$6C(a4)
	bra.s	loc_084F50
loc_084F24:
	addq.w	#$1,$96(a4)
	movea.l	$98(a4),a0
	move.w	$96(a4),d0
	cmp.w	(a0),d0
	blt.s	loc_084F38
	clr.w	$96(a4)
loc_084F38:
	movea.l	$98(a4),a0
	addq.l	#$2,a0
	move.w	$96(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a4)
	clr.w	$6C(a4)
loc_084F50:
	movem.l	-$1A(a6),d4-d7/a3-a4
	unlk	a6
	rts
