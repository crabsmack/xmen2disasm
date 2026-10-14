; ---------------------------------------------------------------------------
; sub_0185BE	[link-after-rts]
; ---------------------------------------------------------------------------
sub_0185BE:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	tst.w	$A2(a4)
	bgt.s	loc_01860E
	tst.l	$98(a4)
	bne.s	loc_0185E0
	move.l	$64(a4),$5C(a4)
	clr.w	$6C(a4)
	bra.s	loc_01863C
loc_0185E0:
	addq.w	#$1,$96(a4)
	movea.l	$98(a4),a0
	move.w	$96(a4),d0
	cmp.w	(a0),d0
	blt.s	loc_0185F4
	clr.w	$96(a4)
loc_0185F4:
	movea.l	$98(a4),a0
	addq.l	#$2,a0
	move.w	$96(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a4)
	clr.w	$6C(a4)
	bra.s	loc_01863C
loc_01860E:
	moveq	#-$1,d0
	cmp.w	$A6(a4),d0
	bne.s	loc_018628
	lea.l	sub_0184CE(pc),a0
	move.l	a0,$5C(a4)
	move.l	a4,-(a7)
	jsr	sub_0184CE(pc)
	addq.w	#$4,a7
	bra.s	loc_01863C
loc_018628:
	move.w	$A6(a4),$6C(a4)
	lea.l	sub_0184CE(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_01863C:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
