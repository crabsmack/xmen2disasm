; ---------------------------------------------------------------------------
; sub_02D658	[link-after-rts]
; ---------------------------------------------------------------------------
sub_02D658:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	pea.l	-$1652(a5)
	move.l	a4,-(a7)
	jsr	$4062(a5)	; -> HitList_Add
	move.l	d0,$84(a4)
	move.b	#$5A,$AB(a4)
	ori.b	#$C,$AC(a4)
	clr.l	$98(a4)
	move.b	#$5,$9C(a4)
	move.b	#$A,$9D(a4)
	move.b	#$8,$9E(a4)
	move.b	#$8,$9F(a4)
	moveq	#$0,d0
	move.b	$AB(a4),d0
	cmpi.w	#$FFFF,d0
	addq.w	#$8,a7
	bne.s	loc_02D6B8
	lea.l	sub_02D6D8(pc),a0
	move.l	a0,$5C(a4)
	move.l	a4,-(a7)
	jsr	sub_02D6D8(pc)
	addq.w	#$4,a7
	bra.s	loc_02D6D0
loc_02D6B8:
	moveq	#$0,d0
	move.b	$AB(a4),d0
	move.w	d0,$6C(a4)
	lea.l	sub_02D6D8(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_02D6D0:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
