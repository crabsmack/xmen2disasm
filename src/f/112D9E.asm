; ---------------------------------------------------------------------------
; sub_112D9E	[link-after-rts]
; ---------------------------------------------------------------------------
sub_112D9E:
	link.w	a6,#$0
	movem.l	d3/a4,-(a7)
	movea.l	$8(a6),a4
	move.l	$8(a4),d0
	asr.l	#$8,d0
	sub.l	#$F0,d0
	sge.b	d3
	neg.b	d3
	beq.s	loc_112DCA
	move.l	$8(a4),d0
	asr.l	#$8,d0
	sub.l	#$F0,d0
	bra.s	loc_112DD8
loc_112DCA:
	move.l	$8(a4),d0
	asr.l	#$8,d0
	sub.l	#$F0,d0
	neg.l	d0
loc_112DD8:
	moveq	#$3C,d1
	cmp.l	d0,d1
	ble.s	loc_112E26
	move.l	$C(a4),d0
	asr.l	#$8,d0
	sub.l	#$198,d0
	sge.b	d3
	neg.b	d3
	beq.s	loc_112DFE
	move.l	$C(a4),d0
	asr.l	#$8,d0
	sub.l	#$198,d0
	bra.s	loc_112E0C
loc_112DFE:
	move.l	$C(a4),d0
	asr.l	#$8,d0
	sub.l	#$198,d0
	neg.l	d0
loc_112E0C:
	moveq	#$28,d1
	cmp.l	d0,d1
	ble.s	loc_112E26
	clr.w	$6C(a4)
	lea.l	sub_112EA4(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_112E9A
loc_112E26:
	moveq	#$10,d0
	and.b	$2E(a4),d0
	bne.s	loc_112E48
	move.l	$8(a4),d0
	asr.l	#$8,d0
	moveq	#$3C,d1
	sub.l	d1,d0
	move.w	g_CameraX(a5),d2
	ext.l	d2
	add.l	#$140,d2
	cmp.l	d0,d2
	blt.s	loc_112E64
loc_112E48:
	moveq	#$10,d0
	and.b	$2E(a4),d0
	beq.s	loc_112E88
	move.l	$8(a4),d0
	asr.l	#$8,d0
	moveq	#$3C,d1
	add.l	d1,d0
	move.w	g_CameraX(a5),d2
	ext.l	d2
	cmp.l	d0,d2
	ble.s	loc_112E88
loc_112E64:
	moveq	#$4,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$72(a0),a1
	jsr	(a1)
	addq.w	#$8,a7
	clr.w	$6C(a4)
	lea.l	sub_112C9E(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_112E9A
loc_112E88:
	clr.w	$6C(a4)
	lea.l	sub_112D9E(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_112E9A:
	movem.l	-$8(a6),d3/a4
	unlk	a6
	rts
