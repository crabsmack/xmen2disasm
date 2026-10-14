; ---------------------------------------------------------------------------
; sub_114B90	[link-after-rts]
; ---------------------------------------------------------------------------
sub_114B90:
	link.w	a6,#$0
	movem.l	d6-d7/a4,-(a7)
	movea.l	$8(a6),a4
	moveq	#$0,d0
	move.w	$94(a4),d0
	move.w	#$3FFF,d7
	and.w	d0,d7
	moveq	#$3,d6
	and.w	d7,d6
	cmpi.w	#$2,d6
	bne.s	loc_114BBC
	addi.l	#$400,$8(a4)
	bra.s	loc_114BC8
loc_114BBC:
	tst.w	d6
	bne.s	loc_114BC8
	subi.l	#$400,$8(a4)
loc_114BC8:
	sub.w	$E(a6),d7
	moveq	#$0,d0
	move.w	$94(a4),d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	ext.l	d7
	move.l	d7,d1
	or.l	d0,d1
	move.w	d1,$94(a4)
	moveq	#$0,d0
	move.w	$94(a4),d0
	move.w	#$3FFF,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	moveq	#$2,d1
	and.w	d0,d1
	beq.s	loc_114C26
	moveq	#$E,d0
	move.w	$94(a4),d1
	lsr.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	move.l	d0,d7
	addq.l	#$2,d7
	cmpi.w	#$3,d7
	ble.s	loc_114C14
	subq.w	#$4,d7
loc_114C14:
	moveq	#-$4,d0
	and.b	$2E(a4),d0
	ext.w	d0
	move.w	d7,d1
	or.w	d0,d1
	move.b	d1,$2E(a4)
	bra.s	loc_114C42
loc_114C26:
	moveq	#-$4,d0
	and.b	$2E(a4),d0
	ext.w	d0
	ext.l	d0
	moveq	#$E,d1
	move.w	$94(a4),d2
	lsr.w	d1,d2
	moveq	#$0,d1
	move.w	d2,d1
	or.l	d0,d1
	move.b	d1,$2E(a4)
loc_114C42:
	movem.l	-$C(a6),d6-d7/a4
	unlk	a6
	rts
