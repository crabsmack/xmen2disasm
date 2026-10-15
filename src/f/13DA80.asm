; ---------------------------------------------------------------------------
; ExplodeFx_BurstUpdate - per-frame timer of a burst: move the 10 puffs, step their 7-frame animation, drop power-ups from type 2/3 puffs, free the effect when all are done
; In:  8(a6) = effect
; Out: none
; Evidence: puffs from +$E, $12 bytes each; frame advances every 6 ticks (1 or 2 per frame, g_TwoPlayerStep); after frame 6 type 2 -> SegmentPlusPowerUp_Spawn(x+16 px, y+16 px, 0), type 3 -> (..., $F0); none live -> ExplodeFx_Free
; ---------------------------------------------------------------------------
ExplodeFx_BurstUpdate:
	link.w	a6,#$0
	movem.l	d4-d7/a3-a4,-(a7)
	movea.l	$8(a6),a3
	clr.w	d4
	movea.l	a3,a4
	lea.l	$E(a4),a4
	clr.b	d5
	tst.b	$D(a3)
	ble.s	loc_13DAA0
	subq.b	#$1,$D(a3)
loc_13DAA0:
	cmpi.w	#$A,d4
	bge.w	loc_13DBC2
	tst.b	$11(a4)
	beq.w	loc_13DBB6
	move.w	$8(a4),d0
	ext.l	d0
	add.l	d0,(a4)
	move.w	$A(a4),d0
	ext.l	d0
	add.l	d0,$4(a4)
	move.w	$C(a4),d0
	add.w	d0,$8(a4)
	move.w	$E(a4),d0
	add.w	d0,$A(a4)
	tst.b	g_TwoPlayerStep(a5)
	beq.s	loc_13DAFA
	move.w	$8(a4),d0
	ext.l	d0
	add.l	d0,(a4)
	move.w	$A(a4),d0
	ext.l	d0
	add.l	d0,$4(a4)
	move.w	$C(a4),d0
	add.w	d0,$8(a4)
	move.w	$E(a4),d0
	add.w	d0,$A(a4)
loc_13DAFA:
	moveq	#$0,d0
	move.b	$10(a4),d0
	moveq	#$F,d1
	and.b	d0,d1
	moveq	#$0,d6
	move.b	d1,d6
	move.b	$10(a4),d0
	lsr.b	#$4,d0
	moveq	#$0,d7
	move.b	d0,d7
	tst.l	d7
	tst.b	g_TwoPlayerStep(a5)
	beq.s	loc_13DB1E
	moveq	#$2,d0
	bra.s	loc_13DB20
loc_13DB1E:
	moveq	#$1,d0
loc_13DB20:
	ext.w	d0
	sub.w	d0,d6
	tst.w	d6
	bgt.s	loc_13DBA6
	move.w	d7,d0
	addq.w	#$1,d7
	cmpi.w	#$6,d7
	ble.s	loc_13DB96
	moveq	#$0,d0
	move.b	$11(a4),d0
	cmpi.w	#$2,d0
	bne.s	loc_13DB62
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	$4(a4),d1
	add.l	#$1000,d1
	move.l	d1,-(a7)
	move.l	(a4),d1
	add.l	#$1000,d1
	move.l	d1,-(a7)
	jsr	$2CE2(a5)	; -> SegmentPlusPowerUp_Spawn
	lea.l	$C(a7),a7
	bra.s	loc_13DB90
loc_13DB62:
	moveq	#$0,d0
	move.b	$11(a4),d0
	cmpi.w	#$3,d0
	bne.s	loc_13DB90
	pea.l	($F0).w
	move.l	$4(a4),d0
	add.l	#$1000,d0
	move.l	d0,-(a7)
	move.l	(a4),d0
	add.l	#$1000,d0
	move.l	d0,-(a7)
	jsr	$2CE2(a5)	; -> SegmentPlusPowerUp_Spawn
	lea.l	$C(a7),a7
loc_13DB90:
	clr.b	$11(a4)
	bra.s	loc_13DBB6
loc_13DB96:
	ext.l	d7
	move.l	d7,d0
	lsl.l	#$4,d0
	moveq	#$6,d1
	or.l	d0,d1
	move.b	d1,$10(a4)
	bra.s	loc_13DBB4
loc_13DBA6:
	andi.b	#$F0,$10(a4)
	moveq	#$F,d0
	and.w	d6,d0
	or.b	d0,$10(a4)
loc_13DBB4:
	moveq	#$1,d5
loc_13DBB6:
	move.w	d4,d0
	addq.w	#$1,d4
	lea.l	$12(a4),a4
	bra.w	loc_13DAA0
loc_13DBC2:
	tst.b	d5
	bne.s	loc_13DBCE
	move.l	a3,-(a7)
	jsr	ExplodeFx_Free(pc)
	addq.w	#$4,a7
loc_13DBCE:
	movem.l	-$18(a6),d4-d7/a3-a4
	unlk	a6
	rts
