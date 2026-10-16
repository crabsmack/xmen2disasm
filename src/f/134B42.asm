; ---------------------------------------------------------------------------
; FlyBrood_Init_Case4 - FlyBrood_Init spawn types 4-7: swooping flyer entering from the farther side, homing mover
; In:  inside FlyBrood_Init
; Out: -
; Evidence: Sw_134934 targets; FlyBrood_EnterFromSide, FlyBrood_MoveHoming, state FlyBrood_WaitPathDone
; ---------------------------------------------------------------------------
FlyBrood_Init_Case4:
	move.l	$8(a4),d7
	asr.l	#$8,d7
	lea.l	$3712(a5),a0
	move.l	$2(a0),-(a7)
	pea.l	$8C(a4)
	jsr	$3ED2(a5)	; -> AiScript_Set
	ext.l	d7
	move.w	g_CameraX(a5),d0
	ext.l	d0
	add.l	#$A0,d0
	cmp.l	d7,d0
	addq.w	#$8,a7
	ble.s	loc_134B7A
	moveq	#$1,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	jsr	FlyBrood_EnterFromSide(pc)
	addq.w	#$8,a7
	bra.s	loc_134B86
loc_134B7A:
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	jsr	FlyBrood_EnterFromSide(pc)
	addq.w	#$8,a7
loc_134B86:
	lea.l	FlyBrood_WaitPathDone(pc),a0
	move.l	a0,$64(a4)
	move.l	a0,$5C(a4)
	lea.l	FlyBrood_MoveHoming(pc),a0
	move.l	a0,$9E(a4)
	lea.l	$36DA(a5),a0
	move.l	$2(a0),$A2(a4)
	bra.s	FlyBrood_Init_Tail
loc_134BA6:
	lea.l	$371A(a5),a0
	move.l	$2(a0),-(a7)
	pea.l	$8C(a4)
	jsr	$3ED2(a5)	; -> AiScript_Set
	addq.w	#$8,a7
	bra.s	FlyBrood_Init_Tail
loc_134BBA:
	lea.l	$3722(a5),a0
	move.l	$2(a0),-(a7)
	pea.l	$8C(a4)
	jsr	$3ED2(a5)	; -> AiScript_Set
	addq.w	#$8,a7
	bra.s	FlyBrood_Init_Tail
loc_134BCE:
	lea.l	$372A(a5),a0
	move.l	$2(a0),-(a7)
	pea.l	$8C(a4)
	jsr	$3ED2(a5)	; -> AiScript_Set
	move.w	#$3,$A8(a4)
	addq.w	#$8,a7
