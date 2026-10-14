; ---------------------------------------------------------------------------
; sub_13D46A	[link-after-rts]
; ---------------------------------------------------------------------------
sub_13D46A:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.w	#$1000,d0
	and.w	$4(a4),d0
	beq.s	loc_13D484
	tst.w	$20(a4)
	bne.s	loc_13D4E4
loc_13D484:
	clr.w	$1E(a4)
	clr.l	$16(a4)
	clr.w	$20(a4)
	lea.l	$3A9A(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> sub_1F626A
	tst.l	$98(a4)
	addq.w	#$8,a7
	bne.s	loc_13D4B4
	move.l	$64(a4),$5C(a4)
	move.w	#$FF,$6C(a4)
	bra.s	loc_13D4F6
loc_13D4B4:
	addq.w	#$1,$96(a4)
	movea.l	$98(a4),a0
	move.w	$96(a4),d0
	cmp.w	(a0),d0
	blt.s	loc_13D4C8
	clr.w	$96(a4)
loc_13D4C8:
	movea.l	$98(a4),a0
	addq.l	#$2,a0
	move.w	$96(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a4)
	move.w	#$FF,$6C(a4)
	bra.s	loc_13D4F6
loc_13D4E4:
	clr.w	$6C(a4)
	lea.l	sub_13D46A(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_13D4F6:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
