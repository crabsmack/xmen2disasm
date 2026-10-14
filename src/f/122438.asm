; ---------------------------------------------------------------------------
; sub_122438	[jt 1698]
; ---------------------------------------------------------------------------
sub_122438:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	tst.b	$B6(a4)
	beq.s	loc_122450
	andi.b	#$EF,$2E(a4)
	bra.s	loc_122456
loc_122450:
	ori.b	#$10,$2E(a4)
loc_122456:
	lea.l	$3482(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E4A(a5)	; -> sub_1F6296
	tst.l	$98(a4)
	addq.w	#$8,a7
	bne.s	loc_12247A
	move.l	$64(a4),$5C(a4)
	move.w	#$5A,$6C(a4)
	bra.s	loc_1224A8
loc_12247A:
	addq.w	#$1,$96(a4)
	movea.l	$98(a4),a0
	move.w	$96(a4),d0
	cmp.w	(a0),d0
	blt.s	loc_12248E
	clr.w	$96(a4)
loc_12248E:
	movea.l	$98(a4),a0
	addq.l	#$2,a0
	move.w	$96(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a4)
	move.w	#$5A,$6C(a4)
loc_1224A8:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
