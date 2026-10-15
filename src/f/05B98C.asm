; ---------------------------------------------------------------------------
; sub_05B98C	[link-after-rts]
; ---------------------------------------------------------------------------
sub_05B98C:
	link.w	a6,#$0
	movem.l	d3-d7/a3-a4,-(a7)
	movea.l	$8(a6),a0
	lea.l	$8C(a0),a4
	moveq	#$1,d6
	move.w	g_CameraX(a5),d0
	ext.l	d0
	move.l	d0,d4
	add.l	#$140,d4
	move.w	g_CameraY(a5),d0
	ext.l	d0
	move.l	d0,d5
	add.l	#$E0,d5
	clr.w	d7
loc_05B9BC:
	move.w	(a4),d0
	asr.w	#$2,d0
	cmp.w	g_CameraX(a5),d0
	blt.w	loc_05BA60
	move.w	(a4),d0
	asr.w	#$2,d0
	cmp.w	d0,d4
	blt.w	loc_05BA60
	move.w	$2(a4),d0
	asr.w	#$2,d0
	cmp.w	g_CameraY(a5),d0
	blt.w	loc_05BA60
	move.w	$2(a4),d0
	asr.w	#$2,d0
	cmp.w	d0,d5
	blt.s	loc_05BA60
	clr.b	d6
	tst.b	$6(a4)
	beq.s	loc_05BA60
	moveq	#$F,d0
	move.l	d0,-(a7)
	move.b	$6(a4),d1
	ext.w	d1
	ext.l	d1
	move.l	d1,-(a7)
	move.w	$2(a4),d1
	asr.w	#$2,d1
	ext.l	d1
	move.l	d1,-(a7)
	move.w	(a4),d1
	asr.w	#$2,d1
	ext.l	d1
	move.l	d1,-(a7)
	jsr	$3EF2(a5)	; -> Seg_FindAt
	movea.l	d0,a3
	move.l	a3,d0
	lea.l	$10(a7),a7
	beq.s	loc_05BA60
	tst.b	$2(a3)
	ble.s	loc_05BA32
	move.b	$2(a3),d0
	subq.b	#$1,d0
	move.b	d0,$6(a4)
	bra.s	loc_05BA3C
loc_05BA32:
	tst.b	$2(a3)
	bne.s	loc_05BA3C
	clr.b	$6(a4)
loc_05BA3C:
	dc.w	$197C,$FFEC,$0005	; insn: move.b #$ec, $5(a4)
	jsr	$417A(a5)	; -> Rand_Next
	moveq	#$0,d1
	move.w	d0,d1
	tst.l	d1
	btst	#$0,d1
	beq.s	loc_05BA5A
	move.b	#$5,$4(a4)
	bra.s	loc_05BA60
loc_05BA5A:
	dc.w	$197C,$FFFB,$0004	; insn: move.b #$fb, $4(a4)
loc_05BA60:
	move.w	d7,d0
	addq.w	#$1,d7
	addq.w	#$8,a4
	cmpi.w	#$3,d7
	blt.w	loc_05B9BC
	tst.b	d6
	beq.s	loc_05BA84
	movea.l	$8(a6),a0
	move.l	a0,-(a7)
	movea.l	(a0),a0
	movea.l	$52(a0),a1
	jsr	(a1)
	addq.w	#$4,a7
	bra.s	loc_05BAA2
loc_05BA84:
	movea.l	$8(a6),a0
	clr.w	$6C(a0)
	lea.l	sub_05B98C(pc),a0
	movea.l	$8(a6),a1
	move.l	a0,$5C(a1)
	movea.l	$8(a6),a0
	moveq	#$8,d0
	and.w	$4(a0),d0
loc_05BAA2:
	movem.l	-$1C(a6),d3-d7/a3-a4
	unlk	a6
	rts
