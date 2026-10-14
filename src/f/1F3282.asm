; ---------------------------------------------------------------------------
; sub_1F3282	[link-after-rts]
; ---------------------------------------------------------------------------
sub_1F3282:
	link.w	a6,#$0
	movem.l	d7/a4,-(a7)
	move.w	$12(a6),d7
	movea.l	$8(a6),a4
	tst.b	$17(a6)
	beq.s	loc_1F329E
	ext.l	d7
	move.l	d7,d0
	bra.s	loc_1F32A4
loc_1F329E:
	ext.l	d7
	move.l	d7,d0
	neg.l	d0
loc_1F32A4:
	move.w	d0,$1E(a4)
	move.w	$E(a6),$22(a4)
	tst.w	$16(a4)
	bge.s	loc_1F32BA
	ori.b	#$10,$2E(a4)
loc_1F32BA:
	tst.w	$16(a4)
	ble.s	loc_1F32C6
	andi.b	#$EF,$2E(a4)
loc_1F32C6:
	movem.l	-$8(a6),d7/a4
	unlk	a6
	rts
