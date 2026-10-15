; ---------------------------------------------------------------------------
; SmallBrood_Init_Case1 - SmallBrood_Init switch case 1: kamikaze script jt[$142A], wait for a player first (SmallBrood_StateWaitForPlayer)
; Evidence: sets +$5C/+$64 = SmallBrood_StateWaitForPlayer, sub_15A6DE(this+$96, jt[$142A]); +$B2 bit 0 = run left when +$E > 0
; Found: runtime: executed in 1 run(s) (tas)
; ---------------------------------------------------------------------------
SmallBrood_Init_Case1:
	lea.l	SmallBrood_StateWaitForPlayer(pc),a0
	move.l	a0,$5C(a4)
	lea.l	SmallBrood_StateWaitForPlayer(pc),a0
	move.l	a0,$64(a4)
	lea.l	$122A(a5),a0
	move.l	$2(a0),-(a7)
	pea.l	$96(a4)
	jsr	$3ED2(a5)	; -> sub_15A6DE
	tst.b	d6
	addq.w	#$8,a7
	beq.s	SmallBrood_Init_SetYLimits
	ori.w	#$1,$B2(a4)
	bra.s	SmallBrood_Init_SetYLimits
loc_0843FA:
	lea.l	$1232(a5),a0
	move.l	$2(a0),-(a7)
	pea.l	$96(a4)
	jsr	$3ED2(a5)	; -> sub_15A6DE
	addq.w	#$8,a7
	bra.s	SmallBrood_Init_SetYLimits
loc_08440E:
	lea.l	$123A(a5),a0
	move.l	$2(a0),-(a7)
	pea.l	$96(a4)
	jsr	$3ED2(a5)	; -> sub_15A6DE
	addq.w	#$8,a7
