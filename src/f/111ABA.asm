; ---------------------------------------------------------------------------
; Deathbird_SetMoveMode_Case9 - Deathbird_SetMoveMode case 9: head for the elevator switch
; In:  inside Deathbird_SetMoveMode
; Out: -
; Evidence: Sw_1117A0 target; set by Deathbird_StateChooseAttack
; ---------------------------------------------------------------------------
Deathbird_SetMoveMode_Case9:
	clr.w	$1E(a4)
	clr.l	$16(a4)
	clr.w	$20(a4)
	moveq	#$0,d0
	move.b	$AE(a4),d0
	cmpi.w	#$1,d0
	bne.s	loc_111B00
	andi.b	#$EF,$2E(a4)
	move.w	g_CameraX(a5),d0
	ext.l	d0
	moveq	#$64,d1
	sub.l	d1,d0
	lsl.l	#$8,d0
	move.l	d0,$8(a4)
	move.w	g_CameraY(a5),d0
	ext.l	d0
	moveq	#$3C,d2
	add.l	d2,d0
	lsl.l	#$8,d0
	move.l	d0,$C(a4)
	move.w	#$500,$16(a4)
	bra.s	loc_111B2E
loc_111B00:
	ori.b	#$10,$2E(a4)
	move.w	g_CameraX(a5),d0
	ext.l	d0
	add.l	#$1A4,d0
	lsl.l	#$8,d0
	move.l	d0,$8(a4)
	move.w	g_CameraY(a5),d0
	ext.l	d0
	moveq	#$3C,d1
	add.l	d1,d0
	lsl.l	#$8,d0
	move.l	d0,$C(a4)
	move.w	#$FB00,$16(a4)
loc_111B2E:
	move.w	#$270,$18(a4)
	clr.w	$20(a4)
	move.b	#$3,$AE(a4)
	lea.l	$2ACA(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E4A(a5)	; -> Obj_ChangeAnim
	addq.w	#$8,a7
	bra.s	$111BA0
