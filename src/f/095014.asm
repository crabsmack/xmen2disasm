; ---------------------------------------------------------------------------
; sub_095014	[link-after-rts]
; ---------------------------------------------------------------------------
sub_095014:
	link.w	a6,#$0
	movem.l	d7/a4,-(a7)
	movea.l	$8(a6),a4
	move.l	$C(a4),d7
	asr.l	#$8,d7
	cmp.w	$C2(a4),d7
	blt.s	loc_095078
	clr.w	$1E(a4)
	clr.l	$16(a4)
	clr.w	$20(a4)
	clr.b	$C4(a4)
	move.w	$C2(a4),d0
	ext.l	d0
	lsl.l	#$8,d0
	move.l	d0,$C(a4)
	tst.l	$8E(a4)
	bne.s	loc_09505A
	move.l	$64(a4),$5C(a4)
	clr.w	$6C(a4)
	bra.s	loc_09508A
loc_09505A:
	clr.w	$8C(a4)
	movea.l	$8E(a4),a0
	addq.l	#$2,a0
	move.w	$8C(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a4)
	clr.w	$6C(a4)
	bra.s	loc_09508A
loc_095078:
	clr.w	$6C(a4)
	lea.l	sub_095014(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_09508A:
	movem.l	-$8(a6),d7/a4
	unlk	a6
	rts
