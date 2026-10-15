; ---------------------------------------------------------------------------
; PortraitActor_StateFlyIn - portrait: one step of the fly-in; after 8 steps land
; In:  8(a6) = this
; Out: d0 = +4 & 8
; Evidence: Cerebro_BigSpriteDecode; next PortraitActor_StateLanded
; ---------------------------------------------------------------------------
PortraitActor_StateFlyIn:
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
	subq.w	#$1,$98(a4)
	addq.w	#$4,a7
	beq.s	loc_067CA8
	clr.w	$6C(a4)
	lea.l	PortraitActor_StateFlyIn(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_067CBA
loc_067CA8:
	clr.w	$6C(a4)
	lea.l	PortraitActor_StateLanded(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_067CBA:
	movem.l	-$C(a6),a3-a4
	unlk	a6
	rts
