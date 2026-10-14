; ---------------------------------------------------------------------------
; sub_15DE1E	[jt 2054]
; ---------------------------------------------------------------------------
sub_15DE1E:
	link.w	a6,#$0
	movem.l	d7/a4,-(a7)
	movea.l	$8(a6),a4
	moveq	#$0,d0
	move.b	$3A(a4),d0
	cmpi.w	#$FF,d0
	beq.s	loc_15DE3A
	moveq	#$0,d0
	bra.s	loc_15DEA4
loc_15DE3A:
	move.w	#$1000,d0
	and.w	$6(a4),d0
	beq.s	loc_15DE48
	moveq	#$1,d0
	bra.s	loc_15DEA4
loc_15DE48:
	move.w	#$800,d0
	and.w	$6(a4),d0
	bne.s	loc_15DE76
	move.l	$8(a4),d0
	asr.l	#$8,d0
	move.w	-$348E(a5),d1
	ext.l	d1
	move.l	d0,d7
	sub.l	d1,d7
	cmp.w	-$35BA(a5),d7
	ble.s	loc_15DE6C
	moveq	#$0,d0
	bra.s	loc_15DEA4
loc_15DE6C:
	cmp.w	-$35B8(a5),d7
	bge.s	loc_15DE76
	moveq	#$0,d0
	bra.s	loc_15DEA4
loc_15DE76:
	moveq	#$20,d0
	and.w	$6(a4),d0
	bne.s	loc_15DEA2
	move.l	$C(a4),d0
	asr.l	#$8,d0
	move.w	-$3490(a5),d1
	ext.l	d1
	move.l	d0,d7
	sub.l	d1,d7
	cmp.w	-$35BE(a5),d7
	ble.s	loc_15DE98
	moveq	#$0,d0
	bra.s	loc_15DEA4
loc_15DE98:
	cmp.w	-$35BC(a5),d7
	bge.s	loc_15DEA2
	moveq	#$0,d0
	bra.s	loc_15DEA4
loc_15DEA2:
	moveq	#$1,d0
loc_15DEA4:
	movem.l	-$8(a6),d7/a4
	unlk	a6
	rts
