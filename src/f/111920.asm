; ---------------------------------------------------------------------------
; Deathbird_SetMoveMode_Case5 - Deathbird_SetMoveMode cases 5-6: enter from a top corner / choose the next entry side while off screen
; In:  inside Deathbird_SetMoveMode
; Out: -
; Evidence: Sw_1117A0 targets Deathbird_SetMoveMode_Case5/loc_1119B2
; ---------------------------------------------------------------------------
Deathbird_SetMoveMode_Case5:
	clr.w	$1E(a4)
	clr.l	$16(a4)
	clr.w	$20(a4)
	moveq	#$0,d0
	move.b	$AE(a4),d0
	cmpi.w	#$1,d0
	bne.s	loc_111964
	andi.b	#$EF,$2E(a4)
	move.w	g_CameraX(a5),d0
	ext.l	d0
	moveq	#$64,d1
	sub.l	d1,d0
	lsl.l	#$8,d0
	move.l	d0,$8(a4)
	move.w	g_CameraY(a5),d0
	ext.l	d0
	sub.l	d1,d0
	lsl.l	#$8,d0
	move.l	d0,$C(a4)
	move.w	#$200,$16(a4)
	bra.s	loc_111992
loc_111964:
	ori.b	#$10,$2E(a4)
	move.w	g_CameraX(a5),d0
	ext.l	d0
	add.l	#$1A4,d0
	lsl.l	#$8,d0
	move.l	d0,$8(a4)
	move.w	g_CameraY(a5),d0
	ext.l	d0
	moveq	#$64,d1
	sub.l	d1,d0
	lsl.l	#$8,d0
	move.l	d0,$C(a4)
	move.w	#$FE00,$16(a4)
loc_111992:
	move.w	#$200,$18(a4)
	move.b	#$3,$AE(a4)
	lea.l	$2ACA(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E4A(a5)	; -> Obj_ChangeAnim
	addq.w	#$8,a7
	bra.w	$111BA0
loc_1119B2:
	clr.w	$1E(a4)
	clr.l	$16(a4)
	clr.w	$20(a4)
	move.l	$8(a4),d0
	asr.l	#$8,d0
	moveq	#$3C,d1
	add.l	d1,d0
	move.w	g_CameraX(a5),d2
	ext.l	d2
	cmp.l	d0,d2
	ble.s	loc_1119DA
	move.b	#$1,$AE(a4)
	bra.s	loc_1119E0
loc_1119DA:
	move.b	#$2,$AE(a4)
loc_1119E0:
	move.w	#$A,$6E(a4)
	moveq	#$0,d0
	move.l	d0,$44(a4)
	pea.l	($FF).w
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$56(a0),a1
	jsr	(a1)
	addq.w	#$8,a7
	bra.w	$111BA0
