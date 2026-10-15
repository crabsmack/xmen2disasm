; ---------------------------------------------------------------------------
; Deathbird_SetMoveMode_Case7 - Deathbird_SetMoveMode cases 7-8: enter low from a side / dive
; In:  inside Deathbird_SetMoveMode
; Out: -
; Evidence: Sw_1117A0 targets loc_111A00/loc_111A9A
; ---------------------------------------------------------------------------
Deathbird_SetMoveMode_Case7:
	clr.w	$1E(a4)
	clr.l	$16(a4)
	clr.w	$20(a4)
	moveq	#$0,d0
	move.b	$AE(a4),d0
	cmpi.w	#$1,d0
	bne.s	loc_111A46
	andi.b	#$EF,$2E(a4)
	move.w	g_CameraX(a5),d0
	ext.l	d0
	moveq	#$64,d1
	sub.l	d1,d0
	lsl.l	#$8,d0
	move.l	d0,$8(a4)
	move.w	g_CameraY(a5),d0
	ext.l	d0
	moveq	#$32,d2
	add.l	d2,d0
	lsl.l	#$8,d0
	move.l	d0,$C(a4)
	move.w	#$500,$16(a4)
	bra.s	loc_111A74
loc_111A46:
	ori.b	#$10,$2E(a4)
	move.w	g_CameraX(a5),d0
	ext.l	d0
	add.l	#$1A4,d0
	lsl.l	#$8,d0
	move.l	d0,$8(a4)
	move.w	g_CameraY(a5),d0
	ext.l	d0
	moveq	#$32,d1
	add.l	d1,d0
	lsl.l	#$8,d0
	move.l	d0,$C(a4)
	move.w	#$FB00,$16(a4)
loc_111A74:
	move.w	#$264,$18(a4)
	move.w	#$FFF6,$20(a4)
	move.b	#$3,$AE(a4)
	lea.l	$2AE2(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E4A(a5)	; -> Obj_ChangeAnim
	addq.w	#$8,a7
	bra.w	$111BA0
loc_111A9A:
	move.w	#$FFD8,$20(a4)
	move.b	#$3,$AE(a4)
	lea.l	$2ACA(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E4A(a5)	; -> Obj_ChangeAnim
	addq.w	#$8,a7
	bra.w	$111BA0
