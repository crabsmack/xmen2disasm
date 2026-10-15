; ---------------------------------------------------------------------------
; sub_09874E	[link-after-rts]
; ---------------------------------------------------------------------------
sub_09874E:
	link.w	a6,#$0
	movem.l	d7/a4,-(a7)
	movea.l	$8(a6),a4
	move.l	$C(a4),d7
	asr.l	#$8,d7
	cmp.w	$A6(a4),d7
	bge.s	loc_098786
	move.w	#$C0,$20(a4)
	moveq	#$0,d0
	move.l	d0,$44(a4)
	clr.w	$6C(a4)
	lea.l	sub_0986E8(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_0987D8
loc_098786:
	movea.l	$A8(a4),a0
	movea.l	a0,a1
	adda.w	$4(a1),a0
	move.l	a0,-(a7)
	move.l	a4,-(a7)
	jsr	$4E4A(a5)	; -> Obj_ChangeAnim
	addq.w	#$8,a7
	tst.l	$98(a4)
	bne.s	loc_0987AC
	move.l	$64(a4),$5C(a4)
	clr.w	$6C(a4)
	bra.s	loc_0987D8
loc_0987AC:
	addq.w	#$1,$96(a4)
	movea.l	$98(a4),a0
	move.w	$96(a4),d0
	cmp.w	(a0),d0
	blt.s	loc_0987C0
	clr.w	$96(a4)
loc_0987C0:
	movea.l	$98(a4),a0
	addq.l	#$2,a0
	move.w	$96(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a4)
	clr.w	$6C(a4)
loc_0987D8:
	movem.l	-$8(a6),d7/a4
	unlk	a6
	rts
