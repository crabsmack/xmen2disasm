; ---------------------------------------------------------------------------
; sub_0993DC	[link-after-rts]
; ---------------------------------------------------------------------------
sub_0993DC:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	tst.b	$B0(a4)
	beq.s	loc_09945E
	clr.b	$B0(a4)
	move.w	-$1754(a5),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	bne.s	loc_099410
	andi.l	#$FFDFFFFF,-$16C8(a5)
loc_099410:
	move.w	-$1844(a5),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	bne.s	loc_099430
	andi.l	#$FFDFFFFF,-$17B8(a5)
loc_099430:
	move.b	#$1,-$3894(a5)
	movea.l	-$35B6(a5),a0
	moveq	#$0,d0
	move.l	d0,$1C(a0)
	move.l	-$35B6(a5),-(a7)
	jsr	sub_099BF0(pc)
	andi.w	#$FFFE,-$3B08(a5)
	moveq	#$0,d0
	move.l	d0,-$3B30(a5)
	jsr	sub_09989E(pc)
	move.w	d0,-$3B04(a5)
	addq.w	#$4,a7
loc_09945E:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
