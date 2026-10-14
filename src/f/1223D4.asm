; ---------------------------------------------------------------------------
; sub_1223D4	[jt 1697]
; ---------------------------------------------------------------------------
sub_1223D4:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	tst.b	$B6(a4)
	beq.s	loc_1223EC
	andi.b	#$EF,$2E(a4)
	bra.s	loc_1223F2
loc_1223EC:
	ori.b	#$10,$2E(a4)
loc_1223F2:
	tst.l	$98(a4)
	bne.s	loc_122404
	move.l	$64(a4),$5C(a4)
	clr.w	$6C(a4)
	bra.s	loc_122430
loc_122404:
	addq.w	#$1,$96(a4)
	movea.l	$98(a4),a0
	move.w	$96(a4),d0
	cmp.w	(a0),d0
	blt.s	loc_122418
	clr.w	$96(a4)
loc_122418:
	movea.l	$98(a4),a0
	addq.l	#$2,a0
	move.w	$96(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a4)
	clr.w	$6C(a4)
loc_122430:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
