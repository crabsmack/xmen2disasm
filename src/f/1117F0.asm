; ---------------------------------------------------------------------------
; Deathbird_SetMoveMode_Case1 - Deathbird_SetMoveMode case 1: fall (gravity 4, keep a little x speed), dying animation
; In:  inside Deathbird_SetMoveMode
; Out: -
; Evidence: Sw_1117A0 target; used when health runs out
; ---------------------------------------------------------------------------
Deathbird_SetMoveMode_Case1:
	clr.w	$18(a4)
	clr.w	$20(a4)
	tst.w	$16(a4)
	sgt.b	d3
	neg.b	d3
	beq.s	loc_11180C
	moveq	#$9,d0
	and.w	$16(a4),d0
	ext.l	d0
	bra.s	loc_11181A
loc_11180C:
	moveq	#$9,d0
	and.w	$16(a4),d0
	moveq	#$0,d1
	move.w	d0,d1
	neg.l	d1
	move.l	d1,d0
loc_11181A:
	move.w	d0,$16(a4)
	clr.w	$1E(a4)
	move.w	#$4,$20(a4)
	move.b	#$3,$AE(a4)
	lea.l	$2AEA(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E4A(a5)	; -> Obj_ChangeAnim
	addq.w	#$8,a7
	bra.w	$111BA0
