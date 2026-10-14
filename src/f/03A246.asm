; ---------------------------------------------------------------------------
; sub_03A246	[link-after-rts]
; ---------------------------------------------------------------------------
sub_03A246:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	pea.l	-$1758(a5)
	move.l	a4,-(a7)
	jsr	sub_039F80(pc)
	tst.b	d0
	addq.w	#$8,a7
	beq.s	loc_03A286
	pea.l	-$1848(a5)
	move.l	a4,-(a7)
	jsr	sub_039F80(pc)
	tst.b	d0
	addq.w	#$8,a7
	beq.s	loc_03A286
	move.w	#$4,$68(a4)
	clr.w	$6A(a4)
	lea.l	sub_03A01C(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$0,d0
	bra.s	loc_03A296
loc_03A286:
	lea.l	sub_03A246(pc),a0
	move.l	a0,$5C(a4)
	move.w	#$A,$6C(a4)
	moveq	#$0,d0
loc_03A296:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
