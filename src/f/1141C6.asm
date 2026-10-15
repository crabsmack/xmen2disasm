; ---------------------------------------------------------------------------
; XNpc_DeathReact_Explode - XNpc_DeathReact cases 11/12: go to XNpc_StateExplode
; In:  inside XNpc_DeathReact
; Out: -
; Evidence: switch target
; ---------------------------------------------------------------------------
XNpc_DeathReact_Explode:
	lea.l	XNpc_StateExplode(pc),a0
	move.l	a0,$5C(a4)
	bra.w	XNpc_DeathReact_Done
loc_1141D2:
	ext.w	d5
	ext.l	d5
	move.l	d5,-(a7)
	move.l	a4,-(a7)
	jsr	XNpc_KnockbackDist(pc)
	ext.l	d0
	move.l	d0,d6
	lsl.l	#$1,d6
	move.l	$8(a4),d0
	asr.l	#$8,d0
	ext.l	d6
	move.l	d0,d4
	sub.l	d6,d4
	pea.l	-$1(a6)
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$7A(a0),a1
	jsr	(a1)
	move.w	d0,d7
	moveq	#$2,d0
	cmp.b	-$1(a6),d0
	lea.l	$14(a7),a7
	beq.s	loc_114214
	cmp.w	d7,d4
	blt.s	loc_114228
loc_114214:
	lea.l	XNpc_StateDeathFling(pc),a0
	move.l	a0,$5C(a4)
	ext.l	d6
	move.l	d6,d0
	neg.l	d0
	move.b	d0,$91(a4)
	bra.s	loc_11424E
loc_114228:
	move.l	$8(a4),d0
	asr.l	#$8,d0
	move.b	d7,d1
	sub.b	d0,d1
	move.b	d1,$91(a4)
	tst.b	-$1(a6)
	bne.s	loc_114246
	lea.l	XNpc_StateDeathFling(pc),a0
	move.l	a0,$5C(a4)
	bra.s	loc_11424E
loc_114246:
	lea.l	XNpc_StateDeathFlingHigh(pc),a0
	move.l	a0,$5C(a4)
loc_11424E:
	andi.b	#$EF,$2E(a4)
	bra.s	XNpc_DeathReact_Done
loc_114256:
	ext.w	d5
	ext.l	d5
	move.l	d5,-(a7)
	move.l	a4,-(a7)
	jsr	XNpc_KnockbackDist(pc)
	ext.l	d0
	move.l	d0,d6
	lsl.l	#$1,d6
	move.l	$8(a4),d0
	asr.l	#$8,d0
	ext.l	d6
	move.l	d0,d5
	add.l	d6,d5
	pea.l	-$1(a6)
	moveq	#$1,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$7A(a0),a1
	jsr	(a1)
	move.w	d0,d7
	moveq	#$2,d0
	cmp.b	-$1(a6),d0
	lea.l	$14(a7),a7
	beq.s	loc_114298
	cmp.w	d7,d5
	bgt.s	loc_1142A6
loc_114298:
	lea.l	XNpc_StateDeathFling(pc),a0
	move.l	a0,$5C(a4)
	move.b	d6,$91(a4)
	bra.s	loc_1142CC
loc_1142A6:
	move.l	$8(a4),d0
	asr.l	#$8,d0
	move.b	d7,d1
	sub.b	d0,d1
	move.b	d1,$91(a4)
	tst.b	-$1(a6)
	bne.s	loc_1142C4
	lea.l	XNpc_StateDeathFling(pc),a0
	move.l	a0,$5C(a4)
	bra.s	loc_1142CC
loc_1142C4:
	lea.l	XNpc_StateDeathFlingHigh(pc),a0
	move.l	a0,$5C(a4)
loc_1142CC:
	ori.b	#$10,$2E(a4)
