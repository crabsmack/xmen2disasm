; ---------------------------------------------------------------------------
; sub_0EA1EE	[link-after-rts]
; ---------------------------------------------------------------------------
sub_0EA1EE:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	moveq	#$0,d0
	move.l	d0,-(a7)
	jsr	sub_0E9A5C(pc)
	tst.l	$8E(a4)
	addq.w	#$4,a7
	bne.s	loc_0EA216
	move.l	$64(a4),$5C(a4)
	move.w	#$A,$6C(a4)
	bra.s	loc_0EA244
loc_0EA216:
	addq.w	#$1,$8C(a4)
	movea.l	$8E(a4),a0
	move.w	$8C(a4),d0
	cmp.w	(a0),d0
	blt.s	loc_0EA22A
	clr.w	$8C(a4)
loc_0EA22A:
	movea.l	$8E(a4),a0
	addq.l	#$2,a0
	move.w	$8C(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a4)
	move.w	#$A,$6C(a4)
loc_0EA244:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
