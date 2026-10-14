; ---------------------------------------------------------------------------
; sub_0113E6	[link-after-rts]
; ---------------------------------------------------------------------------
sub_0113E6:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	tst.b	$A7(a4)
	beq.s	loc_011436
	tst.l	$98(a4)
	bne.s	loc_011408
	move.l	$64(a4),$5C(a4)
	clr.w	$6C(a4)
	bra.s	loc_01144A
loc_011408:
	addq.w	#$1,$96(a4)
	movea.l	$98(a4),a0
	move.w	$96(a4),d0
	cmp.w	(a0),d0
	blt.s	loc_01141C
	clr.w	$96(a4)
loc_01141C:
	movea.l	$98(a4),a0
	addq.l	#$2,a0
	move.w	$96(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a4)
	clr.w	$6C(a4)
	bra.s	loc_01144A
loc_011436:
	move.w	#$4,$6C(a4)
	lea.l	sub_0113E6(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_01144A:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
