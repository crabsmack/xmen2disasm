; ---------------------------------------------------------------------------
; sub_097C7A	[jt 761]
; ---------------------------------------------------------------------------
sub_097C7A:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	tst.w	$16(a4)
	beq.s	loc_097C9E
	clr.w	$6C(a4)
	lea.l	sub_097C7A(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_097D00
loc_097C9E:
	clr.w	$1E(a4)
	clr.l	$16(a4)
	clr.w	$20(a4)
	movea.l	$A8(a4),a0
	movea.l	a0,a1
	adda.w	$4(a1),a0
	move.l	a0,-(a7)
	move.l	a4,-(a7)
	jsr	$4E4A(a5)	; -> sub_1F6296
	tst.l	$98(a4)
	addq.w	#$8,a7
	bne.s	loc_097CD2
	move.l	$64(a4),$5C(a4)
	move.w	#$A,$6C(a4)
	bra.s	loc_097D00
loc_097CD2:
	addq.w	#$1,$96(a4)
	movea.l	$98(a4),a0
	move.w	$96(a4),d0
	cmp.w	(a0),d0
	blt.s	loc_097CE6
	clr.w	$96(a4)
loc_097CE6:
	movea.l	$98(a4),a0
	addq.l	#$2,a0
	move.w	$96(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a4)
	move.w	#$A,$6C(a4)
loc_097D00:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
