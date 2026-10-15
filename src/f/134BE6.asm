; ---------------------------------------------------------------------------
; FlyBrood_Init_Tail - FlyBrood_Init common tail: speed (+$AA), trigger side (+$A7), scene-specific animation
; In:  inside FlyBrood_Init
; Out: -
; Evidence: 3 branch sources; scene id $FFC6A4 vs g_SceneIndex
; ---------------------------------------------------------------------------
FlyBrood_Init_Tail:
	move.w	$A(a3),d7
	beq.s	loc_134BF6
	ext.l	d7
	move.l	d7,d0
	lsl.l	#$8,d0
	move.w	d0,$AA(a4)
loc_134BF6:
	move.w	$C(a3),d7
	beq.s	loc_134C02
	move.b	#$1,$A7(a4)
loc_134C02:
	moveq	#$0,d0
	move.b	g_ScnUnused3B5C(a5),d0
	cmp.w	g_SceneIndex(a5),d0
	beq.s	loc_134C20
	lea.l	$36C2(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E4A(a5)	; -> Obj_ChangeAnim
	addq.w	#$8,a7
	bra.s	loc_134C30
loc_134C20:
	lea.l	$36D2(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E4A(a5)	; -> Obj_ChangeAnim
	addq.w	#$8,a7
loc_134C30:
	movem.l	-$C(a6),d7/a3-a4
	unlk	a6
	rts
