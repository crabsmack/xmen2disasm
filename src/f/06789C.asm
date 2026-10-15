; ---------------------------------------------------------------------------
; sub_06789C	[link-after-rts]
; ---------------------------------------------------------------------------
sub_06789C:
	link.w	a6,#$FFFC
	movem.l	a3-a4,-(a7)
	movea.l	$8(a6),a4
	movea.l	$8C(a4),a3
	move.l	(a3),-$4(a6)
	move.l	$1E(a3),d0
	add.l	d0,$E(a3)
	move.l	$22(a3),d0
	add.l	d0,$12(a3)
	move.l	$26(a3),d0
	add.l	d0,$16(a3)
	move.l	$2A(a3),d0
	add.l	d0,$1A(a3)
	move.l	$16(a3),d0
	swap	d0
	ext.l	d0
	movea.l	-$4(a6),a0
	move.w	d0,$10(a0)
	move.l	$1A(a3),d0
	swap	d0
	ext.l	d0
	movea.l	-$4(a6),a0
	move.w	d0,$12(a0)
	move.l	a3,-(a7)
	jsr	Cerebro_BigSpriteDecode(pc)
	move.b	#$1,$32(a3)
	subq.w	#$1,$98(a4)
	addq.w	#$4,a7
	beq.s	loc_067918
	clr.w	$6C(a4)
	lea.l	sub_06789C(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_06792C
loc_067918:
	move.w	#$4,$6C(a4)
	lea.l	sub_067936(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_06792C:
	movem.l	-$C(a6),a3-a4
	unlk	a6
	rts
