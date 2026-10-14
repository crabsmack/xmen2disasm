; ---------------------------------------------------------------------------
; sub_0BC44C	[jt 1013]
; ---------------------------------------------------------------------------
sub_0BC44C:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	tst.l	$98(a4)
	bne.s	loc_0BC46A
	move.l	$64(a4),$5C(a4)
	move.w	#$5,$6C(a4)
	bra.s	loc_0BC498
loc_0BC46A:
	addq.w	#$1,$96(a4)
	movea.l	$98(a4),a0
	move.w	$96(a4),d0
	cmp.w	(a0),d0
	blt.s	loc_0BC47E
	clr.w	$96(a4)
loc_0BC47E:
	movea.l	$98(a4),a0
	addq.l	#$2,a0
	move.w	$96(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a4)
	move.w	#$5,$6C(a4)
loc_0BC498:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
